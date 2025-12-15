/**
 * API Helper Functions
 * Centralized API calls to backend
 */

// Compute API_BASE dynamically each time (router might not be initialized yet)
function getAPIBase() {
    if (typeof window !== 'undefined' && window.router && window.router.baseRoot) {
        return window.router.baseRoot + '/HTML_PHP';
    } else if (typeof window !== 'undefined') {
        const pathname = window.location.pathname;
        const directory = pathname.substring(0, pathname.lastIndexOf('/'));
        return directory + '/HTML_PHP';
    }
    return '/HTML_PHP';
}

// Helper function to make API calls
async function apiCall(endpoint, options = {}) {
    const API_BASE = getAPIBase();
    const url = `${API_BASE}/${endpoint}`;

    try {
        const response = await fetch(url, {
            ...options,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                ...options.headers
            }
        });

        // Get response text first
        const text = await response.text();

        // Try to parse as JSON
        let data;
        try {
            data = JSON.parse(text);
        } catch (parseError) {
            console.error('JSON Parse Error:', parseError);
            console.error('Response text:', text);
            throw new Error(`Server returned invalid JSON. Response: ${text.substring(0, 200)}`);
        }

        if (!data.success) {
            throw new Error(data.error || 'API request failed');
        }

        return data;
    } catch (error) {
        console.error(`API Error (${endpoint}):`, error);
        throw error;
    }
}

// Convert object to URL-encoded string
function toFormData(obj) {
    return Object.keys(obj)
        .map(key => `${encodeURIComponent(key)}=${encodeURIComponent(obj[key])}`)
        .join('&');
}

// ========================================
// AUTHENTICATION API
// ========================================

const AuthAPI = {
    // Register new user
    async register(email, password, firstName, lastName, phone = '') {
        const body = toFormData({
            action: 'register',
            email,
            password,
            first_name: firstName,
            last_name: lastName,
            phone
        });

        return await apiCall('auth.php', {
            method: 'POST',
            body
        });
    },

    // Login user
    async login(email, password) {
        const body = toFormData({
            action: 'login',
            email,
            password
        });

        return await apiCall('auth.php', {
            method: 'POST',
            body
        });
    },

    // Logout user
    async logout() {
        const body = toFormData({
            action: 'logout'
        });

        return await apiCall('auth.php', {
            method: 'POST',
            body
        });
    },

    // Get current user
    async getCurrentUser() {
        return await apiCall('auth.php?action=current');
    }
};

// ========================================
// PRODUCTS API
// ========================================

const ProductsAPI = {
    // Get all products with optional filters
    async getProducts(filters = {}) {
        const params = new URLSearchParams();

        if (filters.category) params.append('category', filters.category);
        if (filters.search) params.append('search', filters.search);
        if (filters.page) params.append('page', filters.page);
        if (filters.limit) params.append('limit', filters.limit);

        const query = params.toString();
        return await apiCall(`products.php${query ? '?' + query : ''}`);
    },

    // Get single product by ID or slug
    async getProduct(id) {
        return await apiCall(`products.php?id=${encodeURIComponent(id)}`);
    },

    // Get all categories
    async getCategories() {
        return await apiCall('products.php?action=categories');
    },

    // Get all products (for admin/employee dashboards)
    async getAllProducts() {
        return await apiCall('management.php?action=getProducts');
    },

    // Create new product
    async createProduct(name, category, basePrice, variants = []) {
        const body = toFormData({
            action: 'createProduct',
            name,
            category,
            base_price: basePrice,
            variants: JSON.stringify(variants)
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    // Update product
    async updateProduct(productId, name, category, basePrice, variants = []) {
        const body = toFormData({
            action: 'updateProduct',
            product_id: productId,
            name,
            category,
            base_price: basePrice,
            variants: JSON.stringify(variants)
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    // Delete product
    async deleteProduct(productId) {
        return await apiCall(`management.php?action=deleteProduct&product_id=${productId}`, {
            method: 'POST'
        });
    },

    // Update product stock
    async updateProductStock(productId, stockQuantity) {
        const body = toFormData({
            action: 'updateProductStock',
            product_id: productId,
            stock_quantity: stockQuantity
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    // Update variant stock
    async updateVariantStock(variantId, stock) {
        const body = toFormData({
            action: 'updateVariantStock',
            variant_id: variantId,
            stock: stock
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    }
};

// ========================================
// CART API
// ========================================

const CartAPI = {
    // Get cart
    async getCart() {
        return await apiCall('cart.php');
    },

    // Add item to cart
    async addToCart(productId, quantity = 1, variantId = null) {
        const params = {
            action: 'add',
            product_id: productId,
            quantity: quantity
        };

        // Only add variant_id if it's a valid number
        if (variantId !== null && variantId !== undefined && variantId !== '') {
            params.variant_id = variantId;
        }

        const body = toFormData(params);

        return await apiCall('cart.php', {
            method: 'POST',
            body
        });
    },

    // Update cart item quantity
    async updateCartItem(cartItemId, quantity) {
        const body = toFormData({
            action: 'update',
            cart_item_id: cartItemId,
            quantity
        });

        return await apiCall('cart.php', {
            method: 'POST',
            body
        });
    },

    // Remove item from cart
    async removeFromCart(cartItemId) {
        const body = toFormData({
            action: 'remove',
            cart_item_id: cartItemId
        });

        return await apiCall('cart.php', {
            method: 'POST',
            body
        });
    },

    // Clear cart
    async clearCart() {
        const body = toFormData({
            action: 'clear'
        });

        return await apiCall('cart.php', {
            method: 'POST',
            body
        });
    }
};

// ========================================
// ORDERS API
// ========================================

const OrdersAPI = {
    // Create order
    async createOrder(addressId, paymentMethod, notes = '', selectedCartItemIds = []) {
        const body = toFormData({
            action: 'create',
            address_id: addressId,
            payment_method: paymentMethod,
            ...(notes && { notes }),
            ...(selectedCartItemIds && selectedCartItemIds.length > 0 && { selected_items: JSON.stringify(selectedCartItemIds) })
        });

        return await apiCall('orders.php', {
            method: 'POST',
            body
        });
    },

    // Get all orders
    async getOrders() {
        return await apiCall('orders.php');
    },

    // Get single order
    async getOrder(orderId) {
        return await apiCall(`orders.php?id=${orderId}`);
    },

    // Cancel order
    async cancelOrder(orderId) {
        const body = toFormData({
            action: 'cancel',
            order_id: orderId
        });

        return await apiCall('orders.php', {
            method: 'POST',
            body
        });
    },
    
    // Delete order (admin/employee only)
    async deleteOrder(orderId, password) {
        const body = toFormData({
            action: 'delete',
            order_id: orderId
        });

        return await apiCall('orders.php', {
            method: 'POST',
            body
        });
    },
    
    // Update order status (admin only)
    async updateOrderStatus(orderId, status) {
        const body = toFormData({
            action: 'update_status',
            order_id: orderId,
            status: status
        });

        return await apiCall('orders.php', {
            method: 'POST',
            body
        });
    }
};

// ========================================
// MANAGEMENT API (Admin/Superadmin)
// ========================================

const ManagementAPI = {
    // ===== ADMINS =====
    async getAdmins() {
        return await apiCall('management.php?action=getAdmins');
    },

    async createAdmin(email, password, firstName, lastName, phone = '') {
        const body = toFormData({
            action: 'createAdmin',
            email,
            password,
            first_name: firstName,
            last_name: lastName,
            phone
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    async updateAdmin(adminId, updates) {
        const body = toFormData({
            action: 'updateAdmin',
            admin_id: adminId,
            ...updates
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    async deleteAdmin(adminId) {
        const body = toFormData({
            action: 'deleteAdmin',
            admin_id: adminId
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    // ===== USERS =====
    async getUsers() {
        return await apiCall('management.php?action=getUsers');
    },

    async createUser(email, password, firstName, lastName, phone = '') {
        const body = toFormData({
            action: 'createUser',
            email,
            password,
            first_name: firstName,
            last_name: lastName,
            phone
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    async updateUser(userId, updates) {
        const body = toFormData({
            action: 'updateUser',
            user_id: userId,
            ...updates
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    async deleteUser(userId) {
        const body = toFormData({
            action: 'deleteUser',
            user_id: userId
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    // ===== EMPLOYEES =====
    async getEmployees() {
        return await apiCall('management.php?action=getEmployees');
    },

    async createEmployee(email, password, firstName, lastName, phone = '') {
        const body = toFormData({
            action: 'createEmployee',
            email,
            password,
            first_name: firstName,
            last_name: lastName,
            phone
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    async updateEmployee(employeeId, updates) {
        const body = toFormData({
            action: 'updateEmployee',
            employee_id: employeeId,
            ...updates
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    async deleteEmployee(employeeId) {
        const body = toFormData({
            action: 'deleteEmployee',
            employee_id: employeeId
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    }
};

// ========================================
// ADDRESSES API
// ========================================

const AddressesAPI = {
    async getAddresses(userId = null) {
        const query = userId ? `?action=getAddresses&user_id=${userId}` : '?action=getAddresses';
        return await apiCall(`management.php${query}`);
    },

    async addAddress(recipientName, phone, addressLine1, city, postalCode, addressLine2 = '', label = '', isDefault = false) {
        const body = toFormData({
            action: 'addAddress',
            label,
            phone,
            line1: addressLine1,
            line2: addressLine2,
            city,
            postal_code: postalCode,
            country: 'Philippines',
            is_default: isDefault ? 1 : 0
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    async updateAddress(addressId, updates) {
        const body = toFormData({
            action: 'updateAddress',
            address_id: addressId,
            ...updates
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    },

    async deleteAddress(addressId) {
        const body = toFormData({
            action: 'deleteAddress',
            address_id: addressId
        });
        return await apiCall('management.php', {
            method: 'POST',
            body
        });
    }
};

// Export for use in other scripts
window.AuthAPI = AuthAPI;
window.ProductsAPI = ProductsAPI;
window.CartAPI = CartAPI;
window.OrdersAPI = OrdersAPI;
window.ManagementAPI = ManagementAPI;
window.AddressesAPI = AddressesAPI;

// ========================================
// AUDIT API (Superadmin only)
// ========================================

const AuditAPI = {
    async getAuditLogs(limit = 100, offset = 0) {
        return await apiCall(`management.php?action=getAuditLogs&limit=${limit}&offset=${offset}`);
    }
};

window.AuditAPI = AuditAPI;
