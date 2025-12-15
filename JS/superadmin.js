/**
 * Superadmin Dashboard Handler
 * Manages admins, users, employees, products, and orders
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

  // Restore previously active tab or default to 'admins'
  const savedTab = localStorage.getItem('superadmin_active_tab') || 'admins';
  
  // Immediately set the correct tab as active before any rendering
  const savedTabBtn = document.querySelector(`[data-tab="${savedTab}"]`);
  const savedTabContent = document.getElementById(`${savedTab}-tab`);
  
  if (savedTabBtn && savedTabContent) {
    savedTabBtn.classList.add('active');
    savedTabContent.classList.add('active');
    loadTabData(savedTab);
  } else {
    // Fallback to admins
    const firstTabBtn = document.querySelector('[data-tab="admins"]');
    const firstTabContent = document.getElementById('admins-tab');
    if (firstTabBtn && firstTabContent) {
      firstTabBtn.classList.add('active');
      firstTabContent.classList.add('active');
      loadTabData('admins');
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
      filterTable('users-tbody');
    });
  }

  // Employee search
  const employeeSearch = document.getElementById('employee-search');
  if (employeeSearch) {
    employeeSearch.addEventListener('input', () => {
      filterTable('employees-tbody');
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

function filterTable(tableBodyId) {
  const tbody = document.getElementById(tableBodyId);
  if (!tbody) return;

  // Determine which search input to use based on table
  let searchInput = null;
  if (tableBodyId === 'admins-tbody') {
    searchInput = document.getElementById('admin-search');
  } else if (tableBodyId === 'users-tbody') {
    searchInput = document.getElementById('user-search');
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
      tbody.innerHTML =
        '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No admins found</td></tr>';
      return;
    }

    tbody.innerHTML = '';
    data.admins.forEach((admin) => {
      const row = document.createElement('tr');
      const createdDate = new Date(admin.created_at).toLocaleDateString();
      const roleColor = admin.role === 'superadmin' ? '#8b5cf6' : '#3b82f6';
      row.innerHTML = `
                <td>${admin.id}</td>
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
  } catch (error) {
    console.error('Failed to load admins:', error);
    tbody.innerHTML =
      '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load admins</td></tr>';
  }
}

async function loadUsers() {
  const tbody = document.getElementById('users-tbody');
  if (!tbody) return;

  try {
    const data = await ManagementAPI.getUsers();

    if (!data.users || data.users.length === 0) {
      tbody.innerHTML =
        '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No users found</td></tr>';
      return;
    }

    tbody.innerHTML = '';
    data.users.forEach((user) => {
      const row = document.createElement('tr');
      const createdDate = new Date(user.created_at).toLocaleDateString();
      row.innerHTML = `
                <td>${user.id}</td>
                <td>${user.email}</td>
                <td>${user.first_name} ${user.last_name}</td>
                <td><span class="badge" style="background:#3b82f6">${
                  user.role || 'user'
                }</span></td>
                <td>${createdDate}</td>
                <td>
                    <button class="btn btn-sm" onclick="editUser(${user.id}, '${
        user.email
      }')">Edit</button>
                    <button class="btn btn-sm btn-danger" onclick="deleteUser(${
                      user.id
                    })">Delete</button>
                </td>
            `;
      tbody.appendChild(row);
    });
  } catch (error) {
    console.error('Failed to load users:', error);
    tbody.innerHTML =
      '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load users</td></tr>';
  }
}

async function loadEmployees() {
  const tbody = document.getElementById('employees-tbody');
  if (!tbody) return;

  try {
    const data = await ManagementAPI.getEmployees();

    if (!data.employees || data.employees.length === 0) {
      tbody.innerHTML =
        '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No employees found</td></tr>';
      return;
    }

    tbody.innerHTML = '';
    data.employees.forEach((emp) => {
      const row = document.createElement('tr');
      const createdDate = new Date(emp.created_at).toLocaleDateString();
      row.innerHTML = `
                <td>${emp.id}</td>
                <td>${emp.email}</td>
                <td>${emp.first_name} ${emp.last_name}</td>
                <td><span class="badge" style="background:#f59e0b">${
                  emp.role || 'employee'
                }</span></td>
                <td>${createdDate}</td>
                <td>
                    <button class="btn btn-sm" onclick="editEmployee(${
                      emp.id
                    }, '${emp.email}')">Edit</button>
                    <button class="btn btn-sm btn-danger" onclick="deleteEmployee(${
                      emp.id
                    })">Delete</button>
                </td>
            `;
      tbody.appendChild(row);
    });
  } catch (error) {
    console.error('Failed to load employees:', error);
    tbody.innerHTML =
      '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load employees</td></tr>';
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
  if (!tbody) return;

  tbody.innerHTML =
    '<tr><td colspan="7" style="text-align:center;padding:2rem">Loading products...</td></tr>';

  try {
    const data = await ProductsAPI.getAllProducts();

    if (!data.products || data.products.length === 0) {
      tbody.innerHTML =
        '<tr><td colspan="7" style="text-align:center;padding:2rem;color:#666;">No products found</td></tr>';
      return;
    }

    tbody.innerHTML = '';
    data.products.forEach((product, index) => {
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
                <td>${index + 1}</td>
                <td>${product.name}</td>
                <td>${product.category_name || 'N/A'}</td>
                <td>${formatPHP(minPrice)}</td>
                <td>${variants.length}</td>
                <td id="stock-${product.id}">${totalStock}</td>
                <td>
                    <button class="btn btn-sm" onclick="viewProduct(${
                      product.id
                    })">View</button>
                    <button class="btn btn-sm" onclick="editProduct(${
                      product.id
                    })">Edit</button>
                    <button class="btn btn-sm" onclick="editStock(${
                      product.id
                    })">Stock</button>
                    <button class="btn btn-sm btn-danger" onclick="deleteProduct(${
                      product.id
                    })">Delete</button>
                </td>
            `;
      tbody.appendChild(row);
    });
  } catch (error) {
    console.error('Failed to load products:', error);
    tbody.innerHTML =
      '<tr><td colspan="7" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load products</td></tr>';
  }
}

function getStatusColor(status) {
  const statusColors = {
    'pending': '#f59e0b',
    'processing': '#3b82f6',
    'shipped': '#8b5cf6',
    'out_for_delivery': '#06b6d4',
    'delivered': '#10b981',
    'cancelled': '#ef4444'
  };
  return statusColors[status] || '#6b7280';
}

function getStatusLabel(status) {
  const labels = {
    'pending': 'Pending',
    'processing': 'Processing',
    'shipped': 'Shipped',
    'out_for_delivery': 'Out for Delivery personnel',
    'delivered': 'Delivered',
    'cancelled': 'Cancelled'
  };
  return labels[status] || status;
}

async function loadOrders() {
  const tbody = document.getElementById('orders-tbody');
  if (!tbody) return;

  try {
    const data = await OrdersAPI.getOrders();

    if (!data.orders || data.orders.length === 0) {
      tbody.innerHTML =
        '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No orders found</td></tr>';
      return;
    }

    tbody.innerHTML = '';
    data.orders.forEach((order) => {
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
                    <button class="btn btn-sm" onclick="viewOrder(${
                      order.id
                    })">View</button>
                    <button class="btn btn-sm btn-danger" onclick="deleteOrder(${order.id}, '${order.order_number}')">Delete</button>
                </td>
            `;
      tbody.appendChild(row);
    });
  } catch (error) {
    console.error('Failed to load orders:', error);
    tbody.innerHTML =
      '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load orders</td></tr>';
  }
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
    'Are you sure you want to delete this user? This action cannot be undone.',
    async () => {
      try {
        await ManagementAPI.deleteUser(userId);
        alert('User deleted successfully');
        loadUsers();
      } catch (error) {
        alert('Error deleting user: ' + error.message);
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
    'Are you sure you want to delete this employee? This action cannot be undone.',
    async () => {
      try {
        await ManagementAPI.deleteEmployee(employeeId);
        alert('Employee deleted successfully');
        loadEmployees();
      } catch (error) {
        alert('Error deleting employee: ' + error.message);
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
    
    // Status options with display names
    const statusOptions = [
      { value: 'pending', label: 'Pending', color: '#f59e0b' },
      { value: 'processing', label: 'Processing', color: '#3b82f6' },
      { value: 'shipped', label: 'Shipped', color: '#8b5cf6' },
      { value: 'out_for_delivery', label: 'Out for Delivery personnel', color: '#06b6d4' },
      { value: 'delivered', label: 'Delivered', color: '#10b981' },
      { value: 'cancelled', label: 'Cancelled', color: '#ef4444' }
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
      tbody.innerHTML =
        '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#666;">No audit logs found</td></tr>';
      return;
    }

    tbody.innerHTML = '';
    data.audit_logs.forEach((log) => {
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
                <td>${timestamp}</td>
                <td><span class="badge" style="background:${actionBadgeColor}">${log.action}</span></td>
                <td>${log.entity_type}</td>
                <td>${log.entity_id}</td>
                <td>${userDisplay}</td>
                <td><code style="font-size:0.85rem; color:#666;">${detailsDisplay}</code></td>
            `;
      tbody.appendChild(row);
    });
  } catch (error) {
    console.error('Error loading audit logs:', error);
    tbody.innerHTML =
      '<tr><td colspan="6" style="text-align:center;padding:2rem;color:#ef4444;">Error loading audit logs</td></tr>';
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
window.editEmployee = editEmployee;
window.deleteEmployee = deleteEmployee;
window.viewOrder = viewOrder;
window.deleteOrder = deleteOrder;
window.resetProfileForm = resetProfileForm;
window.handleProfileSubmit = handleProfileSubmit;
window.loadAuditLogs = loadAuditLogs;

// Auto-init removed to prevent double initialization by router
