/**
 * Employee Dashboard Handler
 * Manages products and orders
 */

// ========================================
// CONFIRMATION DIALOG HELPER
// ========================================

function showConfirmDialog(message, onConfirm) {
    const confirmModal = document.getElementById('confirm-modal');
    const confirmMessage = document.getElementById('confirm-message');
    const confirmDeleteBtn = document.getElementById('confirm-delete-btn');
    
    confirmMessage.textContent = message;
    confirmModal.classList.add('open');
    
    // Create new button to avoid event listener accumulation
    const newDeleteBtn = confirmDeleteBtn.cloneNode(true);
    confirmDeleteBtn.parentNode.replaceChild(newDeleteBtn, confirmDeleteBtn);
    
    newDeleteBtn.addEventListener('click', async () => {
        confirmModal.classList.remove('open');
        await onConfirm();
    });
    
    // Close button
    const closeBtn = confirmModal.querySelector('.modal-close');
    const cancelBtn = confirmModal.querySelector('[data-action="cancel"]');
    
    const closeHandler = () => confirmModal.classList.remove('open');
    
    if (closeBtn) {
        closeBtn.onclick = closeHandler;
    }
    if (cancelBtn) {
        cancelBtn.onclick = closeHandler;
    }
}

// ========================================
// PASSWORD VERIFICATION
// ========================================

async function verifyPassword() {
    return new Promise((resolve) => {
        // Create a password modal instead of prompt for security
        const passwordModal = document.createElement('div');
        passwordModal.className = 'modal open';
        passwordModal.style.position = 'fixed';
        passwordModal.style.top = '0';
        passwordModal.style.left = '0';
        passwordModal.style.right = '0';
        passwordModal.style.bottom = '0';
        passwordModal.style.backgroundColor = 'rgba(0,0,0,0.5)';
        passwordModal.style.display = 'flex';
        passwordModal.style.alignItems = 'center';
        passwordModal.style.justifyContent = 'center';
        passwordModal.style.zIndex = '9999';
        
        passwordModal.innerHTML = `
            <div style="background: white; padding: 2rem; border-radius: 8px; min-width: 300px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
                <h3>Verify Password</h3>
                <p>Enter your password to continue:</p>
                <input type="password" id="password-verify-input" style="width: 100%; padding: 8px; margin: 1rem 0; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box;" autofocus>
                <div style="display: flex; gap: 1rem; justify-content: flex-end; margin-top: 1.5rem;">
                    <button onclick="this.closest('.modal').remove()" style="padding: 8px 16px; border: 1px solid #ddd; background: #f5f5f5; border-radius: 4px; cursor: pointer;">Cancel</button>
                    <button id="password-verify-btn" style="padding: 8px 16px; background: #3b82f6; color: white; border: none; border-radius: 4px; cursor: pointer;">Verify</button>
                </div>
            </div>
        `;
        
        document.body.appendChild(passwordModal);
        
        const passwordInput = document.getElementById('password-verify-input');
        const verifyBtn = document.getElementById('password-verify-btn');
        
        // Handle Enter key
        passwordInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') verifyBtn.click();
        });
        
        // Handle cancel
        passwordModal.addEventListener('click', (e) => {
            if (e.target === passwordModal) {
                passwordModal.remove();
                resolve(false);
            }
        });
        
        // Handle verify button
        verifyBtn.addEventListener('click', async () => {
            const password = passwordInput.value;
            if (!password) {
                alert('Please enter your password');
                return;
            }
            
            // Verify password via API
            fetch('/HTML_PHP/auth.php?action=verifyPassword', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    password: password
                })
            })
            .then(res => res.json())
            .then(data => {
                passwordModal.remove();
                if (data.success) {
                    resolve(true);
                } else {
                    alert('Incorrect password');
                    resolve(false);
                }
            })
            .catch(error => {
                passwordModal.remove();
                console.error('Password verification failed:', error);
                alert('Error verifying password');
                resolve(false);
            });
        });
    });
}

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
        const data = await ProductsAPI.getAllProducts();

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
                    <button class="btn btn-sm btn-danger" onclick="deleteProduct(${product.id})">Delete</button>
                </td>
            `;
            tbody.appendChild(row);
        });
    } catch (error) {
        console.error('Failed to load products:', error);
        const errorMsg = error.message || 'Unknown error';
        tbody.innerHTML = `<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load products: ${errorMsg}</td></tr>`;
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
    ProductsAPI.getAllProducts()
        .then(data => {
            const product = data.products.find(p => p.id == productId);
            if (!product) {
                alert('Product not found');
                return;
            }
            
            const viewModal = document.getElementById('product-view-modal');
            const viewContent = document.getElementById('product-view-content');
            const viewTitle = document.getElementById('product-view-title');
            
            viewTitle.textContent = product.name;
            viewContent.innerHTML = `
                <div style="margin-bottom: 1.5rem;">
                    <p><strong>ID:</strong> ${product.id}</p>
                    <p><strong>Name:</strong> ${product.name}</p>
                    <p><strong>Category:</strong> ${product.category_name || 'N/A'}</p>
                    <p><strong>Base Price:</strong> ${formatPHP(product.base_price)}</p>
                    <p><strong>Variants:</strong> ${product.variants?.length || 0}</p>
                    ${product.variants ? `
                        <details>
                            <summary>Variant Details</summary>
                            <pre>${JSON.stringify(product.variants, null, 2)}</pre>
                        </details>
                    ` : ''}
                </div>
            `;
            
            viewModal.classList.add('open');
        })
        .catch(error => alert('Error loading product: ' + error.message));
}

function editProduct(productId) {
    verifyPassword().then(verified => {
        if (!verified) return;
        
        const productModal = document.getElementById('product-modal');
        const productForm = document.getElementById('product-form');
        const modalTitle = document.getElementById('product-modal-title');
        
        // Fetch the product data
        ProductsAPI.getAllProducts()
            .then(data => {
                const product = data.products.find(p => p.id == productId);
                if (!product) {
                    alert('Product not found');
                    return;
                }
                
                // Populate form
                document.getElementById('product-title').value = product.name;
                document.getElementById('product-category').value = product.category_name || '';
                document.getElementById('product-price').value = product.base_price;
                document.getElementById('product-variants').value = product.variants ? JSON.stringify(product.variants, null, 2) : '';
                
                // Set modal title
                modalTitle.textContent = `Edit Product: ${product.name}`;
                
                // Show modal
                productModal.classList.add('open');
                
                // Handle form submission
                productForm.onsubmit = async (e) => {
                    e.preventDefault();
                    const name = document.getElementById('product-title').value.trim();
                    const category = document.getElementById('product-category').value.trim();
                    const basePrice = parseFloat(document.getElementById('product-price').value);
                    let variants = [];
                    
                    const variantsStr = document.getElementById('product-variants').value.trim();
                    if (variantsStr) {
                        try {
                            variants = JSON.parse(variantsStr);
                        } catch (e) {
                            alert('Invalid JSON format for variants');
                            return;
                        }
                    }
                    
                    try {
                        await ProductsAPI.updateProduct(productId, name, category, basePrice, variants);
                        alert('Product updated successfully');
                        productModal.classList.remove('open');
                        loadProducts();
                    } catch (error) {
                        alert('Error updating product: ' + error.message);
                    }
                };
            })
            .catch(error => alert('Error loading product: ' + error.message));
    });
}

async function deleteProduct(productId) {
    const verified = await verifyPassword();
    if (!verified) return;
    
    showConfirmDialog('Are you sure you want to delete this product?', async () => {
        try {
            await ProductsAPI.deleteProduct(productId);
            alert('Product deleted successfully');
            loadProducts();
        } catch (error) {
            alert('Error deleting product: ' + error.message);
        }
    });
}

// ========================================
// ORDER ACTIONS
// ========================================

function viewOrder(orderId) {
    OrdersAPI.getOrders()
        .then(data => {
            const order = data.orders.find(o => o.id == orderId);
            if (!order) {
                alert('Order not found');
                return;
            }
            
            const viewModal = document.getElementById('order-modal');
            const viewContent = document.getElementById('order-modal-content');
            const viewTitle = document.getElementById('order-modal-title');
            
            viewTitle.textContent = `Order #${order.order_number}`;
            viewContent.innerHTML = `
                <div style="margin-bottom: 1.5rem;">
                    <p><strong>Order ID:</strong> ${order.id}</p>
                    <p><strong>Order Number:</strong> ${order.order_number}</p>
                    <p><strong>Customer:</strong> ${order.customer_name} (${order.customer_email})</p>
                    <p><strong>Total:</strong> ${formatPHP(order.total)}</p>
                    <p><strong>Status:</strong> <span class="badge" style="background:#3b82f6">${order.status}</span></p>
                    <p><strong>Date:</strong> ${new Date(order.created_at).toLocaleString()}</p>
                    ${order.items ? `
                        <details>
                            <summary>Order Items (${order.items.length})</summary>
                            <pre>${JSON.stringify(order.items, null, 2)}</pre>
                        </details>
                    ` : ''}
                </div>
            `;
            
            viewModal.classList.add('open');
        })
        .catch(error => alert('Error loading order: ' + error.message));
}

// ========================================
// LOGOUT
// ========================================

function initLogout() {
    const logoutBtn = document.getElementById('employee-logout-btn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', () => {
            doLogout(true);
        });
    }
}

// ========================================
// MODAL HANDLERS
// ========================================

function initModals() {
    // Close modal buttons
    document.querySelectorAll('.modal-close, [data-action="cancel"]').forEach(btn => {
        btn.addEventListener('click', () => {
            btn.closest('.modal')?.classList.remove('open');
        });
    });

    // Add product button
    document.getElementById('add-product-btn')?.addEventListener('click', () => {
        const productModal = document.getElementById('product-modal');
        const productForm = document.getElementById('product-form');
        const modalTitle = document.getElementById('product-modal-title');
        
        // Reset form for new entry
        productForm.reset();
        modalTitle.textContent = 'Add New Product';
        
        productModal.classList.add('open');
        
        // Handle form submission
        productForm.onsubmit = async (e) => {
            e.preventDefault();
            const name = document.getElementById('product-title').value.trim();
            const category = document.getElementById('product-category').value.trim();
            const basePrice = parseFloat(document.getElementById('product-price').value);
            let variants = [];
            
            const variantsStr = document.getElementById('product-variants').value.trim();
            if (variantsStr) {
                try {
                    variants = JSON.parse(variantsStr);
                } catch (e) {
                    alert('Invalid JSON format for variants');
                    return;
                }
            }
            
            try {
                await ProductsAPI.createProduct(name, category, basePrice, variants);
                alert('Product created successfully');
                productModal.classList.remove('open');
                loadProducts();
            } catch (error) {
                alert('Error creating product: ' + error.message);
            }
        };
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
    initLogout();
}

// Wrapper function for router compatibility
function initializeEmployee() {
    return initEmployeePage();
}

// Make functions globally available
window.initEmployeePage = initEmployeePage;
window.initializeEmployee = initializeEmployee;
window.editProduct = editProduct;
window.deleteProduct = deleteProduct;
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
