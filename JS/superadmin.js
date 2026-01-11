/**
 * Superadmin Dashboard Handler
 * Manages admins, users, employees, products, and orders
 */

// ========================================
// UTILITY FUNCTIONS
// ========================================

// Format currency (PHP Peso)
function formatPHP(n) {
  return (
    '₱' +
    parseFloat(n || 0).toLocaleString('en-PH', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    })
  );
}

// Get user data from localStorage
function getUserData() {
  try {
    return JSON.parse(localStorage.getItem('user')) || null;
  } catch (e) {
    return null;
  }
}

// ========================================
// PAGINATION LOGIC
// ========================================

// Pagination state for all tables
const paginationState = {
  admins: { currentPage: 1, itemsPerPage: 10, totalItems: 0, allData: [] },
  users: { currentPage: 1, itemsPerPage: 10, totalItems: 0, allData: [] },
  employees: { currentPage: 1, itemsPerPage: 10, totalItems: 0, allData: [] },
  products: { currentPage: 1, itemsPerPage: 10, totalItems: 0, allData: [], originalData: [] },
  orders: { currentPage: 1, itemsPerPage: 10, totalItems: 0, allData: [], originalData: [] },
  audit: { currentPage: 1, itemsPerPage: 10, totalItems: 0, allData: [] }
};

function prevPage(tableType) {
  const state = paginationState[tableType];
  if (state && state.currentPage > 1) {
    state.currentPage--;
    updatePaginationDisplay(tableType);
  }
}

function nextPage(tableType) {
  const state = paginationState[tableType];
  if (state) {
    const maxPages = Math.ceil(state.totalItems / state.itemsPerPage);
    if (state.currentPage < maxPages) {
      state.currentPage++;
      updatePaginationDisplay(tableType);
    }
  }
}

function updatePaginationDisplay(tableType) {
  const state = paginationState[tableType];
  if (!state) return;

  const tbody = document.getElementById(`${tableType}-tbody`);
  const pageInfoEl = document.getElementById(`${tableType}-page-info`);
  const prevBtn = document.getElementById(`${tableType}-prev-btn`);
  const nextBtn = document.getElementById(`${tableType}-next-btn`);

  if (!tbody || !pageInfoEl) return;

  // Calculate pagination
  const startIndex = (state.currentPage - 1) * state.itemsPerPage;
  const endIndex = startIndex + state.itemsPerPage;
  const pageData = state.allData.slice(startIndex, endIndex);
  const maxPages = Math.ceil(state.totalItems / state.itemsPerPage);

  // Render table rows
  tbody.innerHTML = '';
  if (pageData.length === 0) {
    tbody.innerHTML = `<tr><td colspan="5" style="text-align:center;padding:2rem;color:#666;">No data found</td></tr>`;
  } else {
    renderTableRows(tableType, pageData, tbody);
  }

  // Update page info
  pageInfoEl.textContent = `Page ${state.currentPage} of ${maxPages}`;

  // Update button states
  if (prevBtn) {
    prevBtn.disabled = state.currentPage === 1;
    prevBtn.style.opacity = state.currentPage === 1 ? '0.5' : '1';
    prevBtn.style.cursor = state.currentPage === 1 ? 'not-allowed' : 'pointer';
  }

  if (nextBtn) {
    nextBtn.disabled = state.currentPage >= maxPages;
    nextBtn.style.opacity = state.currentPage >= maxPages ? '0.5' : '1';
    nextBtn.style.cursor = state.currentPage >= maxPages ? 'not-allowed' : 'pointer';
  }
}

function renderTableRows(tableType, pageData, tbody) {
  // Delegate to specific rendering functions based on table type
  switch (tableType) {
    case 'admins':
      renderAdminRows(pageData, tbody);
      break;
    case 'users':
      renderUserRows(pageData, tbody);
      break;
    case 'employees':
      renderEmployeeRows(pageData, tbody);
      break;
    case 'products':
      renderProductRows(pageData, tbody);
      break;
    case 'orders':
      renderOrderRows(pageData, tbody);
      break;
    case 'audit':
      renderAuditRows(pageData, tbody);
      break;
  }
}

function renderAdminRows(admins, tbody) {
  admins.forEach((admin) => {
    const row = document.createElement('tr');
    const createdDate = new Date(admin.created_at).toLocaleDateString();
    const roleColor = admin.role === 'superadmin' ? '#8b5cf6' : '#3b82f6';
    row.innerHTML = `
      <td>${admin.email}</td>
      <td>${admin.first_name} ${admin.last_name}</td>
      <td><span class="badge" style="background:${roleColor}">${admin.role}</span></td>
      <td>${createdDate}</td>
      <td>
        <button class="btn btn-sm" onclick="editAdmin(${admin.id}, '${admin.email}')">Edit</button>
        <button class="btn btn-sm btn-danger" onclick="deleteAdmin(${admin.id})">Delete</button>
      </td>
    `;
    tbody.appendChild(row);
  });
}

function renderUserRows(users, tbody) {
  users.forEach((user) => {
    const row = document.createElement('tr');
    const createdDate = new Date(user.created_at).toLocaleDateString();
    const isArchived = user.is_archived == 1;
    
    // Add visual indicator for archived users
    if (isArchived) {
      row.style.opacity = '0.7';
      row.style.backgroundColor = '#fff3f3';
    }
    
    // Status badge - show deactivated if archived, otherwise show active
    const statusBadge = isArchived 
      ? '<span class="badge" style="background:#dc2626">Deactivated</span>'
      : `<span class="badge" style="background:#22c55e">Active</span>`;
    
    // Actions - different buttons for archived vs active users
    const actionButtons = isArchived
      ? `<button class="btn btn-sm btn-success" onclick="reactivateUser(${user.id})">Reactivate</button>`
      : `<button class="btn btn-sm" onclick="editUser(${user.id}, '${user.email}')">Edit</button>
         <button class="btn btn-sm btn-danger" onclick="deleteUser(${user.id})">Deactivate</button>`;
    
    row.innerHTML = `
      <td>${user.email}</td>
      <td>${user.first_name} ${user.last_name}</td>
      <td>${statusBadge}</td>
      <td>${createdDate}</td>
      <td>${actionButtons}</td>
    `;
    tbody.appendChild(row);
  });
}

function renderEmployeeRows(employees, tbody) {
  employees.forEach((emp) => {
    const row = document.createElement('tr');
    const createdDate = new Date(emp.created_at).toLocaleDateString();
    const isArchived = emp.is_archived == 1;
    
    // Add visual indicator for archived employees
    if (isArchived) {
      row.style.opacity = '0.7';
      row.style.backgroundColor = '#fff3f3';
    }
    
    // Status badge - show deactivated if archived, otherwise show active
    const statusBadge = isArchived 
      ? '<span class="badge" style="background:#dc2626">Deactivated</span>'
      : `<span class="badge" style="background:#22c55e">Active</span>`;
    
    // Actions - different buttons for archived vs active employees
    const actionButtons = isArchived
      ? `<button class="btn btn-sm btn-success" onclick="reactivateEmployee(${emp.id})">Reactivate</button>`
      : `<button class="btn btn-sm" onclick="editEmployee(${emp.id}, '${emp.email}')">Edit</button>
         <button class="btn btn-sm btn-danger" onclick="deleteEmployee(${emp.id})">Deactivate</button>`;
    
    row.innerHTML = `
      <td>${emp.email}</td>
      <td>${emp.first_name} ${emp.last_name}</td>
      <td>${statusBadge}</td>
      <td>${createdDate}</td>
      <td>${actionButtons}</td>
    `;
    tbody.appendChild(row);
  });
}

function renderProductRows(products, tbody) {
  products.forEach((product) => {
    const row = document.createElement('tr');
    // Calculate price and stock from variants
    const variants = product.variants || [];
    const minPrice =
      variants.length > 0
        ? Math.min(...variants.map((v) => parseFloat(v.price)))
        : 0;
    const totalStock = variants.reduce(
      (sum, v) => sum + parseInt(v.stock || 0),
      0
    );

    row.innerHTML = `
      <td>${product.name}</td>
      <td>${product.category_name || 'N/A'}</td>
      <td>${formatPHP(minPrice)}</td>
      <td>${variants.length}</td>
      <td>${totalStock}</td>
      <td>
        <button class="btn btn-sm" onclick="viewProduct(${product.id})">View</button>
        <button class="btn btn-sm" onclick="editProduct(${product.id})">Edit</button>
        <button class="btn btn-sm btn-danger" onclick="deleteProduct(${product.id})">Delete</button>
      </td>
    `;
    tbody.appendChild(row);
  });
}

function renderOrderRows(orders, tbody) {
  orders.forEach((order) => {
    const row = document.createElement('tr');
    const statusColor = getStatusColor(order.status);
    const statusLabel = getStatusLabel(order.status);
    row.innerHTML = `
      <td>${order.order_number}</td>
      <td>${order.customer_name}</td>
      <td>${order.customer_email}</td>
      <td><span class="badge" style="background:${statusColor}; color: white; padding: 0.35rem 0.75rem; border-radius: 4px; font-size: 0.8rem; font-weight: 500;">${statusLabel}</span></td>
      <td>${formatPHP(order.total)}</td>
      <td>
        <button class="btn btn-sm" onclick="viewOrder(${order.id})">View</button>
        <button class="btn btn-sm btn-danger" onclick="deleteOrder(${order.id}, '${order.order_number}')">Delete</button>
      </td>
    `;
    tbody.appendChild(row);
  });
}

function renderAuditRows(auditLogs, tbody) {
  auditLogs.forEach((log) => {
    const row = document.createElement('tr');
    const timestamp = new Date(log.created_at).toLocaleString();
    const actionBadgeColor =
      log.action === 'CREATE'
        ? '#10b981'
        : log.action === 'UPDATE'
        ? '#3b82f6'
        : log.action === 'DELETE'
        ? '#ef4444'
        : '#6b7280';

    const userDisplay = log.email
      ? `${log.first_name} ${log.last_name} (${log.email})`
      : 'System';
    const details = log.details
      ? typeof log.details === 'string'
        ? JSON.parse(log.details)
        : log.details
      : {};
    const detailsDisplay = JSON.stringify(details).substring(0, 100);

    row.innerHTML = `
      <td><span class="badge" style="background:${actionBadgeColor}">${log.action}</span></td>
      <td>${log.entity_type}</td>
      <td>${userDisplay}</td>
      <td>${timestamp}</td>
      <td><code style="font-size:0.85rem; color:#666;">${detailsDisplay}</code></td>
    `;
    tbody.appendChild(row);
  });
}

function getStatusColor(status) {
  const colors = {
    'pending': '#f59e0b',
    'processing': '#3b82f6',
    'paid': '#10b981',
    'shipped': '#8b5cf6',
    'completed': '#10b981',
    'cancelled': '#ef4444',
    'refunded': '#f59e0b'
  };
  return colors[status] || '#6b7280';
}

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
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'password=' + encodeURIComponent(password),
      })
        .then((res) => {
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
        .then((data) => {
          passwordModal.remove();
          console.log('Password verification response:', data);
          if (data.success) {
            resolve(true);
          } else {
            alert('Incorrect password: ' + (data.error || 'Unknown error'));
            resolve(false);
          }
        })
        .catch((error) => {
          passwordModal.remove();
          console.error('Password verification failed:', error);
          alert('Error verifying password: ' + error.message);
          resolve(false);
        });
    });
  });
}

// ========================================
// TAB NAVIGATION
// ========================================

function initSuperadminTabs() {
  const tabBtns = document.querySelectorAll('.tab-btn');
  const tabContents = document.querySelectorAll('.tab-content');

  // Restore previously active tab or default to 'dashboard'
  const savedTab = localStorage.getItem('superadmin_active_tab') || 'dashboard';
  
  // Immediately set the correct tab as active before any rendering
  const savedTabBtn = document.querySelector(`[data-tab="${savedTab}"]`);
  const savedTabContent = document.getElementById(`${savedTab}-tab`);
  
  if (savedTabBtn && savedTabContent) {
    savedTabBtn.classList.add('active');
    savedTabContent.classList.add('active');
    loadTabData(savedTab);
  } else {
    // Fallback to dashboard
    const firstTabBtn = document.querySelector('[data-tab="dashboard"]');
    const firstTabContent = document.getElementById('dashboard-tab');
    if (firstTabBtn && firstTabContent) {
      firstTabBtn.classList.add('active');
      firstTabContent.classList.add('active');
      loadTabData('dashboard');
    }
  }

  // Set up click handlers
  tabBtns.forEach((btn) => {
    btn.addEventListener('click', () => {
      const tabName = btn.getAttribute('data-tab');

      // Remove active class from all
      tabBtns.forEach((b) => b.classList.remove('active'));
      tabContents.forEach((c) => c.classList.remove('active'));

      // Add active class to clicked
      btn.classList.add('active');
      document.getElementById(`${tabName}-tab`)?.classList.add('active');

      // Save current tab to localStorage
      localStorage.setItem('superadmin_active_tab', tabName);

      // Load data for the tab
      loadTabData(tabName);
    });
  });

  // Setup search and filter listeners
  initSuperadminSearch();
}

// ========================================
// SEARCH AND FILTERS
// ========================================

function initSuperadminSearch() {
  // Admin search
  const adminSearch = document.getElementById('admin-search');
  if (adminSearch) {
    adminSearch.addEventListener('input', () => {
      filterTable('admins-tbody');
    });
  }

  // User search
  const userSearch = document.getElementById('user-search');
  if (userSearch) {
    userSearch.addEventListener('input', () => {
      filterUsersTable();
    });
  }

  // User status filter
  const userStatusFilter = document.getElementById('user-status-filter');
  if (userStatusFilter) {
    userStatusFilter.addEventListener('change', () => {
      loadUsers();
    });
  }

  // Employee search
  const employeeSearch = document.getElementById('employee-search');
  if (employeeSearch) {
    employeeSearch.addEventListener('input', () => {
      filterTable('employees-tbody');
    });
  }

  // Employee status filter
  const employeeStatusFilter = document.getElementById('employee-status-filter');
  if (employeeStatusFilter) {
    employeeStatusFilter.addEventListener('change', () => {
      loadEmployees();
    });
  }

  // Product search
  const productSearch = document.getElementById('product-search');
  if (productSearch) {
    productSearch.addEventListener('input', () => {
      filterTable('products-tbody');
    });
  }

  // Order search
  const orderSearch = document.getElementById('order-search');
  if (orderSearch) {
    orderSearch.addEventListener('input', () => {
      filterTable('orders-tbody');
    });
  }
}

function filterUsersTable() {
  const searchInput = document.getElementById('user-search');
  if (!searchInput) return;

  const query = searchInput.value.toLowerCase();
  const rows = document.querySelectorAll('#users-tbody tr');

  rows.forEach((row) => {
    const email = row.cells[0]?.textContent.toLowerCase() || '';
    const name = row.cells[1]?.textContent.toLowerCase() || '';
    const status = row.cells[2]?.textContent.toLowerCase() || '';
    const createdDate = row.cells[3]?.textContent.toLowerCase() || '';

    const matches =
      email.includes(query) ||
      name.includes(query) ||
      status.includes(query) ||
      createdDate.includes(query);

    row.style.display = matches ? '' : 'none';
  });
}

function filterTable(tableBodyId) {
  const tbody = document.getElementById(tableBodyId);
  if (!tbody) return;

  // Determine which search input to use based on table
  let searchInput = null;
  if (tableBodyId === 'admins-tbody') {
    searchInput = document.getElementById('admin-search');
  } else if (tableBodyId === 'employees-tbody') {
    searchInput = document.getElementById('employee-search');
  } else if (tableBodyId === 'products-tbody') {
    searchInput = document.getElementById('product-search');
  } else if (tableBodyId === 'orders-tbody') {
    searchInput = document.getElementById('order-search');
  }

  if (!searchInput) return;

  const query = searchInput.value.toLowerCase();
  const rows = tbody.querySelectorAll('tr');

  rows.forEach((row) => {
    // Get all text content from all cells
    const rowText = Array.from(row.cells)
      .map((cell) => cell.textContent.toLowerCase())
      .join(' ');

    const matches = rowText.includes(query);
    row.style.display = matches ? '' : 'none';
  });
}

// ========================================
// DATA LOADING
// ========================================

async function loadTabData(tabName) {
  switch (tabName) {
    case 'dashboard':
      await loadSalesDashboard();
      break;
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
    case 'audit':
      await loadAuditLogs();
      break;
    case 'profile':
      await loadProfileData();
      break;
  }
}

async function loadAdmins() {
  const tbody = document.getElementById('admins-tbody');
  if (!tbody) return;

  try {
    const data = await ManagementAPI.getAdmins();

    if (!data.admins || data.admins.length === 0) {
      paginationState.admins.allData = [];
      paginationState.admins.totalItems = 0;
      paginationState.admins.currentPage = 1;
      tbody.innerHTML =
        '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#666;">No admins found</td></tr>';
      return;
    }

    // Store all data and update pagination state
    paginationState.admins.allData = data.admins;
    paginationState.admins.totalItems = data.admins.length;
    paginationState.admins.currentPage = 1;

    // Display first page
    updatePaginationDisplay('admins');
  } catch (error) {
    console.error('Failed to load admins:', error);
    tbody.innerHTML =
      '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load admins</td></tr>';
  }
}

async function loadUsers(includeArchived = null) {
  const tbody = document.getElementById('users-tbody');
  if (!tbody) return;

  // Get filter value from dropdown if not provided
  if (includeArchived === null) {
    const filterSelect = document.getElementById('user-status-filter');
    includeArchived = filterSelect ? parseInt(filterSelect.value) : 0;
  }

  try {
    const data = await ManagementAPI.getUsers(includeArchived);

    if (!data.users || data.users.length === 0) {
      paginationState.users.allData = [];
      paginationState.users.totalItems = 0;
      paginationState.users.currentPage = 1;
      tbody.innerHTML =
        '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#666;">No users found</td></tr>';
      return;
    }

    // Store all data and update pagination state
    paginationState.users.allData = data.users;
    paginationState.users.totalItems = data.users.length;
    paginationState.users.currentPage = 1;

    // Display first page
    updatePaginationDisplay('users');
  } catch (error) {
    console.error('Failed to load users:', error);
    tbody.innerHTML =
      '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load users</td></tr>';
  }
}

async function loadEmployees(includeArchived = null) {
  const tbody = document.getElementById('employees-tbody');
  if (!tbody) return;

  // Get filter value from dropdown if not provided
  if (includeArchived === null) {
    const filterSelect = document.getElementById('employee-status-filter');
    includeArchived = filterSelect ? parseInt(filterSelect.value) : 0;
  }

  try {
    const data = await ManagementAPI.getEmployees(includeArchived);

    if (!data.employees || data.employees.length === 0) {
      paginationState.employees.allData = [];
      paginationState.employees.totalItems = 0;
      paginationState.employees.currentPage = 1;
      tbody.innerHTML =
        '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#666;">No employees found</td></tr>';
      return;
    }

    // Store all data and update pagination state
    paginationState.employees.allData = data.employees;
    paginationState.employees.totalItems = data.employees.length;
    paginationState.employees.currentPage = 1;

    // Display first page
    updatePaginationDisplay('employees');
  } catch (error) {
    console.error('Failed to load employees:', error);
    tbody.innerHTML =
      '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load employees</td></tr>';
  }
}

// ========================================
// CATEGORY MANAGEMENT
// ========================================

async function loadCategories() {
  try {
    const data = await ProductsAPI.getCategories();
    const categorySelect = document.getElementById('product-category');
    
    if (!categorySelect) return;
    
    // Clear existing options except the first one
    categorySelect.innerHTML = '<option value="">-- Select a Category --</option>';
    
    if (data.categories && Array.isArray(data.categories)) {
      data.categories.forEach(category => {
        const option = document.createElement('option');
        option.value = category.name;
        option.textContent = category.name;
        categorySelect.appendChild(option);
      });
    }
  } catch (error) {
    console.error('Failed to load categories:', error);
  }
}

async function loadProducts() {
  const tbody = document.getElementById('products-tbody');
  if (!tbody) {
    console.error('products-tbody element not found');
    return;
  }

  tbody.innerHTML =
    '<tr><td colspan="6" style="text-align:center;padding:2rem">Loading products...</td></tr>';

  try {
    console.log('Fetching products...');
    const data = await ProductsAPI.getAllProducts();
    console.log('Products loaded:', data);

    if (!data.products || data.products.length === 0) {
      paginationState.products.allData = [];
      paginationState.products.totalItems = 0;
      paginationState.products.currentPage = 1;
      tbody.innerHTML =
        '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No products found</td></tr>';
      return;
    }

    // Store all data and update pagination state, sorted alphabetically by product name
    const productsSorted = data.products.sort((a, b) => 
      (a.name || '').localeCompare((b.name || ''), undefined, { sensitivity: 'base' })
    );
    paginationState.products.allData = productsSorted;
    paginationState.products.originalData = productsSorted;
    paginationState.products.totalItems = productsSorted.length;
    paginationState.products.currentPage = 1;

    // Load categories
    await loadProductCategories();

    // Add event listener to category filter
    const categoryFilter = document.getElementById('product-category-filter');
    if (categoryFilter) {
      categoryFilter.removeEventListener('change', filterProductsByCategory);
      categoryFilter.addEventListener('change', filterProductsByCategory);
    }

    // Display first page
    updatePaginationDisplay('products');
  } catch (error) {
    console.error('Failed to load products:', error);
    const errorMsg = error.message || 'Unknown error';
    tbody.innerHTML =
      `<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load products: ${errorMsg}</td></tr>`;
  }
}

async function loadProductCategories() {
  try {
    const data = await ProductsAPI.getCategories();
    const categoryFilter = document.getElementById('product-category-filter');
    
    if (!categoryFilter) return;
    
    // Keep the "All Categories" option and add category options
    const currentValue = categoryFilter.value;
    categoryFilter.innerHTML = '<option value="">All Categories</option>';
    
    if (data.categories && Array.isArray(data.categories)) {
      data.categories.forEach(category => {
        const option = document.createElement('option');
        option.value = category.name;
        option.textContent = category.name;
        categoryFilter.appendChild(option);
      });
    }
    
    // Restore previous selection if it still exists
    categoryFilter.value = currentValue;
  } catch (error) {
    console.error('Failed to load product categories:', error);
  }
}

function filterProductsByCategory() {
  const categoryFilter = document.getElementById('product-category-filter');
  const selectedCategory = categoryFilter ? categoryFilter.value : '';
  
  if (!paginationState.products.originalData) return;
  
  // Filter the data based on category from original unfiltered data
  let filteredProducts = paginationState.products.originalData;
  if (selectedCategory) {
    filteredProducts = filteredProducts.filter(product => 
      product.category_name === selectedCategory
    );
  }
  
  // Update pagination state with filtered data
  paginationState.products.allData = filteredProducts;
  paginationState.products.totalItems = filteredProducts.length;
  paginationState.products.currentPage = 1;
  
  // Display first page of filtered results
  updatePaginationDisplay('products');
}

function getStatusLabel(status) {
  const labels = {
    'pending': 'Pending',
    'processing': 'Processing',
    'paid': 'Paid',
    'shipped': 'Shipped',
    'completed': 'Completed',
    'cancelled': 'Cancelled',
    'refunded': 'Refunded'
  };
  return labels[status] || status;
}

async function loadOrders() {
  const tbody = document.getElementById('orders-tbody');
  if (!tbody) return;

  try {
    const data = await OrdersAPI.getOrders();

    if (!data.orders || data.orders.length === 0) {
      paginationState.orders.allData = [];
      paginationState.orders.totalItems = 0;
      paginationState.orders.currentPage = 1;
      tbody.innerHTML =
        '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#666;">No orders found</td></tr>';
      return;
    }

    // Store all data and update pagination state
    paginationState.orders.allData = data.orders;
    paginationState.orders.originalData = data.orders;
    paginationState.orders.totalItems = data.orders.length;
    paginationState.orders.currentPage = 1;

    // Add event listener to status filter
    const statusFilter = document.getElementById('order-status-filter');
    if (statusFilter) {
      statusFilter.removeEventListener('change', filterOrders);
      statusFilter.addEventListener('change', filterOrders);
    }

    // Display first page
    updatePaginationDisplay('orders');
  } catch (error) {
    console.error('Failed to load orders:', error);
    tbody.innerHTML =
      '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load orders</td></tr>';
  }
}

function filterOrders() {
  const statusFilter = document.getElementById('order-status-filter');
  const selectedStatus = statusFilter ? statusFilter.value : '';
  
  if (!paginationState.orders.originalData) return;
  
  let filteredOrders = paginationState.orders.originalData;
  
  // Filter by status if selected from original unfiltered data
  if (selectedStatus) {
    filteredOrders = filteredOrders.filter(order => order.status === selectedStatus);
  }
  
  // Update pagination state with filtered data
  paginationState.orders.allData = filteredOrders;
  paginationState.orders.totalItems = filteredOrders.length;
  paginationState.orders.currentPage = 1;
  
  // Display first page of filtered results
  updatePaginationDisplay('orders');
}

// ========================================
// PRODUCT ACTIONS
// ========================================

function viewProduct(productId) {
  ProductsAPI.getAllProducts()
    .then((data) => {
      const product = data.products.find((p) => p.id == productId);
      if (!product) {
        alert('Product not found');
        return;
      }

      const viewModal = document.getElementById('product-view-modal');
      const viewContent = document.getElementById('product-view-content');
      const viewTitle = document.getElementById('product-view-title');

      const variants = product.variants || [];
      const variantsHTML =
        variants.length > 0
          ? variants
              .map(
                (v) => `
                    <div style="padding: 0.75rem; background: var(--surface); border-radius: 6px; margin-bottom: 0.5rem;">
                        <strong>${v.title}</strong> - ${formatPHP(
                  v.price
                )} (Stock: ${v.stock})
                    </div>
                `
              )
              .join('')
          : '<p style="color: var(--text-light);">No variants</p>';

      viewContent.innerHTML = `
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
                    <div>
                        ${
                          product.image_url
                            ? `<img src="${product.image_url}" alt="${product.name}" style="width: 100%; border-radius: 8px; margin-bottom: 1rem;">`
                            : '<div style="background: #f0f0f0; padding: 3rem; text-align: center; border-radius: 8px; margin-bottom: 1rem;">No Image</div>'
                        }
                        <h3 style="margin-top: 0;">Product Information</h3>
                        <div style="margin-bottom: 1rem;">
                            <strong>ID:</strong> ${product.id}
                        </div>
                        <div style="margin-bottom: 1rem;">
                            <strong>Name:</strong> ${product.name || 'N/A'}
                        </div>
                        <div style="margin-bottom: 1rem;">
                            <strong>Category:</strong> ${
                              product.category_name || 'N/A'
                            }
                        </div>
                        <div style="margin-bottom: 1rem;">
                            <strong>Base Price:</strong> ${formatPHP(
                              product.base_price || 0
                            )}
                        </div>
                        <div style="margin-bottom: 1rem;">
                            <strong>SKU:</strong> ${product.sku || 'N/A'}
                        </div>
                        <div>
                            <strong>Created:</strong> ${
                              new Date(
                                product.created_at
                              ).toLocaleDateString() || 'N/A'
                            }
                        </div>
                    </div>
                    <div>
                        <h3 style="margin-top: 0;">Variants (${
                          variants.length
                        })</h3>
                        ${variantsHTML}
                    </div>
                </div>
            `;

      viewTitle.textContent = `Product Details: ${product.name}`;
      viewModal.classList.add('open');
    })
    .catch((error) => alert('Error loading product: ' + error.message));
}

function editProduct(productId) {
  verifyPassword().then((verified) => {
    if (!verified) return;

    const productModal = document.getElementById('product-modal');
    const productForm = document.getElementById('product-form');
    const modalTitle = document.getElementById('product-modal-title');

    // Load categories
    loadCategories();

    // Fetch the product data
    ProductsAPI.getAllProducts()
      .then((data) => {
        const product = data.products.find((p) => p.id == productId);
        if (!product) {
          alert('Product not found');
          return;
        }

        // Populate form
        document.getElementById('product-title').value = product.name;
        document.getElementById('product-category').value =
          product.category_name || '';
        // Price field removed from UI - use 0
        const priceField = document.getElementById('product-price');
        if (priceField) {
          priceField.value = product.base_price;
        }
        document.getElementById('product-variants').value = product.variants
          ? JSON.stringify(product.variants, null, 2)
          : '';

        // Set modal title
        modalTitle.textContent = `Edit Product: ${product.name}`;

        // Show modal
        productModal.classList.add('open');

        // Handle form submission
        productForm.onsubmit = async (e) => {
          e.preventDefault();
          const name = document.getElementById('product-title').value.trim();
          const category = document
            .getElementById('product-category')
            .value.trim();
          // Price field removed from UI - use 0
          const basePrice = 0;
          let variants = [];

          const variantsStr = document
            .getElementById('product-variants')
            .value.trim();
          if (variantsStr) {
            try {
              variants = JSON.parse(variantsStr);
            } catch (e) {
              alert('Invalid JSON format for variants');
              return;
            }
          }

          if (!name || !category) {
            alert('Please fill in all required fields');
            return;
          }

          try {
            await ProductsAPI.updateProduct(
              productId,
              name,
              category,
              basePrice,
              variants
            );
            alert('Product updated successfully');
            productModal.classList.remove('open');
            await loadProducts();
          } catch (error) {
            alert('Error updating product: ' + error.message);
          }
        };
      })
      .catch((error) => alert('Error loading product: ' + error.message));
  });
}

async function deleteProduct(productId) {
  const verified = await verifyPassword();
  if (!verified) return;

  showConfirmDialog(
    'Are you sure you want to delete this product? This action cannot be undone.',
    async () => {
      try {
        await ProductsAPI.deleteProduct(productId);
        alert('Product deleted successfully');
        await loadProducts();
      } catch (error) {
        alert('Error deleting product: ' + error.message);
      }
    }
  );
}

async function deleteOrder(orderId, orderNumber) {
  const verified = await verifyPassword();
  if (!verified) return;

  showConfirmDialog(
    `Are you sure you want to delete order ${orderNumber}? This action cannot be undone.`,
    async () => {
      try {
        await OrdersAPI.deleteOrder(orderId);
        alert('Order deleted successfully');
        await loadOrders();
      } catch (error) {
        alert('Error deleting order: ' + error.message);
      }
    }
  );
}

async function editStock(productId) {
  const stockModal = document.getElementById('stock-modal');
  const stockForm = document.getElementById('stock-form');
  const variantsContainer = document.getElementById('stock-variants-container');
  const modalTitle = document.getElementById('stock-modal-title');

  // Fetch product data to get variants
  try {
    const data = await ProductsAPI.getAllProducts();
    const product = data.products.find((p) => p.id == productId);
    
    if (!product) {
      alert('Product not found');
      return;
    }

    const variants = product.variants || [];
    modalTitle.textContent = `Edit Stock: ${product.name}`;

    // Clear and populate variants
    variantsContainer.innerHTML = '';
    
    if (variants.length === 0) {
      variantsContainer.innerHTML = '<p style="color: #666;">No variants found for this product</p>';
    } else {
      variants.forEach((variant, index) => {
        const variantDiv = document.createElement('div');
        variantDiv.className = 'stock-variant-item';
        variantDiv.style.cssText = 'margin-bottom: 1rem; padding: 1rem; border: 1px solid #ddd; border-radius: 8px;';
        
        variantDiv.innerHTML = `
          <div style="margin-bottom: 0.5rem;">
            <strong>${variant.title || 'Standard'}</strong> - ${formatPHP(variant.price || 0)}
          </div>
          <div style="display: flex; align-items: center; gap: 1rem;">
            <label style="min-width: 80px;">Stock:</label>
            <button type="button" class="btn-stock-decrease" data-variant-id="${variant.id}" style="width: 40px; height: 40px; font-size: 1.2rem; font-weight: bold; cursor: pointer; border: 1px solid #ddd; background: #f5f5f5; border-radius: 4px;">−</button>
            <input type="number" class="variant-stock-input" data-variant-id="${variant.id}" value="${variant.stock || 0}" min="0" style="width: 100px; text-align: center; padding: 0.5rem; border: 1px solid #ddd; border-radius: 4px; font-size: 1rem;" />
            <button type="button" class="btn-stock-increase" data-variant-id="${variant.id}" style="width: 40px; height: 40px; font-size: 1.2rem; font-weight: bold; cursor: pointer; border: 1px solid #ddd; background: #f5f5f5; border-radius: 4px;">+</button>
          </div>
        `;
        
        variantsContainer.appendChild(variantDiv);
      });

      // Add event listeners for increase/decrease buttons
      document.querySelectorAll('.btn-stock-increase').forEach(btn => {
        btn.addEventListener('click', () => {
          const variantId = btn.dataset.variantId;
          const input = document.querySelector(`.variant-stock-input[data-variant-id="${variantId}"]`);
          input.value = parseInt(input.value || 0) + 1;
        });
      });

      document.querySelectorAll('.btn-stock-decrease').forEach(btn => {
        btn.addEventListener('click', () => {
          const variantId = btn.dataset.variantId;
          const input = document.querySelector(`.variant-stock-input[data-variant-id="${variantId}"]`);
          const currentValue = parseInt(input.value || 0);
          if (currentValue > 0) {
            input.value = currentValue - 1;
          }
        });
      });
    }

    // Show modal
    stockModal.classList.add('open');

    // Handle form submission
    stockForm.onsubmit = async (e) => {
      e.preventDefault();

      const inputs = document.querySelectorAll('.variant-stock-input');
      const updates = [];
      
      inputs.forEach(input => {
        const variantId = input.dataset.variantId;
        const stock = parseInt(input.value || 0);
        if (stock < 0) {
          alert('Stock cannot be negative');
          throw new Error('Invalid stock value');
        }
        updates.push({ variant_id: variantId, stock });
      });

      try {
        // Update all variant stocks
        for (const update of updates) {
          await ProductsAPI.updateVariantStock(update.variant_id, update.stock);
        }
        
        stockModal.classList.remove('open');
        alert('Stock updated successfully');
        
        // Update the stock display in the table immediately without full reload
        const newTotalStock = updates.reduce((sum, u) => sum + u.stock, 0);
        const stockCell = document.getElementById(`stock-${productId}`);
        if (stockCell) {
          stockCell.textContent = newTotalStock;
        }
      } catch (error) {
        alert('Error updating stock: ' + error.message);
      }
    };
  } catch (error) {
    alert('Error loading product: ' + error.message);
  }
}

// ========================================
// ADMIN ACTIONS
// ========================================

function editAdmin(adminId, email) {
  // Require password verification
  verifyPassword().then((verified) => {
    if (!verified) return;

    const adminModal = document.getElementById('admin-modal');
    const adminForm = document.getElementById('admin-form');
    const modalTitle = document.getElementById('admin-modal-title');

    // Fetch the admin data
    ManagementAPI.getAdmins()
      .then((data) => {
        const admin = data.admins.find((a) => a.id == adminId);
        if (!admin) {
          alert('Admin not found');
          return;
        }

        // Populate form
        document.getElementById('admin-email').value = admin.email;
        document.getElementById('admin-email').disabled = true;
        // Store first and last name separately for now, showing combined
        document.getElementById(
          'admin-name'
        ).value = `${admin.first_name} ${admin.last_name}`;
        document.getElementById('admin-password').value = '';
        document.getElementById('admin-password').placeholder =
          'Leave empty to keep current';

        // Set modal title
        modalTitle.textContent = `Edit Admin: ${admin.email}`;

        // Show modal
        adminModal.classList.add('open');

        // Handle form submission
        adminForm.onsubmit = async (e) => {
          e.preventDefault();
          const fullName = document.getElementById('admin-name').value.trim();
          const password = document
            .getElementById('admin-password')
            .value.trim();
          const [firstName, ...lastNameParts] = fullName.split(' ');
          const lastName = lastNameParts.join(' ') || firstName;

          const updates = {
            first_name: firstName,
            last_name: lastName,
          };

          if (password) {
            updates.password = password;
          }

          try {
            await ManagementAPI.updateAdmin(adminId, updates);
            alert('Admin updated successfully');
            adminModal.classList.remove('open');
            loadAdmins();
          } catch (error) {
            alert('Error updating admin: ' + error.message);
          }
        };
      })
      .catch((error) => alert('Error loading admin: ' + error.message));
  });
}

async function deleteAdmin(adminId) {
  // Require password verification
  const verified = await verifyPassword();
  if (!verified) return;

  showConfirmDialog('Are you sure you want to delete this admin?', async () => {
    try {
      await ManagementAPI.deleteAdmin(adminId);
      alert('Admin deleted successfully');
      loadAdmins();
    } catch (error) {
      alert('Error deleting admin: ' + error.message);
    }
  });
}

// ========================================
// USER ACTIONS
// ========================================

function editUser(userId, email) {
  // Require password verification
  verifyPassword().then((verified) => {
    if (!verified) return;

    const userModal = document.getElementById('user-modal');
    const userForm = document.getElementById('user-form');
    const modalTitle = document.getElementById('user-modal-title');

    // Fetch the user data
    ManagementAPI.getUsers()
      .then((data) => {
        const user = data.users.find((u) => u.id == userId);
        if (!user) {
          alert('User not found');
          return;
        }

        // Populate form
        document.getElementById('user-email').value = user.email;
        document.getElementById('user-email').disabled = true;
        // Store first and last name separately for now, showing combined
        document.getElementById(
          'user-name'
        ).value = `${user.first_name} ${user.last_name}`;
        document.getElementById('user-password').value = '';
        document.getElementById('user-password').placeholder =
          'Leave empty to keep current';

        // Set modal title
        modalTitle.textContent = `Edit User: ${user.email}`;

        // Show modal
        userModal.classList.add('open');

        // Handle form submission
        userForm.onsubmit = async (e) => {
          e.preventDefault();
          const fullName = document.getElementById('user-name').value.trim();
          const password = document
            .getElementById('user-password')
            .value.trim();
          const [firstName, ...lastNameParts] = fullName.split(' ');
          const lastName = lastNameParts.join(' ') || firstName;

          const updates = {
            first_name: firstName,
            last_name: lastName,
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
      .catch((error) => alert('Error loading user: ' + error.message));
  });
}

async function deleteUser(userId) {
  const verified = await verifyPassword();
  if (!verified) return;

  showConfirmDialog(
    'Are you sure you want to deactivate this user? They will no longer be able to log in.',
    async () => {
      try {
        await ManagementAPI.deleteUser(userId);
        alert('User deactivated successfully');
        loadUsers();
      } catch (error) {
        alert('Error deactivating user: ' + error.message);
      }
    }
  );
}

async function reactivateUser(userId) {
  const verified = await verifyPassword();
  if (!verified) return;

  showConfirmDialog(
    'Are you sure you want to reactivate this user? They will be able to log in again.',
    async () => {
      try {
        await ManagementAPI.reactivateUser(userId);
        alert('User reactivated successfully');
        loadUsers();
      } catch (error) {
        alert('Error reactivating user: ' + error.message);
      }
    }
  );
}

// ========================================
// EMPLOYEE ACTIONS
// ========================================

function editEmployee(employeeId, email) {
  // Require password verification
  verifyPassword().then((verified) => {
    if (!verified) return;

    const employeeModal = document.getElementById('employee-modal');
    const employeeForm = document.getElementById('employee-form');
    const modalTitle = document.getElementById('employee-modal-title');

    // Fetch the employee data
    ManagementAPI.getEmployees()
      .then((data) => {
        const employee = data.employees.find((e) => e.id == employeeId);
        if (!employee) {
          alert('Employee not found');
          return;
        }

        // Populate form
        document.getElementById('employee-email').value = employee.email;
        document.getElementById('employee-email').disabled = true;
        document.getElementById(
          'employee-name'
        ).value = `${employee.first_name} ${employee.last_name}`;
        document.getElementById('employee-password').value = '';
        document.getElementById('employee-password').placeholder =
          'Leave empty to keep current';

        // Set modal title
        modalTitle.textContent = `Edit Employee: ${employee.email}`;

        // Show modal
        employeeModal.classList.add('open');

        // Handle form submission
        employeeForm.onsubmit = async (e) => {
          e.preventDefault();
          const fullName = document
            .getElementById('employee-name')
            .value.trim();
          const password = document
            .getElementById('employee-password')
            .value.trim();
          const [firstName, ...lastNameParts] = fullName.split(' ');
          const lastName = lastNameParts.join(' ') || firstName;

          const updates = {
            first_name: firstName,
            last_name: lastName,
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
      .catch((error) => alert('Error loading employee: ' + error.message));
  });
}

async function deleteEmployee(employeeId) {
  const verified = await verifyPassword();
  if (!verified) return;

  showConfirmDialog(
    'Are you sure you want to deactivate this employee? They will no longer be able to log in.',
    async () => {
      try {
        await ManagementAPI.deleteEmployee(employeeId);
        alert('Employee deactivated successfully');
        loadEmployees();
      } catch (error) {
        alert('Error deactivating employee: ' + error.message);
      }
    }
  );
}

async function reactivateEmployee(employeeId) {
  const verified = await verifyPassword();
  if (!verified) return;

  showConfirmDialog(
    'Are you sure you want to reactivate this employee? They will be able to log in again.',
    async () => {
      try {
        await ManagementAPI.reactivateEmployee(employeeId);
        alert('Employee reactivated successfully');
        loadEmployees();
      } catch (error) {
        alert('Error reactivating employee: ' + error.message);
      }
    }
  );
}

// ========================================
// ORDER ACTIONS
// ========================================

async function viewOrder(orderId) {
  try {
    const data = await OrdersAPI.getOrder(orderId);
    const order = data.order;
    
    if (!order) {
      alert('Order not found');
      return;
    }
    
    const orderModal = document.getElementById('order-modal');
    const orderContent = document.getElementById('order-modal-content');
    const orderTitle = document.getElementById('order-modal-title');
    
    // Format date
    const orderDate = new Date(order.placed_at || order.created_at).toLocaleString();
    
    // Status options with display names (matches database enum)
    const statusOptions = [
      { value: 'pending', label: 'Pending', color: '#f59e0b' },
      { value: 'processing', label: 'Processing', color: '#3b82f6' },
      { value: 'paid', label: 'Paid', color: '#06b6d4' },
      { value: 'shipped', label: 'Shipped', color: '#8b5cf6' },
      { value: 'completed', label: 'Completed', color: '#10b981' },
      { value: 'cancelled', label: 'Cancelled', color: '#ef4444' },
      { value: 'refunded', label: 'Refunded', color: '#6b7280' }
    ];
    
    const currentStatus = statusOptions.find(s => s.value === order.status) || statusOptions[0];
    
    // Build status dropdown
    const statusDropdown = `
      <select id="order-status-select" style="padding: 0.5rem; border: 1px solid #ddd; border-radius: 4px; background: ${currentStatus.color}; color: white; font-weight: 500; cursor: pointer;">
        ${statusOptions.map(status => `
          <option value="${status.value}" ${status.value === order.status ? 'selected' : ''} 
                  style="background: ${status.color}; color: white;">
            ${status.label}
          </option>
        `).join('')}
      </select>
      <button id="update-status-btn" style="margin-left: 0.5rem; padding: 0.5rem 1rem; background: #3b82f6; color: white; border: none; border-radius: 4px; cursor: pointer;">
        Update Status
      </button>
    `;
    
    // Build items HTML with product images
    const itemsHTML = order.items.map(item => {
      // Build proper image URL with baseRoot
      const baseRoot = (window.router && window.router.baseRoot) ? window.router.baseRoot : '';
      let imageUrl = item.image_url;
      
      // If image_url exists and doesn't start with http, prepend baseRoot
      if (imageUrl && !imageUrl.startsWith('http')) {
        imageUrl = baseRoot + imageUrl;
      }
      
      return `
        <div style="display: grid; grid-template-columns: 80px 1fr auto auto auto; gap: 1rem; padding: 1rem; border-bottom: 1px solid #e5e7eb; align-items: center;">
          ${imageUrl ? `
            <img src="${imageUrl}" alt="${item.product_name}" 
                 style="width: 80px; height: 80px; object-fit: cover; border-radius: 6px; border: 1px solid #e5e7eb;"
                 onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
            <div style="display: none; width: 80px; height: 80px; background: #f3f4f6; border-radius: 6px; align-items: center; justify-content: center; color: #9ca3af; font-size: 0.75rem; text-align: center;">
              No Image
            </div>
          ` : `
            <div style="width: 80px; height: 80px; background: #f3f4f6; border-radius: 6px; display: flex; align-items: center; justify-content: center; color: #9ca3af; font-size: 0.75rem; text-align: center; border: 1px solid #e5e7eb;">
              No Image
            </div>
          `}
          <div>
            <div style="font-weight: 600; margin-bottom: 0.25rem;">${item.product_name}</div>
            <div style="color: #6b7280; font-size: 0.875rem;">${item.variant_title || 'Default'}</div>
          </div>
          <div style="text-align: center;">
            <div style="color: #6b7280; font-size: 0.75rem; margin-bottom: 0.25rem;">Quantity</div>
            <div style="font-weight: 600;">${item.quantity}</div>
          </div>
          <div style="text-align: right;">
            <div style="color: #6b7280; font-size: 0.75rem; margin-bottom: 0.25rem;">Unit Price</div>
            <div style="font-weight: 600;">${formatPHP(item.unit_price)}</div>
          </div>
          <div style="text-align: right;">
            <div style="color: #6b7280; font-size: 0.75rem; margin-bottom: 0.25rem;">Total</div>
            <div style="font-weight: 600; color: #3b82f6;">${formatPHP(item.line_total)}</div>
          </div>
        </div>
      `;
    }).join('');
    
    orderContent.innerHTML = `
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-bottom: 2rem;">
        <div>
          <h3 style="margin-top: 0; margin-bottom: 1rem;">Order Information</h3>
          <div style="margin-bottom: 0.75rem;">
            <strong>Order Number:</strong> ${order.order_number}
          </div>
          <div style="margin-bottom: 0.75rem;">
            <strong>Date:</strong> ${orderDate}
          </div>
          <div style="margin-bottom: 0.75rem;">
            <strong>Status:</strong><br>
            <div style="margin-top: 0.5rem;">
              ${statusDropdown}
            </div>
          </div>
        </div>
        <div>
          <h3 style="margin-top: 0; margin-bottom: 1rem;">Customer Information</h3>
          <div style="margin-bottom: 0.75rem;">
            <strong>Name:</strong> ${order.customer_name || 'N/A'}
          </div>
          <div style="margin-bottom: 0.75rem;">
            <strong>Email:</strong> ${order.customer_email || 'N/A'}
          </div>
          <div style="margin-bottom: 0.75rem;">
            <strong>Phone:</strong> ${order.customer_phone || 'N/A'}
          </div>
          ${order.shipping_address ? `
            <div style="margin-top: 1rem;">
              <strong>Shipping Address:</strong><br>
              <div style="color: #6b7280; margin-top: 0.25rem;">${order.shipping_address}</div>
            </div>
          ` : ''}
        </div>
      </div>
      
      <h3 style="margin-bottom: 1rem;">Order Items (${order.items.length})</h3>
      <div style="background: #f9fafb; border-radius: 8px; overflow: hidden; margin-bottom: 1.5rem;">
        ${itemsHTML}
      </div>
      
      <div style="background: #f0f9ff; padding: 1.5rem; border-radius: 8px; border: 1px solid #bae6fd;">
        <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
          <span>Subtotal:</span>
          <span style="font-weight: 600;">${formatPHP(order.subtotal || 0)}</span>
        </div>
        <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
          <span>Shipping:</span>
          <span style="font-weight: 600;">${formatPHP(order.shipping || 0)}</span>
        </div>
        <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
          <span>Tax:</span>
          <span style="font-weight: 600;">${formatPHP(order.tax || 0)}</span>
        </div>
        <div style="display: flex; justify-content: space-between; padding-top: 0.75rem; border-top: 2px solid #0284c7; margin-top: 0.5rem;">
          <span style="font-size: 1.125rem; font-weight: 700;">Total:</span>
          <span style="font-size: 1.125rem; font-weight: 700; color: #0284c7;">${formatPHP(order.total)}</span>
        </div>
      </div>
    `;
    
    orderTitle.textContent = `Order Details - ${order.order_number}`;
    orderModal.classList.add('open');
    
    // Add event listener for status update
    setTimeout(() => {
      const updateBtn = document.getElementById('update-status-btn');
      const statusSelect = document.getElementById('order-status-select');
      
      if (updateBtn && statusSelect) {
        updateBtn.addEventListener('click', async () => {
          const newStatus = statusSelect.value;
          if (newStatus === order.status) {
            alert('Status is already set to this value');
            return;
          }
          
          if (!confirm(`Are you sure you want to change the order status to "${statusOptions.find(s => s.value === newStatus).label}"?`)) {
            return;
          }
          
          try {
            await OrdersAPI.updateOrderStatus(orderId, newStatus);
            alert('Order status updated successfully!');
            orderModal.classList.remove('open');
            loadOrders(); // Refresh the orders list
          } catch (error) {
            alert('Failed to update order status: ' + error.message);
          }
        });
        
        // Update button color when status changes
        statusSelect.addEventListener('change', () => {
          const selected = statusOptions.find(s => s.value === statusSelect.value);
          if (selected) {
            statusSelect.style.background = selected.color;
          }
        });
      }
    }, 100);
    
  } catch (error) {
    console.error('Failed to load order:', error);
    alert('Failed to load order details: ' + error.message);
  }
}

// ========================================
// VARIANTS EDITOR
// ========================================

let currentVariants = [];
let variantsModalOpen = false;

function openVariantsEditor() {
  console.log('Opening variants editor...');
  const variantsJSON = document.getElementById('product-variants').value.trim();
  
  try {
    currentVariants = variantsJSON ? JSON.parse(variantsJSON) : [];
    console.log('Loaded variants:', currentVariants);
  } catch (e) {
    console.error('Invalid JSON:', e);
    alert('Invalid JSON in variants field. Starting with empty variants.');
    currentVariants = [];
  }

  renderVariantsEditor();
  const modal = document.getElementById('variants-modal');
  if (modal) {
    modal.classList.add('open');
    variantsModalOpen = true;
    console.log('Variants modal opened');
  } else {
    console.error('Variants modal not found!');
  }
}

function renderVariantsEditor() {
  const container = document.getElementById('variants-list');
  const jsonDisplay = document.getElementById('variants-json-display');

  if (!container || !jsonDisplay) {
    console.error('Variants editor containers not found!');
    return;
  }

  if (currentVariants.length === 0) {
    container.innerHTML = '<p style="text-align: center; color: #999; padding: 2rem;">No variants yet. Click "+ Add Variant" to create one.</p>';
  } else {
    container.innerHTML = currentVariants.map((variant, idx) => `
      <div style="background: #f9f9f9; border: 1px solid #ddd; border-radius: 8px; padding: 1.2rem; margin-bottom: 1rem;">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-bottom: 1rem;">
          <div>
            <label style="display: block; font-weight: 600; margin-bottom: 0.5rem; font-size: 0.95rem;">Variant Name</label>
            <input type="text" value="${variant.title || variant.label || ''}" 
              onchange="updateVariant(${idx}, 'title', this.value)"
              placeholder="e.g., Standard, Pro, Boxed"
              style="width: 100%; padding: 0.7rem; border: 1px solid #ddd; border-radius: 4px; font-size: 0.95rem;" />
          </div>
          <div>
            <label style="display: block; font-weight: 600; margin-bottom: 0.5rem; font-size: 0.95rem;">Price (₱)</label>
            <input type="number" value="${variant.price || 0}" min="0" step="100"
              onchange="updateVariant(${idx}, 'price', parseFloat(this.value))"
              style="width: 100%; padding: 0.7rem; border: 1px solid #ddd; border-radius: 4px; font-size: 0.95rem;" />
          </div>
        </div>
        <div style="margin-bottom: 1rem;">
          <label style="display: block; font-weight: 600; margin-bottom: 0.5rem; font-size: 0.95rem;">Stock Quantity</label>
          <input type="number" value="${variant.stock || 0}" min="0"
            onchange="updateVariant(${idx}, 'stock', parseInt(this.value))"
            style="width: 100%; padding: 0.7rem; border: 1px solid #ddd; border-radius: 4px; font-size: 0.95rem;" />
        </div>
        <button type="button" class="btn btn-danger btn-sm" onclick="removeVariant(${idx})" style="background-color: #d32f2f; color: white; padding: 0.5rem 1rem; border: none; border-radius: 4px; cursor: pointer;">
          🗑️ Remove Variant
        </button>
      </div>
    `).join('');
  }

  // Update JSON display
  jsonDisplay.textContent = JSON.stringify(currentVariants, null, 2);
}

function updateVariant(idx, field, value) {
  if (currentVariants[idx]) {
    currentVariants[idx][field] = value;
    console.log('Updated variant:', idx, field, value);
    renderVariantsEditor();
  }
}

function removeVariant(idx) {
  if (confirm(`Remove variant "${currentVariants[idx]?.title || 'Variant'}"?`)) {
    currentVariants.splice(idx, 1);
    renderVariantsEditor();
  }
}

function addVariant() {
  currentVariants.push({
    title: `Variant ${currentVariants.length + 1}`,
    price: 0,
    stock: 0
  });
  console.log('Added new variant');
  renderVariantsEditor();
}

function saveVariants() {
  if (currentVariants.length === 0) {
    if (!confirm('No variants added. Continue without variants?')) {
      return;
    }
  }
  
  document.getElementById('product-variants').value = JSON.stringify(currentVariants);
  document.getElementById('variants-modal').classList.remove('open');
  variantsModalOpen = false;
  console.log('Variants saved');
}

// ========================================
// MODAL HANDLERS
// ========================================

function initModals() {
  // Close modal buttons
  document
    .querySelectorAll('.modal-close, [data-action="cancel"]')
    .forEach((btn) => {
      btn.addEventListener('click', () => {
        btn.closest('.modal')?.classList.remove('open');
      });
    });

  // Add buttons open modals
  document.getElementById('add-admin-btn')?.addEventListener('click', () => {
    const adminModal = document.getElementById('admin-modal');
    const adminForm = document.getElementById('admin-form');
    const modalTitle = document.getElementById('admin-modal-title');

    // Reset form for new entry
    adminForm.reset();
    document.getElementById('admin-email').disabled = false;
    modalTitle.textContent = 'Add New Admin';

    adminModal.classList.add('open');

    // Handle form submission
    adminForm.onsubmit = async (e) => {
      e.preventDefault();
      const email = document.getElementById('admin-email').value.trim();
      const fullName = document.getElementById('admin-name').value.trim();
      const password = document.getElementById('admin-password').value;

      if (!password) {
        alert('Password is required for new admin');
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
        await ManagementAPI.createAdmin(email, password, firstName, lastName);
        alert('Admin created successfully');
        adminModal.classList.remove('open');
        loadAdmins();
      } catch (error) {
        alert('Error creating admin: ' + error.message);
      }
    };
  });

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
        await ManagementAPI.createEmployee(
          email,
          password,
          firstName,
          lastName
        );
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

    // Load categories
    loadCategories();

    productModal.classList.add('open');

    // Handle form submission
    productForm.onsubmit = async (e) => {
      e.preventDefault();
      const name = document.getElementById('product-title').value.trim();
      const category = document.getElementById('product-category').value.trim();
      // Price field removed from UI - use 0
      const basePrice = 0;
      let variants = [];

      const variantsStr = document
        .getElementById('product-variants')
        .value.trim();
      if (variantsStr) {
        try {
          variants = JSON.parse(variantsStr);
        } catch (e) {
          alert('Invalid JSON format for variants');
          return;
        }
      }

      if (!name || !category) {
        alert('Please fill in all required fields');
        return;
      }

      try {
        const result = await ProductsAPI.createProduct(name, category, basePrice, variants);
        productModal.classList.remove('open');
        
        // Reload products table immediately to show the new product with correct numbering
        await loadProducts();
      } catch (error) {
        console.error('Error creating product:', error);
        alert('Error creating product: ' + error.message);
      }
    };
  });

  // Variants editor buttons
  const editVariantsBtn = document.getElementById('edit-variants-btn');
  const addVariantBtn = document.getElementById('add-variant-btn');
  const variantsSaveBtn = document.getElementById('variants-save-btn');
  
  if (editVariantsBtn) {
    editVariantsBtn.addEventListener('click', openVariantsEditor);
    console.log('✓ Edit Variants button listener added');
  }
  if (addVariantBtn) {
    addVariantBtn.addEventListener('click', addVariant);
    console.log('✓ Add Variant button listener added');
  }
  if (variantsSaveBtn) {
    variantsSaveBtn.addEventListener('click', saveVariants);
    console.log('✓ Save Variants button listener added');
  }
}

// ========================================
// LOGOUT
// ========================================

async function loadAuditLogs() {
  const tbody = document.getElementById('audit-tbody');
  if (!tbody) return;

  try {
    const data = await AuditAPI.getAuditLogs(1000);

    if (!data.audit_logs || data.audit_logs.length === 0) {
      paginationState.audit.allData = [];
      paginationState.audit.totalItems = 0;
      paginationState.audit.currentPage = 1;
      tbody.innerHTML =
        '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#666;">No audit logs found</td></tr>';
      return;
    }

    // Store all data and update pagination state
    paginationState.audit.allData = data.audit_logs;
    paginationState.audit.totalItems = data.audit_logs.length;
    paginationState.audit.currentPage = 1;

    // Display first page
    updatePaginationDisplay('audit');
  } catch (error) {
    console.error('Error loading audit logs:', error);
    tbody.innerHTML =
      '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#ef4444;">Error loading audit logs</td></tr>';
  }
}

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
  const fullName = [user.first_name || '', user.last_name || '']
    .filter(Boolean)
    .join(' ');
  console.log('[loadProfileData] Setting full name to:', fullName);

  const fullNameInput = document.getElementById('profile-full-name');
  if (fullNameInput) {
    fullNameInput.value = fullName;
    console.log(
      '[loadProfileData] Full name input updated to:',
      fullNameInput.value
    );
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
  const phone = document.getElementById('profile-phone').value.trim();
  const currentPassword = document.getElementById(
    'profile-current-password'
  ).value;
  const newPassword = document.getElementById('profile-new-password').value;
  const confirmPassword = document.getElementById(
    'profile-confirm-password'
  ).value;

  if (!fullName) {
    alert('Full name is required');
    return;
  }

  // Validate phone number (must be exactly 11 digits if provided)
  if (phone && !/^\d{11}$/.test(phone)) {
    alert('Phone number must be exactly 11 digits');
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
    phone: document.getElementById('profile-phone').value.trim(),
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
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: new URLSearchParams({
        first_name: updates.first_name,
        last_name: updates.last_name,
        phone: updates.phone,
        current_password: updates.current_password || '',
        new_password: updates.new_password || '',
      }),
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

      const welcomeEl = document.getElementById('superadmin-welcome');
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

      console.log('Updated superadmin profile UI with:', fullNameDisplay);

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
// SALES DASHBOARD
// ========================================

let monthlyChart = null;
let yearlyChart = null;

// Store current analytics data and period
let currentAnalyticsData = null;
let currentPeriod = 'daily';

async function loadSalesDashboard(year = new Date().getFullYear(), month = new Date().getMonth() + 1) {
  try {
    // Load Chart.js if not already loaded
    if (typeof Chart === 'undefined') {
      await loadChartJS();
    }

    console.log('Loading sales dashboard for year:', year, 'month:', month);
    
    const data = await OrdersAPI.getSalesAnalytics(year, month);
    console.log('Sales analytics data:', data);
    
    // Store data for period switching
    currentAnalyticsData = data;
    
    // Update summary cards
    updateSalesSummary(data);
    
    // Populate year selector
    populateYearSelector(data.yearly, data.selected_year);
    
    // Initialize period tabs
    initPeriodTabs();
    
    // Render charts based on current period
    renderSalesChart(currentPeriod);
    renderYearlyChart(data.yearly);
    renderStatusChart(data.sales_by_status);
    renderTopProducts(data.top_products);
    
    // Populate status chart year selector
    populateStatusChartYearSelector(data.yearly, data.selected_year);
    
  } catch (error) {
    console.error('Error loading sales dashboard:', error);
    console.error('Error message:', error?.message);
    const topProductsList = document.getElementById('top-products-list');
    const errorMsg = error && error.message ? error.message : 'Unknown error - please try logging in again';
    if (topProductsList) {
      topProductsList.innerHTML = '<p style="color: #ef4444; text-align: center; padding: 1rem;">Error loading analytics: ' + errorMsg + '</p>';
    }
  }
}

function initPeriodTabs() {
  const periodBtns = document.querySelectorAll('.period-btn');
  periodBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      // Update active state
      periodBtns.forEach(b => {
        b.style.background = 'transparent';
        b.style.color = '#666';
      });
      btn.style.background = '#2d2d2d';
      btn.style.color = 'white';
      
      // Update current period and re-render chart
      currentPeriod = btn.dataset.period;
      renderSalesChart(currentPeriod);
    });
  });
}

function renderSalesChart(period) {
  if (!currentAnalyticsData) return;
  
  switch (period) {
    case 'daily':
      renderDailyChart(currentAnalyticsData.daily, currentAnalyticsData.selected_year, currentAnalyticsData.selected_month);
      break;
    case 'weekly':
      renderWeeklyChart(currentAnalyticsData.weekly, currentAnalyticsData.selected_year);
      break;
    case 'monthly':
      renderMonthlyChart(currentAnalyticsData.monthly, currentAnalyticsData.selected_year);
      break;
    case 'yearly':
      renderYearlySalesChart(currentAnalyticsData.yearly);
      break;
  }
}

function loadChartJS() {
  return new Promise((resolve, reject) => {
    if (typeof Chart !== 'undefined') {
      resolve();
      return;
    }
    
    const script = document.createElement('script');
    // Use local Chart.js to avoid CSP issues
    script.src = window.router ? window.router.baseRoot + '/JS/chart.min.js' : '/JS/chart.min.js';
    script.onload = resolve;
    script.onerror = (e) => {
      console.error('Failed to load Chart.js:', e);
      reject(new Error('Failed to load Chart.js library'));
    };
    document.head.appendChild(script);
  });
}

function updateSalesSummary(data) {
  // Today's sales
  const todaySales = document.getElementById('today-sales');
  const todayOrders = document.getElementById('today-orders');
  if (todaySales) todaySales.textContent = formatPHP(data.today?.total_sales || 0);
  if (todayOrders) todayOrders.textContent = `${data.today?.order_count || 0} orders`;
  
  // This week's sales
  const weekSales = document.getElementById('week-sales');
  const weekOrders = document.getElementById('week-orders');
  if (weekSales) weekSales.textContent = formatPHP(data.this_week?.total_sales || 0);
  if (weekOrders) weekOrders.textContent = `${data.this_week?.order_count || 0} orders`;
  
  // This month's sales
  const monthSales = document.getElementById('month-sales');
  const monthOrders = document.getElementById('month-orders');
  if (monthSales) monthSales.textContent = formatPHP(data.this_month?.total_sales || 0);
  if (monthOrders) monthOrders.textContent = `${data.this_month?.order_count || 0} orders`;
  
  // This year's sales
  const yearSales = document.getElementById('year-sales');
  const yearOrders = document.getElementById('year-orders');
  if (yearSales) yearSales.textContent = formatPHP(data.this_year?.total_sales || 0);
  if (yearOrders) yearOrders.textContent = `${data.this_year?.order_count || 0} orders`;
  
  // Completed orders
  const completedSales = document.getElementById('completed-sales');
  const completedOrders = document.getElementById('completed-orders');
  if (completedSales) completedSales.textContent = formatPHP(data.completed_orders?.total_sales || 0);
  if (completedOrders) completedOrders.textContent = `${data.completed_orders?.order_count || 0} orders`;
}

function populateYearSelector(yearlyData, selectedYear) {
  const yearSelect = document.getElementById('chart-year-select');
  if (!yearSelect) return;
  
  // Get unique years from data, or generate recent years
  const currentYear = new Date().getFullYear();
  const years = new Set();
  
  // Add years from data
  if (yearlyData && yearlyData.length > 0) {
    yearlyData.forEach(y => years.add(parseInt(y.year)));
  }
  
  // Add current and recent years
  for (let i = 0; i < 5; i++) {
    years.add(currentYear - i);
  }
  
  // Sort descending
  const sortedYears = Array.from(years).sort((a, b) => b - a);
  
  yearSelect.innerHTML = sortedYears.map(y => 
    `<option value="${y}" ${y == selectedYear ? 'selected' : ''}>${y}</option>`
  ).join('');
  
  // Add change listener
  yearSelect.onchange = () => {
    loadSalesDashboard(parseInt(yearSelect.value));
  };
}

function renderMonthlyChart(monthlyData, year) {
  const ctx = document.getElementById('monthly-sales-chart');
  if (!ctx) return;
  
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  const salesData = monthlyData.map(m => parseFloat(m.total_sales) || 0);
  const ordersData = monthlyData.map(m => parseInt(m.order_count) || 0);
  
  // Destroy existing chart
  if (monthlyChart) {
    monthlyChart.destroy();
  }
  
  monthlyChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: months,
      datasets: [
        {
          label: 'Sales (₱)',
          data: salesData,
          backgroundColor: 'rgba(59, 130, 246, 0.85)',
          borderColor: 'rgba(59, 130, 246, 1)',
          borderWidth: 1,
          borderRadius: 6,
          yAxisID: 'y'
        },
        {
          label: 'Orders',
          data: ordersData,
          type: 'line',
          borderColor: 'rgba(34, 197, 94, 1)',
          backgroundColor: 'rgba(34, 197, 94, 0.15)',
          borderWidth: 3,
          fill: true,
          tension: 0.4,
          pointRadius: 4,
          pointBackgroundColor: 'rgba(34, 197, 94, 1)',
          yAxisID: 'y1'
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      interaction: {
        mode: 'index',
        intersect: false
      },
      plugins: {
        legend: {
          position: 'top',
          labels: {
            usePointStyle: true,
            padding: 20
          }
        },
        tooltip: {
          callbacks: {
            label: function(context) {
              if (context.dataset.label === 'Sales (₱)') {
                return `Sales: ${formatPHP(context.raw)}`;
              }
              return `Orders: ${context.raw}`;
            }
          }
        }
      },
      scales: {
        y: {
          type: 'linear',
          position: 'left',
          beginAtZero: true,
          title: {
            display: true,
            text: 'Sales (₱)'
          },
          ticks: {
            callback: function(value) {
              return '₱' + value.toLocaleString();
            }
          }
        },
        y1: {
          type: 'linear',
          position: 'right',
          beginAtZero: true,
          title: {
            display: true,
            text: 'Orders'
          },
          grid: {
            drawOnChartArea: false
          }
        }
      }
    }
  });
}

function renderDailyChart(dailyData, year, month) {
  const ctx = document.getElementById('monthly-sales-chart');
  if (!ctx) return;
  
  const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 
                      'July', 'August', 'September', 'October', 'November', 'December'];
  
  const labels = dailyData.map(d => d.day);
  const salesData = dailyData.map(d => parseFloat(d.total_sales) || 0);
  const ordersData = dailyData.map(d => parseInt(d.order_count) || 0);
  
  // Destroy existing chart
  if (monthlyChart) {
    monthlyChart.destroy();
  }
  
  monthlyChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [
        {
          label: 'Sales (₱)',
          data: salesData,
          backgroundColor: 'rgba(59, 130, 246, 0.85)',
          borderColor: 'rgba(59, 130, 246, 1)',
          borderWidth: 1,
          borderRadius: 4,
          yAxisID: 'y'
        },
        {
          label: 'Orders',
          data: ordersData,
          type: 'line',
          borderColor: 'rgba(34, 197, 94, 1)',
          backgroundColor: 'rgba(34, 197, 94, 0.15)',
          borderWidth: 2,
          fill: true,
          tension: 0.4,
          pointRadius: 2,
          pointBackgroundColor: 'rgba(34, 197, 94, 1)',
          yAxisID: 'y1'
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      interaction: { mode: 'index', intersect: false },
      plugins: {
        title: {
          display: true,
          text: `Daily Sales - ${monthNames[month - 1]} ${year}`,
          font: { size: 14 }
        },
        legend: { position: 'top', labels: { usePointStyle: true, padding: 15 } },
        tooltip: {
          callbacks: {
            title: (items) => `Day ${items[0].label}`,
            label: (ctx) => ctx.dataset.label === 'Sales (₱)' ? `Sales: ${formatPHP(ctx.raw)}` : `Orders: ${ctx.raw}`
          }
        }
      },
      scales: {
        y: { type: 'linear', position: 'left', beginAtZero: true, ticks: { callback: v => '₱' + v.toLocaleString() } },
        y1: { type: 'linear', position: 'right', beginAtZero: true, grid: { drawOnChartArea: false } }
      }
    }
  });
}

function renderWeeklyChart(weeklyData, year) {
  const ctx = document.getElementById('monthly-sales-chart');
  if (!ctx) return;
  
  // Filter to only show weeks with data or up to current week
  const currentWeek = Math.ceil((new Date() - new Date(year, 0, 1)) / (7 * 24 * 60 * 60 * 1000));
  const maxWeek = year === new Date().getFullYear() ? Math.min(currentWeek + 1, 52) : 52;
  const filteredData = weeklyData.slice(0, maxWeek);
  
  const labels = filteredData.map(w => `W${w.week}`);
  const salesData = filteredData.map(w => parseFloat(w.total_sales) || 0);
  const ordersData = filteredData.map(w => parseInt(w.order_count) || 0);
  
  if (monthlyChart) {
    monthlyChart.destroy();
  }
  
  monthlyChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [
        {
          label: 'Sales (₱)',
          data: salesData,
          backgroundColor: 'rgba(168, 85, 247, 0.85)',
          borderColor: 'rgba(168, 85, 247, 1)',
          borderWidth: 1,
          borderRadius: 4,
          yAxisID: 'y'
        },
        {
          label: 'Orders',
          data: ordersData,
          type: 'line',
          borderColor: 'rgba(249, 115, 22, 1)',
          backgroundColor: 'rgba(249, 115, 22, 0.15)',
          borderWidth: 2,
          fill: true,
          tension: 0.4,
          pointRadius: 2,
          pointBackgroundColor: 'rgba(249, 115, 22, 1)',
          yAxisID: 'y1'
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      interaction: { mode: 'index', intersect: false },
      plugins: {
        title: { display: true, text: `Weekly Sales - ${year}`, font: { size: 14 } },
        legend: { position: 'top', labels: { usePointStyle: true, padding: 15 } },
        tooltip: {
          callbacks: {
            label: (ctx) => ctx.dataset.label === 'Sales (₱)' ? `Sales: ${formatPHP(ctx.raw)}` : `Orders: ${ctx.raw}`
          }
        }
      },
      scales: {
        y: { type: 'linear', position: 'left', beginAtZero: true, ticks: { callback: v => '₱' + v.toLocaleString() } },
        y1: { type: 'linear', position: 'right', beginAtZero: true, grid: { drawOnChartArea: false } }
      }
    }
  });
}

function renderYearlySalesChart(yearlyData) {
  const ctx = document.getElementById('monthly-sales-chart');
  if (!ctx) return;
  
  const sortedData = [...(yearlyData || [])].sort((a, b) => a.year - b.year);
  const labels = sortedData.map(y => y.year);
  const salesData = sortedData.map(y => parseFloat(y.total_sales) || 0);
  const ordersData = sortedData.map(y => parseInt(y.order_count) || 0);
  
  if (monthlyChart) {
    monthlyChart.destroy();
  }
  
  monthlyChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [
        {
          label: 'Sales (₱)',
          data: salesData,
          backgroundColor: ['rgba(59, 130, 246, 0.85)', 'rgba(34, 197, 94, 0.85)', 'rgba(168, 85, 247, 0.85)', 'rgba(249, 115, 22, 0.85)', 'rgba(236, 72, 153, 0.85)'],
          borderColor: ['rgba(59, 130, 246, 1)', 'rgba(34, 197, 94, 1)', 'rgba(168, 85, 247, 1)', 'rgba(249, 115, 22, 1)', 'rgba(236, 72, 153, 1)'],
          borderWidth: 1,
          borderRadius: 6,
          yAxisID: 'y'
        },
        {
          label: 'Orders',
          data: ordersData,
          type: 'line',
          borderColor: 'rgba(236, 72, 153, 1)',
          backgroundColor: 'rgba(236, 72, 153, 0.15)',
          borderWidth: 3,
          fill: true,
          tension: 0.4,
          pointRadius: 5,
          pointBackgroundColor: 'rgba(236, 72, 153, 1)',
          yAxisID: 'y1'
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      interaction: { mode: 'index', intersect: false },
      plugins: {
        title: { display: true, text: 'Yearly Sales Overview', font: { size: 14 } },
        legend: { position: 'top', labels: { usePointStyle: true, padding: 15 } },
        tooltip: {
          callbacks: {
            label: (ctx) => ctx.dataset.label === 'Sales (₱)' ? `Sales: ${formatPHP(ctx.raw)}` : `Orders: ${ctx.raw}`
          }
        }
      },
      scales: {
        y: { type: 'linear', position: 'left', beginAtZero: true, ticks: { callback: v => '₱' + v.toLocaleString() } },
        y1: { type: 'linear', position: 'right', beginAtZero: true, grid: { drawOnChartArea: false } }
      }
    }
  });
}

function renderYearlyChart(yearlyData) {
  const ctx = document.getElementById('yearly-sales-chart');
  if (!ctx) return;
  
  // Sort by year ascending for display
  const sortedData = [...(yearlyData || [])].sort((a, b) => a.year - b.year);
  
  const years = sortedData.map(y => y.year);
  const salesData = sortedData.map(y => parseFloat(y.total_sales) || 0);
  const ordersData = sortedData.map(y => parseInt(y.order_count) || 0);
  
  // Destroy existing chart
  if (yearlyChart) {
    yearlyChart.destroy();
  }
  
  yearlyChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: years,
      datasets: [
        {
          label: 'Total Sales (₱)',
          data: salesData,
          backgroundColor: [
            'rgba(59, 130, 246, 0.85)',
            'rgba(34, 197, 94, 0.85)',
            'rgba(168, 85, 247, 0.85)',
            'rgba(249, 115, 22, 0.85)',
            'rgba(236, 72, 153, 0.85)'
          ],
          borderColor: [
            'rgba(59, 130, 246, 1)',
            'rgba(34, 197, 94, 1)',
            'rgba(168, 85, 247, 1)',
            'rgba(249, 115, 22, 1)',
            'rgba(236, 72, 153, 1)'
          ],
          borderWidth: 1,
          borderRadius: 8
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false
        },
        tooltip: {
          callbacks: {
            label: function(context) {
              const idx = context.dataIndex;
              const orders = ordersData[idx];
              return [
                `Sales: ${formatPHP(context.raw)}`,
                `Orders: ${orders}`
              ];
            }
          }
        }
      },
      scales: {
        y: {
          beginAtZero: true,
          ticks: {
            callback: function(value) {
              return '₱' + value.toLocaleString();
            }
          }
        }
      }
    }
  });
}

let statusChart = null;
let statusChartYear = null; // Store selected year for status chart

function populateStatusChartYearSelector(yearlyData, selectedYear) {
  const yearSelect = document.getElementById('status-chart-year-select');
  if (!yearSelect) return;
  
  const currentYear = new Date().getFullYear();
  const years = new Set();
  
  // Add years from data
  if (yearlyData && yearlyData.length > 0) {
    yearlyData.forEach(y => years.add(parseInt(y.year)));
  }
  
  // Add current and recent years
  for (let i = 0; i < 5; i++) {
    years.add(currentYear - i);
  }
  
  // Sort descending
  const sortedYears = Array.from(years).sort((a, b) => b - a);
  
  // Keep the "All Years" option and add year options
  const existingValue = yearSelect.value;
  yearSelect.innerHTML = '<option value="">All Years</option>' + sortedYears.map(y => 
    `<option value="${y}">${y}</option>`
  ).join('');
  
  // Set value if it was previously set
  if (existingValue) yearSelect.value = existingValue;
  
  // Add change listener
  yearSelect.onchange = () => {
    statusChartYear = yearSelect.value ? parseInt(yearSelect.value) : null;
    loadStatusChartData();
  };
}

async function loadStatusChartData() {
  try {
    const year = statusChartYear; // Pass null/undefined for all years, or specific year number
    const response = await OrdersAPI.getOrdersByStatus(year);
    renderStatusChart(response.sales_by_status);
  } catch (error) {
    console.error('Error loading status chart data:', error);
  }
}

function renderStatusChart(salesByStatus) {
  const ctx = document.getElementById('status-chart');
  if (!ctx) return;
  
  console.log('Rendering status chart:', salesByStatus);
  
  const statusColors = {
    'pending': '#f59e0b',
    'processing': '#3b82f6',
    'paid': '#06b6d4',
    'shipped': '#8b5cf6',
    'completed': '#10b981',
    'cancelled': '#ef4444',
    'refunded': '#6b7280'
  };
  
  const statusLabels = {
    'pending': 'Pending',
    'processing': 'Processing',
    'paid': 'Paid',
    'shipped': 'Shipped',
    'completed': 'Completed',
    'cancelled': 'Cancelled',
    'refunded': 'Refunded'
  };
  
  const data = salesByStatus || [];
  const labels = data.map(s => statusLabels[s.status] || s.status);
  const counts = data.map(s => parseInt(s.order_count) || 0);
  const colors = data.map(s => statusColors[s.status] || '#6b7280');
  
  // Destroy existing chart
  if (statusChart) {
    statusChart.destroy();
  }
  
  statusChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: labels,
      datasets: [{
        data: counts,
        backgroundColor: colors,
        borderWidth: 2,
        borderColor: '#fff'
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'right',
          labels: {
            padding: 15,
            usePointStyle: true
          }
        },
        tooltip: {
          callbacks: {
            label: function(context) {
              const total = context.dataset.data.reduce((a, b) => a + b, 0);
              const percentage = ((context.raw / total) * 100).toFixed(1);
              return `${context.label}: ${context.raw} (${percentage}%)`;
            }
          }
        }
      }
    }
  });
}

function renderTopProducts(topProducts) {
  const container = document.getElementById('top-products-list');
  if (!container) return;
  
  console.log('Rendering top products:', topProducts);
  
  if (!topProducts || topProducts.length === 0) {
    container.innerHTML = '<p style="color: #666; text-align: center; padding: 2rem;">No sales data available yet</p>';
    return;
  }
  
  const html = topProducts.map((product, index) => `
    <div style="display: flex; align-items: center; padding: 0.75rem; border-bottom: 1px solid #eee; ${index === 0 ? 'background: #f5f5f5;' : ''}">
      <div style="width: 30px; height: 30px; border-radius: 50%; background: ${index < 3 ? ['#1a1a1a', '#525252', '#7a7a7a'][index] : '#e5e7eb'}; color: ${index < 3 ? '#fff' : '#666'}; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 0.85rem; margin-right: 1rem;">
        ${index + 1}
      </div>
      <div style="flex: 1; min-width: 0;">
        <div style="font-weight: 600; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="${product.product_name}">
          ${product.product_name}
        </div>
        <div style="font-size: 0.8rem; color: #666;">
          ${product.total_quantity} units sold • ${product.order_count} orders
        </div>
      </div>
      <div style="text-align: right; margin-left: 1rem;">
        <div style="font-weight: 700; color: #2d2d2d;">${formatPHP(product.total_revenue)}</div>
      </div>
    </div>
  `).join('');
  
  container.innerHTML = html;
}

// ========================================

function initLogout() {
  document
    .getElementById('superadmin-logout-btn')
    ?.addEventListener('click', () => {
      doLogout(true);
    });
}

function initProfileHandlers() {
  const profileForm = document.getElementById('profile-edit-form');
  if (profileForm) {
    profileForm.addEventListener('submit', handleProfileSubmit);
  }

  const refreshAuditBtn = document.getElementById('refresh-audit-btn');
  if (refreshAuditBtn) {
    refreshAuditBtn.addEventListener('click', () => {
      loadAuditLogs();
    });
  }
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
  initProfileHandlers();
}

// Make functions globally available
window.initSuperadminPage = initSuperadminPage;
window.initializeSuperAdmin = initSuperadminPage; // Alias for script.js compatibility
window.viewProduct = viewProduct;
window.editProduct = editProduct;
window.deleteProduct = deleteProduct;
window.editStock = editStock;
window.openVariantsEditor = openVariantsEditor;
window.addVariant = addVariant;
window.removeVariant = removeVariant;
window.updateVariant = updateVariant;
window.saveVariants = saveVariants;
window.editAdmin = editAdmin;
window.deleteAdmin = deleteAdmin;
window.editUser = editUser;
window.deleteUser = deleteUser;
window.reactivateUser = reactivateUser;
window.editEmployee = editEmployee;
window.deleteEmployee = deleteEmployee;
window.reactivateEmployee = reactivateEmployee;
window.viewOrder = viewOrder;
window.deleteOrder = deleteOrder;
window.resetProfileForm = resetProfileForm;
window.handleProfileSubmit = handleProfileSubmit;
window.loadAuditLogs = loadAuditLogs;
window.loadSalesDashboard = loadSalesDashboard;

// Auto-init removed to prevent double initialization by router
