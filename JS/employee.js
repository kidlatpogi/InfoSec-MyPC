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

            // Compute the correct API path
            const apiPath = (window.router && window.router.baseRoot) 
              ? window.router.baseRoot + '/HTML_PHP/auth.php?action=verifyPassword'
              : '/InfoSec-MyPC/HTML_PHP/auth.php?action=verifyPassword';
            
            // Verify password via API
            fetch(apiPath, {
                method: 'POST',
                credentials: 'include',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'password=' + encodeURIComponent(password)
            })
                .then(res => {
                    // Check if response is actually JSON
                    const contentType = res.headers.get('content-type');
                    if (!contentType || !contentType.includes('application/json')) {
                        throw new Error(`Expected JSON response but got ${contentType || 'unknown content type'}`);
                    }
                    return res.text().then(text => {
                        try {
                            return JSON.parse(text);
                        } catch (e) {
                            console.error('Response text:', text.substring(0, 500));
                            throw new Error(`Invalid JSON response: ${text.substring(0, 200)}`);
                        }
                    });
                })
                .then(data => {
                    passwordModal.remove();
                    if (data.success) {
                        resolve(true);
                    } else {
                        alert('Incorrect password: ' + (data.error || 'Unknown error'));
                        resolve(false);
                    }
                })
                .catch(error => {
                    passwordModal.remove();
                    console.error('Password verification failed:', error);
                    alert('Error verifying password: ' + error.message);
                    resolve(false);
                });
        });
    });
}

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

            // Save the active tab to localStorage
            localStorage.setItem('employee_active_tab', tabName);

            // Load data for the tab
            loadTabData(tabName);
        });
    });

    // Restore the last active tab from localStorage, or default to 'products'
    const savedTab = localStorage.getItem('employee_active_tab') || 'products';

    // Find and activate the saved tab
    const savedTabBtn = document.querySelector(`.tab-btn[data-tab="${savedTab}"]`);
    if (savedTabBtn) {
        // Remove active from all first
        tabBtns.forEach(b => b.classList.remove('active'));
        tabContents.forEach(c => c.classList.remove('active'));

        // Activate the saved tab
        savedTabBtn.classList.add('active');
        document.getElementById(`${savedTab}-tab`)?.classList.add('active');
        loadTabData(savedTab);
    } else {
        // Fallback to products if saved tab doesn't exist
        loadTabData('products');
    }

    // Mark tabs as ready to prevent flicker
    document.body.classList.add('tabs-ready');

    // Setup search and filter listeners
    initEmployeeSearch();
}


// ========================================
// SEARCH AND FILTERS
// ========================================

function initEmployeeSearch() {
    // Product search
    const productSearch = document.getElementById('product-search');
    if (productSearch) {
        productSearch.addEventListener('input', () => {
            filterProductsTable();
        });
    }

    // Order search
    const orderSearch = document.getElementById('order-search');
    if (orderSearch) {
        orderSearch.addEventListener('input', () => {
            filterOrdersTable();
        });
    }
}

function filterProductsTable() {
    const searchInput = document.getElementById('product-search');
    if (!searchInput) return;

    const query = searchInput.value.toLowerCase();
    const rows = document.querySelectorAll('#products-tbody tr');

    rows.forEach(row => {
        const id = row.cells[0]?.textContent.toLowerCase() || '';
        const name = row.cells[1]?.textContent.toLowerCase() || '';
        const category = row.cells[2]?.textContent.toLowerCase() || '';
        const price = row.cells[3]?.textContent.toLowerCase() || '';
        const stock = row.cells[4]?.textContent.toLowerCase() || '';
        const variants = row.cells[5]?.textContent.toLowerCase() || '';

        const matches = id.includes(query) || name.includes(query) ||
            category.includes(query) || price.includes(query) ||
            stock.includes(query) || variants.includes(query);

        row.style.display = matches ? '' : 'none';
    });
}

function filterOrdersTable() {
    const searchInput = document.getElementById('order-search');
    if (!searchInput) return;

    const query = searchInput.value.toLowerCase();
    const rows = document.querySelectorAll('#orders-tbody tr');

    rows.forEach(row => {
        const orderId = row.cells[0]?.textContent.toLowerCase() || '';
        const email = row.cells[1]?.textContent.toLowerCase() || '';
        const name = row.cells[2]?.textContent.toLowerCase() || '';
        const total = row.cells[3]?.textContent.toLowerCase() || '';
        const status = row.cells[4]?.textContent.toLowerCase() || '';

        const matches = orderId.includes(query) || email.includes(query) ||
            name.includes(query) || total.includes(query) ||
            status.includes(query);

        row.style.display = matches ? '' : 'none';
    });
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
        case 'profile':
            await loadProfileData();
            break;
    }
}

async function loadProducts() {
    const tbody = document.getElementById('products-tbody');
    if (!tbody) return;

    tbody.innerHTML = '<tr><td colspan="7" style="text-align:center;padding:2rem">Loading products...</td></tr>';

    try {
        const data = await ProductsAPI.getAllProducts();

        if (!data.products || data.products.length === 0) {
            tbody.innerHTML = '<tr><td colspan="7" style="text-align:center;padding:2rem;color:#666;">No products found</td></tr>';
            return;
        }

        tbody.innerHTML = '';
        data.products.forEach(product => {
            const row = document.createElement('tr');
            // Calculate price and stock from variants
            const variants = product.variants || [];
            const minPrice = variants.length > 0 ? Math.min(...variants.map(v => parseFloat(v.price))) : 0;
            const totalStock = variants.reduce((sum, v) => sum + parseInt(v.stock || 0), 0);

            row.innerHTML = `
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.category_name || 'N/A'}</td>
                <td>${formatPHP(minPrice)}</td>
                <td>${variants.length}</td>
                <td>${totalStock}</td>
                <td>
                    <button class="btn btn-sm" onclick="viewProduct(${product.id})">View</button>
                    <button class="btn btn-sm" onclick="editProduct(${product.id})">Edit</button>
                    <button class="btn btn-sm" onclick="editStock(${product.id}, ${totalStock})">Stock</button>
                    <button class="btn btn-sm btn-danger" onclick="deleteProduct(${product.id})">Delete</button>
                </td>
            `;
            tbody.appendChild(row);
        });
    } catch (error) {
        console.error('Failed to load products:', error);
        const errorMsg = error.message || 'Unknown error';
        tbody.innerHTML = `<tr><td colspan="7" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load products: ${errorMsg}</td></tr>`;
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

            const variants = product.variants || [];
            const variantsHTML = variants.length > 0
                ? variants.map(v => `
                    <div style="padding: 0.75rem; background: var(--surface); border-radius: 6px; margin-bottom: 0.5rem;">
                        <strong>${v.title}</strong> - ${formatPHP(v.price)} (Stock: ${v.stock})
                    </div>
                `).join('')
                : '<p style="color: var(--text-light);">No variants</p>';

            viewTitle.textContent = product.name;
            viewContent.innerHTML = `
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
                    <div>
                        ${product.image_url ? `<img src="${product.image_url}" alt="${product.name}" style="width: 100%; border-radius: 8px; margin-bottom: 1rem;">` : '<div style="background: #f0f0f0; padding: 3rem; text-align: center; border-radius: 8px; margin-bottom: 1rem;">No Image</div>'}
                        <h3 style="margin-top: 0;">Product Information</h3>
                        <div style="margin-bottom: 1rem;">
                            <strong>ID:</strong> ${product.id}
                        </div>
                        <div style="margin-bottom: 1rem;">
                            <strong>Name:</strong> ${product.name}
                        </div>
                        <div style="margin-bottom: 1rem;">
                            <strong>Category:</strong> ${product.category_name || 'N/A'}
                        </div>
                        <div style="margin-bottom: 1rem;">
                            <strong>Created:</strong> ${new Date(product.created_at).toLocaleDateString() || 'N/A'}
                        </div>
                    </div>
                    <div>
                        <h3 style="margin-top: 0;">Variants (${variants.length})</h3>
                        ${variantsHTML}
                    </div>
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

function editStock(productId, currentStock) {
    const stockModal = document.getElementById('stock-modal');
    const stockForm = document.getElementById('stock-form');
    const stockInput = document.getElementById('stock-input');
    const currentStockDisplay = document.getElementById('current-stock-display');
    const modalTitle = document.getElementById('stock-modal-title');

    // Set current stock display and input
    currentStockDisplay.textContent = currentStock;
    stockInput.value = currentStock;
    modalTitle.textContent = `Edit Product Stock (ID: ${productId})`;

    // Show modal
    stockModal.classList.add('open');

    // Handle form submission
    stockForm.onsubmit = async (e) => {
        e.preventDefault();

        const newStock = parseInt(stockInput.value, 10);

        if (isNaN(newStock) || newStock < 0) {
            alert('Please enter a valid stock quantity');
            return;
        }

        try {
            await ProductsAPI.updateProductStock(productId, newStock);
            stockModal.classList.remove('open');
            alert('Stock updated successfully');
            // Reload products table
            await loadProducts();
        } catch (error) {
            alert('Error updating stock: ' + error.message);
        }
    };
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

function initProfileHandlers() {
    const profileForm = document.getElementById('profile-edit-form');
    if (profileForm) {
        profileForm.addEventListener('submit', handleProfileSubmit);
    }
}

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

            // Validation
            if (!name) {
                alert('Product title is required');
                return;
            }

            if (!category) {
                alert('Category is required');
                return;
            }

            if (isNaN(basePrice) || basePrice < 0) {
                alert('Please enter a valid price');
                return;
            }

            const variantsStr = document.getElementById('product-variants').value.trim();
            if (variantsStr) {
                try {
                    variants = JSON.parse(variantsStr);
                    // Validate variants structure
                    if (!Array.isArray(variants)) {
                        alert('Variants must be an array');
                        return;
                    }
                } catch (e) {
                    alert('Invalid JSON format for variants. Example: [{"title":"8GB","price":5000,"stock":10}]');
                    return;
                }
            }

            try {
                const result = await ProductsAPI.createProduct(name, category, basePrice, variants);
                alert(result.message || 'Product created successfully!');
                productModal.classList.remove('open');
                productForm.reset();
                await loadProducts(); // Reload the products table
            } catch (error) {
                alert('Error creating product: ' + error.message);
            }
        };
    });
}

// ========================================
// PROFILE MANAGEMENT
// ========================================

async function loadProfileData() {
    // Force refresh from localStorage
    const userDataString = localStorage.getItem('mypc_user_data');
    console.log('[loadProfileData] Raw localStorage:', userDataString);

    const user = userDataString ? JSON.parse(userDataString) : null;
    console.log('[loadProfileData] Parsed user data:', user);

    if (!user) {
        window.location.href = 'login.html';
        return;
    }

    // Populate form with current user data
    // Combine first_name and last_name into full_name
    const fullName = [user.first_name || '', user.last_name || ''].filter(Boolean).join(' ');
    console.log('[loadProfileData] Setting full name to:', fullName);

    const fullNameInput = document.getElementById('profile-full-name');
    if (fullNameInput) {
        fullNameInput.value = fullName;
        console.log('[loadProfileData] Full name input updated to:', fullNameInput.value);
    } else {
        console.error('[loadProfileData] Full name input not found!');
    }

    const emailInput = document.getElementById('profile-email');
    if (emailInput) {
        emailInput.value = user.email || '';
    }

    const phoneInput = document.getElementById('profile-phone');
    if (phoneInput) {
        phoneInput.value = user.phone || '';
    }

    // Clear password fields
    document.getElementById('profile-current-password').value = '';
    document.getElementById('profile-new-password').value = '';
    document.getElementById('profile-confirm-password').value = '';
}

function resetProfileForm() {
    document.getElementById('profile-edit-form').reset();
    loadProfileData();
}

function handleProfileSubmit(e) {
    e.preventDefault();

    const fullName = document.getElementById('profile-full-name').value.trim();
    const currentPassword = document.getElementById('profile-current-password').value;
    const newPassword = document.getElementById('profile-new-password').value;
    const confirmPassword = document.getElementById('profile-confirm-password').value;

    if (!fullName) {
        alert('Full name is required');
        return;
    }

    // Split full name into first and last name
    const nameParts = fullName.split(' ');
    const firstName = nameParts[0] || '';
    const lastName = nameParts.slice(1).join(' ') || '';

    // If changing password, validate
    if (newPassword || confirmPassword || currentPassword) {
        if (!currentPassword) {
            alert('Please enter your current password');
            return;
        }
        if (!newPassword) {
            alert('Please enter a new password');
            return;
        }
        if (newPassword !== confirmPassword) {
            alert('New passwords do not match');
            return;
        }
        if (newPassword.length < 6) {
            alert('Password must be at least 6 characters long');
            return;
        }
    }

    const updates = {
        first_name: firstName,
        last_name: lastName,
        phone: document.getElementById('profile-phone').value.trim()
    };

    if (newPassword) {
        updates.current_password = currentPassword;
        updates.new_password = newPassword;
    }

    updateUserProfile(updates);
}

async function updateUserProfile(updates) {
    try {
        const response = await fetch('/HTML_PHP/auth.php?action=updateProfile', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                first_name: updates.first_name,
                last_name: updates.last_name,
                phone: updates.phone,
                current_password: updates.current_password || '',
                new_password: updates.new_password || ''
            })
        });

        const responseText = await response.text();
        console.log('Response text:', responseText);

        let data;
        try {
            data = JSON.parse(responseText);
        } catch (e) {
            console.error('Failed to parse response:', e);
            alert('Server error. Please try again.');
            return;
        }

        console.log('Response data:', data);

        if (data.success) {
            // Update localStorage with fresh data
            const user = getUserData();
            user.first_name = updates.first_name;
            user.last_name = updates.last_name;
            user.phone = updates.phone;
            localStorage.setItem('user_data', JSON.stringify(user));

            // Immediately update the welcome message
            const fullNameDisplay = `${updates.first_name} ${updates.last_name}`;

            const welcomeEl = document.getElementById('employee-welcome');
            if (welcomeEl) {
                welcomeEl.textContent = `Welcome, ${updates.first_name} ${updates.last_name}`;
            }

            // Clear password fields only
            document.getElementById('profile-current-password').value = '';
            document.getElementById('profile-new-password').value = '';
            document.getElementById('profile-confirm-password').value = '';

            // Update form with new values
            document.getElementById('profile-full-name').value = fullNameDisplay;
            document.getElementById('profile-phone').value = updates.phone;

            console.log('Updated employee profile UI with:', fullNameDisplay);

            alert('Profile updated successfully!');
        } else {
            alert(data.message || 'Error updating profile');
        }
    } catch (error) {
        console.error('Error updating profile:', error);
        alert('Error updating profile');
    }
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

    // Prevent back button from leaving dashboard
    preventBackButton();

    initEmployeeTabs();
    initModals();
    initLogout();
    initProfileHandlers();
}

// ========================================
// PREVENT BACK BUTTON
// ========================================

function preventBackButton() {
    // Push a dummy state to prevent going back
    history.pushState(null, null, location.href);

    // Listen for back button press
    window.addEventListener('popstate', function (event) {
        // Push state again to prevent going back
        history.pushState(null, null, location.href);

        // Optional: Show a message
        // alert('Please use the Logout button to exit the dashboard.');
    });
}


// Wrapper function for router compatibility
function initializeEmployee() {
    return initEmployeePage();
}


// ========================================
// SESSION VERIFICATION (PREVENT BACK BUTTON CACHE)
// ========================================

// Hide content initially to prevent flicker
document.body.style.opacity = '0';
document.body.style.transition = 'opacity 0.15s';

async function verifySession() {
    try {
        const userData = getUserData();
        if (!userData) {
            window.location.replace('/');
            return false;
        }

        const response = await AuthAPI.getCurrentUser();
        if (!response || !response.user) {
            clearUserSession();
            window.location.replace('/');
            return false;
        }

        document.body.style.opacity = '1';
        return true;
    } catch (error) {
        clearUserSession();
        window.location.replace('/');
        return false;
    }
}

verifySession();
document.addEventListener('visibilitychange', function () {
    if (!document.hidden) {
        document.body.style.opacity = '0';
        verifySession();
    }
});
window.addEventListener('focus', function () {
    document.body.style.opacity = '0';
    verifySession();
});

// Make functions globally available
window.initEmployeePage = initEmployeePage;
window.initializeEmployee = initializeEmployee;
window.editProduct = editProduct;
window.editStock = editStock;
window.deleteProduct = deleteProduct;
window.viewOrder = viewOrder;
window.resetProfileForm = resetProfileForm;

// Auto-init removed to prevent double initialization by router
