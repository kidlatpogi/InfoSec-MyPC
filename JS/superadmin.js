/**
 * Superadmin Dashboard Handler
 * Manages admins, users, employees, products, and orders
 */

// ========================================
// TAB NAVIGATION
// ========================================

function initSuperadminTabs() {
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
    loadTabData('admins');
}

// ========================================
// DATA LOADING
// ========================================

async function loadTabData(tabName) {
    switch (tabName) {
        case 'admins':
            await loadAdmins();
            break;
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

async function loadAdmins() {
    const tbody = document.getElementById('admins-tbody');
    if (!tbody) return;

    try {
        const data = await ManagementAPI.getAdmins();

        if (!data.admins || data.admins.length === 0) {
            tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No admins found</td></tr>';
            return;
        }

        tbody.innerHTML = '';
        data.admins.forEach(admin => {
            const row = document.createElement('tr');
            const createdDate = new Date(admin.created_at).toLocaleDateString();
            row.innerHTML = `
                <td>${admin.id}</td>
                <td>${admin.email}</td>
                <td>${admin.first_name} ${admin.last_name}</td>
                <td><span class="badge" style="background:${admin.status === 'active' ? '#10b981' : '#ef4444'}">${admin.status}</span></td>
                <td>${createdDate}</td>
                <td>
                    <button class="btn btn-sm" onclick="editAdmin(${admin.id}, '${admin.email}')">Edit</button>
                    <button class="btn btn-sm btn-danger" onclick="deleteAdmin(${admin.id})">Delete</button>
                </td>
            `;
            tbody.appendChild(row);
        });
    } catch (error) {
        console.error('Failed to load admins:', error);
        tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load admins</td></tr>';
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
                <td>${user.first_name} ${user.last_name}</td>
                <td><span class="badge" style="background:${user.status === 'active' ? '#10b981' : '#ef4444'}">${user.status}</span></td>
                <td>${createdDate}</td>
                <td>
                    <button class="btn btn-sm" onclick="editUser(${user.id}, '${user.email}')">Edit</button>
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
                <td>${emp.first_name} ${emp.last_name}</td>
                <td><span class="badge" style="background:${emp.status === 'active' ? '#10b981' : '#ef4444'}">${emp.status}</span></td>
                <td>${createdDate}</td>
                <td>
                    <button class="btn btn-sm" onclick="editEmployee(${emp.id}, '${emp.email}')">Edit</button>
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
                    <button class="btn btn-sm btn-danger" onclick="deleteProduct(${product.id})">Delete</button>
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

function deleteProduct(productId) {
    if (confirm('Are you sure you want to delete this product?')) {
        alert(`Delete product ${productId} - Feature not yet implemented`);
    }
}

// ========================================
// ADMIN ACTIONS
// ========================================

function editAdmin(adminId, email) {
    const firstName = prompt('Enter first name:');
    if (firstName === null) return;
    
    const lastName = prompt('Enter last name:');
    if (lastName === null) return;
    
    const status = confirm('Is this admin active? (OK=active, Cancel=suspended)') ? 'active' : 'suspended';
    
    ManagementAPI.updateAdmin(adminId, { first_name: firstName, last_name: lastName, status })
        .then(() => {
            alert('Admin updated successfully');
            loadAdmins();
        })
        .catch(error => alert('Error updating admin: ' + error.message));
}

async function deleteAdmin(adminId) {
    if (!confirm('Are you sure you want to delete this admin?')) return;
    
    try {
        await ManagementAPI.deleteAdmin(adminId);
        alert('Admin deleted successfully');
        loadAdmins();
    } catch (error) {
        alert('Error deleting admin: ' + error.message);
    }
}

// ========================================
// USER ACTIONS
// ========================================

function editUser(userId, email) {
    const firstName = prompt('Enter first name:');
    if (firstName === null) return;
    
    const lastName = prompt('Enter last name:');
    if (lastName === null) return;
    
    const status = confirm('Is this user active? (OK=active, Cancel=suspended)') ? 'active' : 'suspended';
    
    ManagementAPI.updateUser(userId, { first_name: firstName, last_name: lastName, status })
        .then(() => {
            alert('User updated successfully');
            loadUsers();
        })
        .catch(error => alert('Error updating user: ' + error.message));
}

async function deleteUser(userId) {
    if (!confirm('Are you sure you want to delete this user?')) return;
    
    try {
        await ManagementAPI.deleteUser(userId);
        alert('User deleted successfully');
        loadUsers();
    } catch (error) {
        alert('Error deleting user: ' + error.message);
    }
}

// ========================================
// EMPLOYEE ACTIONS
// ========================================

function editEmployee(employeeId, email) {
    const firstName = prompt('Enter first name:');
    if (firstName === null) return;
    
    const lastName = prompt('Enter last name:');
    if (lastName === null) return;
    
    const status = confirm('Is this employee active? (OK=active, Cancel=suspended)') ? 'active' : 'suspended';
    
    ManagementAPI.updateEmployee(employeeId, { first_name: firstName, last_name: lastName, status })
        .then(() => {
            alert('Employee updated successfully');
            loadEmployees();
        })
        .catch(error => alert('Error updating employee: ' + error.message));
}

async function deleteEmployee(employeeId) {
    if (!confirm('Are you sure you want to delete this employee?')) return;
    
    try {
        await ManagementAPI.deleteEmployee(employeeId);
        alert('Employee deleted successfully');
        loadEmployees();
    } catch (error) {
        alert('Error deleting employee: ' + error.message);
    }
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

    // Add buttons with simple prompts
    document.getElementById('add-admin-btn')?.addEventListener('click', () => {
        const email = prompt('Enter admin email:');
        if (!email) return;
        
        const password = prompt('Enter password (min 6 characters):');
        if (!password || password.length < 6) {
            alert('Password must be at least 6 characters');
            return;
        }
        
        const firstName = prompt('Enter first name:');
        if (!firstName) return;
        
        const lastName = prompt('Enter last name:');
        if (!lastName) return;
        
        ManagementAPI.createAdmin(email, password, firstName, lastName)
            .then(() => {
                alert('Admin created successfully');
                loadAdmins();
            })
            .catch(error => alert('Error: ' + error.message));
    });

    document.getElementById('add-user-btn')?.addEventListener('click', () => {
        const email = prompt('Enter user email:');
        if (!email) return;
        
        const password = prompt('Enter password (min 6 characters):');
        if (!password || password.length < 6) {
            alert('Password must be at least 6 characters');
            return;
        }
        
        const firstName = prompt('Enter first name:');
        if (!firstName) return;
        
        const lastName = prompt('Enter last name:');
        if (!lastName) return;
        
        ManagementAPI.createUser(email, password, firstName, lastName)
            .then(() => {
                alert('User created successfully');
                loadUsers();
            })
            .catch(error => alert('Error: ' + error.message));
    });

    document.getElementById('add-employee-btn')?.addEventListener('click', () => {
        const email = prompt('Enter employee email:');
        if (!email) return;
        
        const password = prompt('Enter password (min 6 characters):');
        if (!password || password.length < 6) {
            alert('Password must be at least 6 characters');
            return;
        }
        
        const firstName = prompt('Enter first name:');
        if (!firstName) return;
        
        const lastName = prompt('Enter last name:');
        if (!lastName) return;
        
        ManagementAPI.createEmployee(email, password, firstName, lastName)
            .then(() => {
                alert('Employee created successfully');
                loadEmployees();
            })
            .catch(error => alert('Error: ' + error.message));
    });

    document.getElementById('add-product-btn')?.addEventListener('click', () => {
        alert('Add product feature not yet implemented');
    });
}

// ========================================
// LOGOUT
// ========================================

function initLogout() {
    document.getElementById('superadmin-logout-btn')?.addEventListener('click', () => {
        if (confirm('Are you sure you want to logout?')) {
            doLogout();
        }
    });
}

// ========================================
// INITIALIZATION
// ========================================

function initSuperadminPage() {
    // Update welcome message
    const user = getUserData();
    if (user) {
        const welcomeEl = document.getElementById('superadmin-welcome');
        if (welcomeEl) {
            welcomeEl.textContent = `Welcome, ${user.first_name} ${user.last_name}`;
        }
    }

    initSuperadminTabs();
    initModals();
    initLogout();
}

// Make functions globally available
window.initSuperadminPage = initSuperadminPage;
window.viewProduct = viewProduct;
window.editProduct = editProduct;
window.deleteProduct = deleteProduct;
window.editAdmin = editAdmin;
window.deleteAdmin = deleteAdmin;
window.editUser = editUser;
window.deleteUser = deleteUser;
window.editEmployee = editEmployee;
window.deleteEmployee = deleteEmployee;
window.viewOrder = viewOrder;

// Auto-initialize
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        if (document.querySelector('.admin-container') && document.getElementById('superadmin-welcome')) {
            initSuperadminPage();
        }
    });
} else {
    if (document.querySelector('.admin-container') && document.getElementById('superadmin-welcome')) {
        initSuperadminPage();
    }
}
