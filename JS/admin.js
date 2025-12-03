/**
 * Admin Dashboard Handler
 * Manages users, employees, products, and orders
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

function initAdminTabs() {
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
    loadTabData('users');

    // Setup search and filter listeners
    initAdminSearch();
}

// ========================================
// SEARCH AND FILTERS
// ========================================

function initAdminSearch() {
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

        const matches = id.includes(query) || name.includes(query) ||
            category.includes(query) || price.includes(query) ||
            stock.includes(query);

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
        const total = row.cells[2]?.textContent.toLowerCase() || '';
        const status = row.cells[3]?.textContent.toLowerCase() || '';

        const matches = orderId.includes(query) || email.includes(query) ||
            total.includes(query) || status.includes(query);

        row.style.display = matches ? '' : 'none';
    });
}

// ========================================
// DATA LOADING
// ========================================

async function loadTabData(tabName) {
    switch (tabName) {
        case 'users':
            await loadUsers();
            break;
        case 'employees':
            await loadEmployees();
            break;
        case 'products':
            await loadProducts();
            break;
        case 'orders':
            await loadOrders();
            break;
    }
}

async function loadUsers() {
    const tbody = document.getElementById('users-tbody');
    if (!tbody) return;

    try {
        const data = await ManagementAPI.getUsers();

        if (!data.users || data.users.length === 0) {
            tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No users found</td></tr>';
            return;
        }

        tbody.innerHTML = '';
        data.users.forEach(user => {
            const row = document.createElement('tr');
            const createdDate = new Date(user.created_at).toLocaleDateString();
            row.innerHTML = `
                <td>${user.id}</td>
                <td>${user.email}</td>
                <td>${user.full_name || 'N/A'}</td>
                <td><span class="badge" style="background:${user.status === 'active' ? '#10b981' : '#ef4444'}">${user.status || 'active'}</span></td>
                <td>${createdDate}</td>
                <td>
                    <button class="btn btn-sm" onclick="editUser(${user.id})">Edit</button>
                    <button class="btn btn-sm btn-danger" onclick="deleteUser(${user.id})">Delete</button>
                </td>
            `;
            tbody.appendChild(row);
        });
    } catch (error) {
        console.error('Failed to load users:', error);
        tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load users</td></tr>';
    }
}

async function loadEmployees() {
    const tbody = document.getElementById('employees-tbody');
    if (!tbody) return;

    try {
        const data = await ManagementAPI.getEmployees();

        if (!data.employees || data.employees.length === 0) {
            tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No employees found</td></tr>';
            return;
        }

        tbody.innerHTML = '';
        data.employees.forEach(emp => {
            const row = document.createElement('tr');
            const createdDate = new Date(emp.created_at).toLocaleDateString();
            row.innerHTML = `
                <td>${emp.id}</td>
                <td>${emp.email}</td>
                <td>${emp.full_name || 'N/A'}</td>
                <td><span class="badge" style="background:${emp.status === 'active' ? '#10b981' : '#ef4444'}">${emp.status || 'active'}</span></td>
                <td>${createdDate}</td>
                <td>
                    <button class="btn btn-sm" onclick="editEmployee(${emp.id})">Edit</button>
                    <button class="btn btn-sm btn-danger" onclick="deleteEmployee(${emp.id})">Delete</button>
                </td>
            `;
            tbody.appendChild(row);
        });
    } catch (error) {
        console.error('Failed to load employees:', error);
        tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load employees</td></tr>';
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
            // Calculate price and stock from variants
            const variants = product.variants || [];
            const minPrice = variants.length > 0 ? Math.min(...variants.map(v => parseFloat(v.price))) : 0;
            const totalStock = variants.reduce((sum, v) => sum + parseInt(v.stock || 0), 0);
            
            row.innerHTML = `
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.category_name || 'N/A'}</td>
                <td>${formatPHP(minPrice)}</td>
                <td>${totalStock}</td>
                <td>${variants.length}</td>
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
    alert(`View product ${productId} - Feature not yet implemented`);
}

function editProduct(productId) {
    alert(`Edit product ${productId} - Feature not yet implemented`);
}

// ========================================
// USER ACTIONS
// ========================================

function editUser(userId) {
    // Require password verification
    verifyPassword().then(verified => {
        if (!verified) return;

        const userModal = document.getElementById('user-modal');
        const userForm = document.getElementById('user-form');
        const modalTitle = document.getElementById('user-modal-title');

        // Fetch the user data
        ManagementAPI.getUsers()
            .then(data => {
                const user = data.users.find(u => u.id == userId);
                if (!user) {
                    alert('User not found');
                    return;
                }

                // Populate form
                document.getElementById('user-email').value = user.email;
                document.getElementById('user-email').disabled = true;
                document.getElementById('user-name').value = `${user.first_name} ${user.last_name}`;
                document.getElementById('user-password').value = '';
                document.getElementById('user-password').placeholder = 'Leave empty to keep current';

                // Set modal title
                modalTitle.textContent = `Edit User: ${user.email}`;

                // Show modal
                userModal.classList.add('open');

                // Handle form submission
                userForm.onsubmit = async (e) => {
                    e.preventDefault();
                    const fullName = document.getElementById('user-name').value.trim();
                    const nameParts = fullName.split(' ');
                    const firstName = nameParts[0];
                    const lastName = nameParts.slice(1).join(' ') || '';
                    const password = document.getElementById('user-password').value;

                    const updates = {
                        first_name: firstName,
                        last_name: lastName
                    };

                    if (password) {
                        updates.password = password;
                    }

                    try {
                        await ManagementAPI.updateUser(userId, updates);
                        alert('User updated successfully');
                        userModal.classList.remove('open');
                        loadUsers();
                    } catch (error) {
                        alert('Error updating user: ' + error.message);
                    }
                };
            })
            .catch(error => alert('Error loading user: ' + error.message));
    });
}

async function deleteUser(userId) {
    const verified = await verifyPassword();
    if (!verified) return;

    showConfirmDialog('Are you sure you want to delete this user?', async () => {
        try {
            await ManagementAPI.deleteUser(userId);
            alert('User deleted successfully');
            loadUsers();
        } catch (error) {
            alert('Error deleting user: ' + error.message);
        }
    });
}

// ========================================
// EMPLOYEE ACTIONS
// ========================================

function editEmployee(employeeId) {
    // Require password verification
    verifyPassword().then(verified => {
        if (!verified) return;

        const employeeModal = document.getElementById('employee-modal');
        const employeeForm = document.getElementById('employee-form');
        const modalTitle = document.getElementById('employee-modal-title');

        // Fetch the employee data
        ManagementAPI.getEmployees()
            .then(data => {
                const employee = data.employees.find(e => e.id == employeeId);
                if (!employee) {
                    alert('Employee not found');
                    return;
                }

                // Populate form
                document.getElementById('employee-email').value = employee.email;
                document.getElementById('employee-email').disabled = true;
                document.getElementById('employee-name').value = `${employee.first_name} ${employee.last_name}`;
                document.getElementById('employee-password').value = '';
                document.getElementById('employee-password').placeholder = 'Leave empty to keep current';

                // Set modal title
                modalTitle.textContent = `Edit Employee: ${employee.email}`;

                // Show modal
                employeeModal.classList.add('open');

                // Handle form submission
                employeeForm.onsubmit = async (e) => {
                    e.preventDefault();
                    const fullName = document.getElementById('employee-name').value.trim();
                    const nameParts = fullName.split(' ');
                    const firstName = nameParts[0];
                    const lastName = nameParts.slice(1).join(' ') || '';
                    const password = document.getElementById('employee-password').value;

                    const updates = {
                        first_name: firstName,
                        last_name: lastName
                    };

                    if (password) {
                        updates.password = password;
                    }

                    try {
                        await ManagementAPI.updateEmployee(employeeId, updates);
                        alert('Employee updated successfully');
                        employeeModal.classList.remove('open');
                        loadEmployees();
                    } catch (error) {
                        alert('Error updating employee: ' + error.message);
                    }
                };
            })
            .catch(error => alert('Error loading employee: ' + error.message));
    });
}

async function deleteEmployee(employeeId) {
    const verified = await verifyPassword();
    if (!verified) return;

    showConfirmDialog('Are you sure you want to delete this employee?', async () => {
        try {
            await ManagementAPI.deleteEmployee(employeeId);
            alert('Employee deleted successfully');
            loadEmployees();
        } catch (error) {
            alert('Error deleting employee: ' + error.message);
        }
    });
}

// ========================================
// ORDER ACTIONS
// ========================================

function viewOrder(orderId) {
    alert(`View order ${orderId} - Feature not yet implemented`);
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

function deleteProduct(productId) {
    if (confirm('Are you sure you want to delete this product?')) {
        alert(`Delete product ${productId} - Feature not yet implemented`);
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

    // Add buttons with simple prompts
    document.getElementById('add-user-btn')?.addEventListener('click', () => {
        const userModal = document.getElementById('user-modal');
        const userForm = document.getElementById('user-form');
        const modalTitle = document.getElementById('user-modal-title');

        // Reset form for new entry
        userForm.reset();
        document.getElementById('user-email').disabled = false;
        modalTitle.textContent = 'Add New User';

        userModal.classList.add('open');

        // Handle form submission
        userForm.onsubmit = async (e) => {
            e.preventDefault();
            const email = document.getElementById('user-email').value.trim();
            const fullName = document.getElementById('user-name').value.trim();
            const password = document.getElementById('user-password').value;

            if (!password) {
                alert('Password is required for new user');
                return;
            }

            if (password.length < 6) {
                alert('Password must be at least 6 characters');
                return;
            }

            const nameParts = fullName.split(' ');
            const firstName = nameParts[0];
            const lastName = nameParts.slice(1).join(' ') || '';

            try {
                await ManagementAPI.createUser(email, password, firstName, lastName);
                alert('User created successfully');
                userModal.classList.remove('open');
                loadUsers();
            } catch (error) {
                alert('Error creating user: ' + error.message);
            }
        };
    });

    document.getElementById('add-employee-btn')?.addEventListener('click', () => {
        const employeeModal = document.getElementById('employee-modal');
        const employeeForm = document.getElementById('employee-form');
        const modalTitle = document.getElementById('employee-modal-title');

        // Reset form for new entry
        employeeForm.reset();
        document.getElementById('employee-email').disabled = false;
        modalTitle.textContent = 'Add New Employee';

        employeeModal.classList.add('open');

        // Handle form submission
        employeeForm.onsubmit = async (e) => {
            e.preventDefault();
            const email = document.getElementById('employee-email').value.trim();
            const fullName = document.getElementById('employee-name').value.trim();
            const password = document.getElementById('employee-password').value;

            if (!password) {
                alert('Password is required for new employee');
                return;
            }

            if (password.length < 6) {
                alert('Password must be at least 6 characters');
                return;
            }

            const nameParts = fullName.split(' ');
            const firstName = nameParts[0];
            const lastName = nameParts.slice(1).join(' ') || '';

            try {
                await ManagementAPI.createEmployee(email, password, firstName, lastName);
                alert('Employee created successfully');
                employeeModal.classList.remove('open');
                loadEmployees();
            } catch (error) {
                alert('Error creating employee: ' + error.message);
            }
        };
    });

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
// LOGOUT
// ========================================

function initLogout() {
    document.getElementById('admin-logout-btn')?.addEventListener('click', () => {
        doLogout(true);
    });
}

// ========================================
// INITIALIZATION
// ========================================

function initAdminPage() {
    // Update welcome message
    const user = getUserData();
    if (user) {
        const welcomeEl = document.getElementById('admin-welcome');
        if (welcomeEl) {
            welcomeEl.textContent = `Welcome, ${user.first_name} ${user.last_name}`;
        }
    }

    initAdminTabs();
    initModals();
    initLogout();
}

// Wrapper function for router compatibility
function initializeAdmin() {
    return initAdminPage();
}

// Make functions globally available
window.initAdminPage = initAdminPage;
window.initializeAdmin = initializeAdmin;
window.viewProduct = viewProduct;
window.editProduct = editProduct;
window.editStock = editStock;
window.deleteProduct = deleteProduct;
window.editUser = editUser;
window.deleteUser = deleteUser;
window.editEmployee = editEmployee;
window.deleteEmployee = deleteEmployee;
window.viewOrder = viewOrder;

// Auto-init removed to prevent double initialization by router
