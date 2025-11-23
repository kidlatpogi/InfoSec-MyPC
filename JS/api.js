/**
 * API Helper Functions
 * Centralized API calls to backend
 */

const API_BASE = '/HTML_PHP';

// Helper function to make API calls
async function apiCall(endpoint, options = {}) {
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
        const body = toFormData({
            action: 'add',
            product_id: productId,
            quantity,
            ...(variantId && { variant_id: variantId })
        });

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
    async createOrder(addressId, paymentMethod, notes = '') {
        const body = toFormData({
            action: 'create',
            address_id: addressId,
            payment_method: paymentMethod,
            ...(notes && { notes })
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
    }
};

// Export for use in other scripts
window.AuthAPI = AuthAPI;
window.ProductsAPI = ProductsAPI;
window.CartAPI = CartAPI;
window.OrdersAPI = OrdersAPI;
