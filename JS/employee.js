/**
 * Employee Dashboard Handler
 * Manages products and orders
 */

// ========================================
// TAB NAVIGATION
// ========================================

function initEmployeeTabs() {
    const tabBtns = document.querySelectorAll('.tab-btn');
    const tabContents = document.querySelectorAll('.tab-content');

    tabBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const tabName = btn.getAttribute('data-tab');

            // Remove active class from all
            tabBtns.forEach(b => b.classList.remove('active'));
            tabContents.forEach(c => c.classList.remove('active'));

            // Add active class to clicked
            btn.classList.add('active');
            document.getElementById(`${tabName}-tab`)?.classList.add('active');

            // Load data for the tab
            loadTabData(tabName);
        });
    });

    // Load initial tab data
    loadTabData('products');
}

// ========================================
// DATA LOADING
// ========================================

async function loadTabData(tabName) {
    switch (tabName) {
        case 'products':
            await loadProducts();
            break;
        case 'orders':
            await loadOrders();
            break;
    }
}

async function loadProducts() {
    const tbody = document.getElementById('products-tbody');
    if (!tbody) return;

    tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem">Loading products...</td></tr>';

    try {
        const data = await ProductsAPI.getProducts();

        if (!data.products || data.products.length === 0) {
            tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No products found</td></tr>';
            return;
        }

        tbody.innerHTML = '';
        data.products.forEach(product => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.category_name || 'N/A'}</td>
                <td>${formatPHP(product.base_price)}</td>
                <td>${product.variants?.length || 0}</td>
                <td>
                    <button class="btn btn-sm" onclick="viewProduct(${product.id})">View</button>
                    <button class="btn btn-sm" onclick="editProduct(${product.id})">Edit</button>
                </td>
            `;
            tbody.appendChild(row);
        });
    } catch (error) {
        console.error('Failed to load products:', error);
        tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load products</td></tr>';
    }
}

async function loadOrders() {
    const tbody = document.getElementById('orders-tbody');
    if (!tbody) return;

    try {
        const data = await OrdersAPI.getOrders();

        if (!data.orders || data.orders.length === 0) {
            tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No orders found</td></tr>';
            return;
        }

        tbody.innerHTML = '';
        data.orders.forEach(order => {
            const row = document.createElement('tr');
            const createdDate = new Date(order.created_at).toLocaleDateString();
            row.innerHTML = `
                <td>${order.order_number}</td>
                <td>${order.customer_name}</td>
                <td>${order.customer_email}</td>
                <td><span class="badge" style="background:#3b82f6">${order.status}</span></td>
                <td>${formatPHP(order.total)}</td>
                <td>
                    <button class="btn btn-sm" onclick="viewOrder(${order.id})">View</button>
                </td>
            `;
            tbody.appendChild(row);
        });
    } catch (error) {
        console.error('Failed to load orders:', error);
        tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load orders</td></tr>';
    }
}

// ========================================
// PRODUCT ACTIONS
// ========================================

function viewProduct(productId) {
    alert(`View product ${productId} - Feature not yet implemented`);
}

function editProduct(productId) {
    alert(`Edit product ${productId} - Feature not yet implemented`);
}

// ========================================
// ORDER ACTIONS
// ========================================

function viewOrder(orderId) {
    alert(`View order ${orderId} - Feature not yet implemented`);
}

// ========================================
// MODAL HANDLERS
// ========================================

function initModals() {
    // Close modal buttons
    document.querySelectorAll('.modal-close, [data-action="cancel"]').forEach(btn => {
        btn.addEventListener('click', () => {
            btn.closest('.modal')?.classList.remove('active');
        });
    });

    // Add product button
    document.getElementById('add-product-btn')?.addEventListener('click', () => {
        alert('Add product feature not yet implemented');
    });
}

// ========================================
// INITIALIZATION
// ========================================

function initEmployeePage() {
    // Update welcome message
    const user = getUserData();
    if (user) {
        const welcomeEl = document.getElementById('employee-welcome');
        if (welcomeEl) {
            welcomeEl.textContent = `Welcome, ${user.first_name} ${user.last_name}`;
        }
    }

    initEmployeeTabs();
    initModals();
}

// Make functions globally available
window.initEmployeePage = initEmployeePage;
window.viewProduct = viewProduct;
window.editProduct = editProduct;
window.viewOrder = viewOrder;

// Auto-initialize
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        if (document.querySelector('.admin-container') && document.getElementById('employee-welcome')) {
            initEmployeePage();
        }
    });
} else {
    if (document.querySelector('.admin-container') && document.getElementById('employee-welcome')) {
        initEmployeePage();
    }
}
