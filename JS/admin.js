/**
 * Admin Dashboard Handler
 * Manages users, employees, products, and orders
 */

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
                <td>${user.first_name} ${user.last_name}</td>
                <td><span class="badge" style="background:${user.status === 'active' ? '#10b981' : '#ef4444'}">${user.status}</span></td>
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
                <td>${emp.first_name} ${emp.last_name}</td>
                <td><span class="badge" style="background:${emp.status === 'active' ? '#10b981' : '#ef4444'}">${emp.status}</span></td>
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

// ========================================
// USER ACTIONS
// ========================================

function editUser(userId) {
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

function editEmployee(employeeId) {
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
            btn.closest('.modal')?.classList.remove('active');
        });
    });

    // Add buttons with simple prompts
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
    document.getElementById('admin-logout-btn')?.addEventListener('click', () => {
        if (confirm('Are you sure you want to logout?')) {
            doLogout();
        }
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

// Make functions globally available
window.initAdminPage = initAdminPage;
window.viewProduct = viewProduct;
window.editProduct = editProduct;
window.deleteProduct = deleteProduct;
window.editUser = editUser;
window.deleteUser = deleteUser;
window.editEmployee = editEmployee;
window.deleteEmployee = deleteEmployee;
window.viewOrder = viewOrder;

// Auto-initialize
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        if (document.querySelector('.admin-container')) {
            initAdminPage();
        }
    });
} else {
    if (document.querySelector('.admin-container')) {
        initAdminPage();
    }
}
