/**
 * Employee Dashboard Handler
 * Manages products and orders
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
  products: { currentPage: 1, itemsPerPage: 10, totalItems: 0, allData: [], originalData: [] },
  orders: { currentPage: 1, itemsPerPage: 10, totalItems: 0, allData: [], originalData: [] }
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
        case 'products':
            renderProductRows(pageData, tbody);
            break;
        case 'orders':
            renderOrderRows(pageData, tbody);
            break;
    }
}

function renderProductRows(products, tbody) {
    products.forEach((product) => {
        const row = document.createElement('tr');
        // Calculate price and stock from variants
        const variants = product.variants || [];
        const minPrice = variants.length > 0 ? Math.min(...variants.map(v => parseFloat(v.price))) : 0;
        const totalStock = variants.reduce((sum, v) => sum + parseInt(v.stock || 0), 0);

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

function getStatusColor(status) {
    const statusColors = {
        'pending': '#f59e0b',
        'processing': '#3b82f6',
        'paid': '#06b6d4',
        'shipped': '#8b5cf6',
        'completed': '#10b981',
        'cancelled': '#ef4444',
        'refunded': '#6b7280'
    };
    return statusColors[status] || '#6b7280';
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

// ========================================
// TAB NAVIGATION
// ========================================

function initEmployeeTabs() {
    const tabBtns = document.querySelectorAll('.tab-btn');
    const tabContents = document.querySelectorAll('.tab-content');

    // Restore previously active tab or default to 'products'
    const savedTab = localStorage.getItem('employee_active_tab') || 'products';
    
    // Immediately set the correct tab as active before any rendering
    const savedTabBtn = document.querySelector(`[data-tab="${savedTab}"]`);
    const savedTabContent = document.getElementById(`${savedTab}-tab`);
    
    if (savedTabBtn && savedTabContent) {
        savedTabBtn.classList.add('active');
        savedTabContent.classList.add('active');
        loadTabData(savedTab);
    } else {
        // Fallback to products
        const firstTabBtn = document.querySelector('[data-tab="products"]');
        const firstTabContent = document.getElementById('products-tab');
        if (firstTabBtn && firstTabContent) {
            firstTabBtn.classList.add('active');
            firstTabContent.classList.add('active');
            loadTabData('products');
        }
    }

    // Set up click handlers
    tabBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const tabName = btn.getAttribute('data-tab');

            // Remove active class from all
            tabBtns.forEach(b => b.classList.remove('active'));
            tabContents.forEach(c => c.classList.remove('active'));

            // Add active class to clicked
            btn.classList.add('active');
            document.getElementById(`${tabName}-tab`)?.classList.add('active');

            // Save current tab to localStorage
            localStorage.setItem('employee_active_tab', tabName);

            // Load data for the tab
            loadTabData(tabName);
        });
    });

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

    tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;padding:2rem">Loading products...</td></tr>';

    try {
        console.log('Fetching products...');
        const data = await ProductsAPI.getAllProducts();
        console.log('Products loaded:', data);

        // Store all data in pagination state
        paginationState.products.allData = data.products || [];
        paginationState.products.originalData = data.products || [];
        paginationState.products.totalItems = paginationState.products.allData.length;
        paginationState.products.currentPage = 1;

        // Load categories
        await loadProductCategories();

        // Add event listener to category filter
        const categoryFilter = document.getElementById('product-category-filter');
        if (categoryFilter) {
            categoryFilter.removeEventListener('change', filterProductsByCategory);
            categoryFilter.addEventListener('change', filterProductsByCategory);
        }

        // Update pagination display
        updatePaginationDisplay('products');
    } catch (error) {
        console.error('Failed to load products:', error);
        const errorMsg = error.message || 'Unknown error';
        tbody.innerHTML = `<tr><td colspan="6" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load products: ${errorMsg}</td></tr>`;
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

async function loadOrders() {
    try {
        const data = await OrdersAPI.getOrders();

        // Store all data in pagination state
        paginationState.orders.allData = data.orders || [];
        paginationState.orders.originalData = data.orders || [];
        paginationState.orders.totalItems = paginationState.orders.allData.length;
        paginationState.orders.currentPage = 1;

        // Add event listener to status filter
        const statusFilter = document.getElementById('order-status-filter');
        if (statusFilter) {
            statusFilter.removeEventListener('change', filterOrders);
            statusFilter.addEventListener('change', filterOrders);
        }

        // Update pagination display
        updatePaginationDisplay('orders');
    } catch (error) {
        console.error('Failed to load orders:', error);
        const tbody = document.getElementById('orders-tbody');
        if (tbody) {
            tbody.innerHTML = '<tr><td colspan="5" style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load orders</td></tr>';
        }
    }
}

function filterOrders() {
    const statusFilter = document.getElementById('order-status-filter');
    const selectedStatus = statusFilter ? statusFilter.value : '';
    
    // Filter the data based on status from original unfiltered data
    if (!paginationState.orders.originalData) return;
    let filteredOrders = paginationState.orders.originalData;
    if (selectedStatus) {
        filteredOrders = filteredOrders.filter(order => order.status === selectedStatus);
    }

    // Update pagination state with filtered data
    paginationState.orders.allData = filteredOrders;
    paginationState.orders.totalItems = filteredOrders.length;
    paginationState.orders.currentPage = 1;

    // Update pagination display
    updatePaginationDisplay('orders');
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

        // Load categories
        loadCategories();

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
                // Price field removed from UI - use 0
                const priceField = document.getElementById('product-price');
                if (priceField) {
                  priceField.value = product.base_price;
                }
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
                    // Price field removed from UI - use 0
                    const basePrice = 0;
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

                    if (!name || !category) {
                        alert('Please fill in all required fields');
                        return;
                    }

                    try {
                        await ProductsAPI.updateProduct(productId, name, category, basePrice, variants);
                        productModal.classList.remove('open');
                        // Reload products table to show updated price
                        await loadProducts();
                        alert('Product updated successfully');
                    } catch (error) {
                        alert('Error updating product: ' + error.message);
                    }
                };
            })
            .catch(error => alert('Error loading product: ' + error.message));
    });
}

async function editStock(productId, currentStock) {
    try {
        // Fetch product details to get variants
        const data = await ProductsAPI.getAllProducts();
        const product = data.products.find(p => p.id == productId);
        
        if (!product) {
            alert('Product not found');
            return;
        }
        
        const variants = product.variants || [];
        
        if (variants.length === 0) {
            alert('This product has no variants');
            return;
        }
        
        const stockModal = document.getElementById('stock-modal');
        const modalTitle = document.getElementById('stock-modal-title');
        const stockForm = document.getElementById('stock-form');
        
        // Update modal title
        modalTitle.textContent = `Edit Stock - ${product.name}`;
        
        // Build variant stock inputs
        let variantsHTML = variants.map(variant => `
            <div class="form-group" style="margin-bottom: 1rem;">
                <label style="display: block; margin-bottom: 0.5rem; font-weight: 500;">
                    ${variant.title} (Current: ${variant.stock})
                </label>
                <input 
                    type="number" 
                    class="variant-stock-input" 
                    data-variant-id="${variant.id}" 
                    value="${variant.stock}" 
                    min="0" 
                    style="width: 100%; padding: 0.5rem; border: 1px solid #ddd; border-radius: 4px;"
                    required
                />
            </div>
        `).join('');
        
        // Replace form content
        stockForm.innerHTML = `
            ${variantsHTML}
            <div class="form-actions" style="margin-top: 1.5rem;">
                <button type="button" class="secondary" data-action="cancel">Cancel</button>
                <button type="submit" class="primary">Save Stock</button>
            </div>
        `;
        
        // Show modal
        stockModal.classList.add('open');
        
        // Handle form submission
        stockForm.onsubmit = async (e) => {
            e.preventDefault();
            
            const inputs = stockForm.querySelectorAll('.variant-stock-input');
            const updates = [];
            
            // Collect all variant stock updates
            inputs.forEach(input => {
                const variantId = input.dataset.variantId;
                const newStock = parseInt(input.value, 10);
                
                if (isNaN(newStock) || newStock < 0) {
                    alert('Please enter valid stock quantities (0 or greater)');
                    throw new Error('Invalid stock value');
                }
                
                updates.push({ variantId, stock: newStock });
            });
            
            try {
                // Update each variant's stock
                for (const update of updates) {
                    await ProductsAPI.updateVariantStock(update.variantId, update.stock);
                }
                
                stockModal.classList.remove('open');
                // Reload products table to show updated stock
                await loadProducts();
                alert('Stock updated successfully');
            } catch (error) {
                alert('Error updating stock: ' + error.message);
            }
        };
        
        // Handle cancel button
        const cancelBtn = stockForm.querySelector('[data-action="cancel"]');
        if (cancelBtn) {
            cancelBtn.onclick = () => stockModal.classList.remove('open');
        }
        
    } catch (error) {
        console.error('Error in editStock:', error);
        alert('Error loading product details: ' + error.message);
    }
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

async function deleteOrder(orderId, orderNumber) {
    const verified = await verifyPassword();
    if (!verified) return;

    showConfirmDialog(`Are you sure you want to delete order ${orderNumber}? This action cannot be undone.`, async () => {
        try {
            await OrdersAPI.deleteOrder(orderId);
            alert('Order deleted successfully');
            loadOrders();
        } catch (error) {
            alert('Error deleting order: ' + error.message);
        }
    });
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
    const phone = document.getElementById('profile-phone').value.trim();
    const currentPassword = document.getElementById('profile-current-password').value;
    const newPassword = document.getElementById('profile-new-password').value;
    const confirmPassword = document.getElementById('profile-confirm-password').value;

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

    initEmployeeTabs();
    initModals();
    initLogout();
    initProfileHandlers();
}

// Wrapper function for router compatibility
function initializeEmployee() {
    return initEmployeePage();
}

// Make functions globally available
window.initEmployeePage = initEmployeePage;
window.initializeEmployee = initializeEmployee;
window.viewProduct = viewProduct;
window.editProduct = editProduct;
window.editStock = editStock;
window.deleteProduct = deleteProduct;
window.openVariantsEditor = openVariantsEditor;
window.addVariant = addVariant;
window.removeVariant = removeVariant;
window.updateVariant = updateVariant;
window.saveVariants = saveVariants;
window.viewOrder = viewOrder;
window.deleteOrder = deleteOrder;
window.resetProfileForm = resetProfileForm;

// Auto-init removed to prevent double initialization by router
