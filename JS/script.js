/**
 * MyPC Store - Frontend Integration Script
 * Connects to PHP backend API
 */

// Global products array - will be loaded from backend
window.PRODUCTS = [];
window.CURRENT_USER = null;

// Format currency
function formatPHP(n) {
  return (
    '₱' +
    parseFloat(n).toLocaleString('en-PH', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    })
  );
}

// Escape HTML to prevent XSS
function escapeHtml(unsafe) {
  if (typeof unsafe !== 'string') return unsafe;
  return unsafe
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

// Debounce helper to prevent excessive API calls
function debounce(func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

// ========================================
// USER SESSION MANAGEMENT
// ========================================

async function checkUserSession() {
  try {
    const data = await AuthAPI.getCurrentUser();
    if (data.user) {
      window.CURRENT_USER = data.user;
      localStorage.setItem('mypc_user', data.user.email);
      localStorage.setItem('mypc_user_data', JSON.stringify(data.user));
      return data.user;
    }
  } catch (error) {
    // Not logged in
    window.CURRENT_USER = null;
    localStorage.removeItem('mypc_user');
    localStorage.removeItem('mypc_user_data');
  }
  return null;
}

function getUserSession() {
  return localStorage.getItem('mypc_user');
}

function getUserData() {
  try {
    return JSON.parse(localStorage.getItem('mypc_user_data'));
  } catch (e) {
    return null;
  }
}

function clearUserSession() {
  window.CURRENT_USER = null;
  localStorage.removeItem('mypc_user');
  localStorage.removeItem('mypc_user_data');
}

// Unified logout helper
async function doLogout(ask = true) {
  try {
    if (ask) {
      if (!window.confirm('Are you sure you want to logout?')) {
        return false;
      }
    }

    // Clear session immediately for responsive UI
    clearUserSession();
    updateAuthNav();
    syncAuthButton();

    // Call logout API and wait for it (with timeout)
    try {
      await Promise.race([
        AuthAPI.logout(),
        new Promise((_, reject) =>
          setTimeout(() => reject(new Error('Logout timeout')), 2000)
        ),
      ]);
    } catch (error) {
      console.warn('Logout API call failed or timed out:', error);
    }

    // Navigate after API call
    // Force navigation to landing page
    window.location.href = '/index.html';

    return true;
  } catch (error) {
    console.error('Logout failed', error);
    alert('Logout failed. Please try again.');
    return false;
  }
}

// Update auth navigation
function updateAuthNav() {
  const authNav = document.getElementById('auth-nav');
  if (!authNav) return;

  const user = getUserData();
  if (user) {
    let dashboardLink = '';

    if (user.role === 'superadmin') {
      dashboardLink = `<a href="/superadmin" style="text-decoration:none;color:#f59e0b;font-weight:600">Superadmin</a>`;
    } else if (user.role === 'admin') {
      dashboardLink = `<a href="/admin" style="text-decoration:none;color:#ef4444;font-weight:600">Admin</a>`;
    } else if (user.role === 'employee') {
      dashboardLink = `<a href="/employee" style="text-decoration:none;color:#3b82f6;font-weight:600">Dashboard</a>`;
    }

    authNav.innerHTML = `<div style="display:flex;gap:0.5rem;align-items:center;"><a href="/profile" style="text-decoration:none;color:var(--accent);font-weight:600">Profile</a>${dashboardLink}<span class="user-email">${user.email}</span></div>`;
  } else {
    authNav.innerHTML =
      '<a href="/login" style="font-weight:600;margin-right:0.5rem">Login</a><a href="/signup" style="font-weight:600">Create account</a>';
  }

  // Update cart visibility based on user role
  updateCartVisibility();
}

// Control cart visibility - only show for customers and non-logged-in users
function updateCartVisibility() {
  const cartToggle = document.getElementById('cart-toggle');
  const addToCartButtons = document.querySelectorAll(
    "#prod-add, .add-to-cart, [data-action='add']"
  );
  const user = getUserData();

  // Hide cart for employee, admin, and superadmin roles
  const shouldHideCart =
    user &&
    (user.role === 'employee' ||
      user.role === 'admin' ||
      user.role === 'superadmin');

  if (cartToggle) {
    cartToggle.style.display = shouldHideCart ? 'none' : '';
  }

  // Hide "Add to Cart" buttons for non-customer roles
  addToCartButtons.forEach((btn) => {
    if (shouldHideCart) {
      btn.style.display = 'none';
    } else {
      btn.style.display = '';
    }
  });
}

function syncAuthButton() {
  const btn = document.querySelector('.auth-btn');
  if (!btn) return;

  const user = getUserData();
  if (user) {
    btn.innerHTML = `${user.email}`;
    btn.title = 'Account';
    btn.addEventListener('click', () => {
      window.router.navigateTo('/profile');
    });
  } else {
    const parent = btn.parentElement;
    if (parent) {
      parent.innerHTML =
        '<a href="/login" style="font-weight:600;margin-right:0.5rem">Login</a><a href="/signup" style="font-weight:600">Create account</a>';
    }
  }
}

// ========================================
// UTILITY FUNCTIONS
// ========================================

// Ensure image URL is properly wrapped through serve-image.php
function ensureImageUrl(url) {
  if (!url) return '/assets/placeholder.jpg';

  // If already wrapped with serve-image.php, return as-is
  if (url.includes('serve-image.php')) {
    return url;
  }

  // If it's an /assets/ URL that wasn't wrapped, wrap it now
  if (url.startsWith('/assets/')) {
    return '/serve-image.php?path=' + encodeURIComponent(url);
  }

  // Otherwise return as-is (could be a data URI or external URL)
  return url;
}

// ========================================
// PRODUCTS MANAGEMENT
// ========================================

// Pagination & sort state
window.STATE = window.STATE || {
  query: '',
  category: '',
  sort: 'relevance',
  page: 1,
  perPage: 20,
};

// Load products from backend
async function loadProducts(filters = {}) {
  try {
    console.log('[loadProducts] Loading products with filters:', filters);
    const data = await ProductsAPI.getProducts({
      search: filters.search || STATE.query,
      category: filters.category || STATE.category,
      page: filters.page || STATE.page,
      limit: filters.limit || STATE.perPage,
    });

    console.log('[loadProducts] API response:', data);

    if (data.products) {
      // Transform backend data to match frontend format
      window.PRODUCTS = data.products.map((p) => ({
        id: p.slug || p.id,
        title: p.name,
        category: p.category_name || 'Uncategorized',
        price: parseFloat(p.price || 0),
        img: ensureImageUrl(p.image_url),
        variants: p.variants || [],
        stock: p.stock || 0,
        dbId: p.id, // Store database ID for cart operations
      }));

      console.log(
        '[loadProducts] Transformed PRODUCTS array:',
        window.PRODUCTS
      );
      return data;
    }
  } catch (error) {
    console.error('[loadProducts] Failed to load products:', error);
    window.PRODUCTS = [];
  }
  return { products: [], pagination: { page: 1, total: 0, pages: 0 } };
}

// Load categories from backend
async function loadCategories() {
  try {
    const data = await ProductsAPI.getCategories();
    const catSel = document.getElementById('category-filter');
    if (!catSel || !data.categories) return;

    // Keep "All categories" option
    catSel.innerHTML = '<option value="">All categories</option>';

    // Add each category
    data.categories.forEach((cat) => {
      const option = document.createElement('option');
      option.value = cat.slug;
      option.textContent = cat.name;
      catSel.appendChild(option);
    });
  } catch (error) {
    console.error('Failed to load categories:', error);
  }
}

function applySort(list, sort) {
  if (sort === 'price-asc') return list.sort((a, b) => a.price - b.price);
  if (sort === 'price-desc') return list.sort((a, b) => b.price - a.price);
  if (sort === 'alpha')
    return list.sort((a, b) => a.title.localeCompare(b.title));

  // Intelligent Relevance Sort
  if (sort === 'relevance' && STATE.query) {
    const q = STATE.query.toLowerCase().trim();
    if (!q) return list;

    return list.sort((a, b) => {
      const titleA = a.title.toLowerCase();
      const titleB = b.title.toLowerCase();
      const catA = a.category.toLowerCase();
      const catB = b.category.toLowerCase();

      // 1. Exact Title Match (Highest Priority)
      if (titleA === q && titleB !== q) return -1;
      if (titleB === q && titleA !== q) return 1;

      // 2. Title Starts With Query
      const startA = titleA.startsWith(q);
      const startB = titleB.startsWith(q);
      if (startA && !startB) return -1;
      if (!startA && startB) return 1;

      // 3. Category Match
      const catMatchA = catA.includes(q);
      const catMatchB = catB.includes(q);
      if (catMatchA && !catMatchB) return -1;
      if (!catMatchA && catMatchB) return 1;

      // 4. Title Contains Query (Earlier position is better)
      const idxA = titleA.indexOf(q);
      const idxB = titleB.indexOf(q);
      if (idxA !== -1 && idxB !== -1) {
        return idxA - idxB;
      }
      if (idxA !== -1) return -1;
      if (idxB !== -1) return 1;

      return 0;
    });
  }

  return list;
}

async function renderProducts() {
  const grid = document.getElementById('product-grid');
  if (!grid) {
    console.error('[renderProducts] product-grid element not found');
    return;
  }

  // Show loading state
  grid.style.opacity = '0.5';
  grid.style.pointerEvents = 'none';

  // Load products from backend
  console.log('[renderProducts] Calling loadProducts');
  const data = await loadProducts();
  console.log('[renderProducts] loadProducts returned:', data);

  // Remove loading state
  grid.style.opacity = '1';
  grid.style.pointerEvents = 'auto';

  let list = window.PRODUCTS.slice();
  console.log('[renderProducts] PRODUCTS array before sort:', list);

  // Apply client-side sorting
  list = applySort(list, STATE.sort);
  console.log('[renderProducts] PRODUCTS array after sort:', list);

  grid.innerHTML = '';

  if (list.length === 0) {
    grid.innerHTML =
      '<p style="grid-column: 1/-1; text-align:center; padding:2rem;">No products found.</p>';
    return;
  }

  const fragment = document.createDocumentFragment();

  list.forEach((p) => {
    const el = document.createElement('article');
    el.className = 'product';

    // Build variant options
    const variantOptions = (p.variants || [])
      .map((v, idx) => {
        return `<option value="${idx}">${escapeHtml(
          v.title || 'Option ' + (idx + 1)
        )} - ${formatPHP(v.price)}</option>`;
      })
      .join('');

    el.innerHTML = `
      <img src="${escapeHtml(p.img)}" alt="${escapeHtml(
      p.title
    )}" loading="lazy">
      <h3>${escapeHtml(p.title)}</h3>
      <div class="meta">${escapeHtml(p.category)}</div>
      <div class="price" data-base="${p.price}">${formatPHP(p.price)}</div>
      <div class="actions">
        <select class="variant-select" data-id="${p.id}">${
      variantOptions || '<option value="0">Standard</option>'
    }</select>
        <input type="number" class="qty-input" data-id="${
          p.id
        }" value="1" min="1" max="${p.stock || 99}">
      </div>
      <div class="actions">
        <button class="btn" data-id="${p.id}" data-action="view">View</button>
        <button class="btn add" data-id="${p.id}" data-action="add" ${
      p.stock <= 0 ? 'disabled' : ''
    }>
          ${p.stock <= 0 ? 'Out of Stock' : 'Add to cart'}
        </button>
      </div>
    `;
    console.log(
      '[renderProducts] Rendering product:',
      p.id,
      p.title,
      'with data-id on buttons'
    );
    fragment.appendChild(el);
  });

  grid.appendChild(fragment);

  renderPagination(data.pagination?.page || 1, data.pagination?.pages || 1);
  console.log('[renderProducts] Rendering complete');

  // Update cart visibility based on user role
  updateCartVisibility();
}

function renderPagination(page, total) {
  const el = document.getElementById('pagination');
  if (!el) return;
  el.innerHTML = '';

  for (let i = 1; i <= total; i++) {
    const b = document.createElement('button');
    b.className = 'page-btn' + (i === page ? ' active' : '');
    b.textContent = i;
    b.addEventListener('click', () => {
      STATE.page = i;
      renderProducts();
    });
    el.appendChild(b);
  }
}

// ========================================
// CART MANAGEMENT
// ========================================

if (typeof window.CART_DATA === 'undefined') {
  window.CART_DATA = { items: [], subtotal: 0 };
}
// Removed local let CART_DATA to avoid TDZ issues and shadowing

async function loadCartFromBackend() {
  try {
    const user = getUserData();
    if (!user) {
      console.warn('[loadCartFromBackend] No user logged in');
      window.CART_DATA = { items: [], subtotal: 0 };
      updateCartCount();
      return;
    }

    console.log('[loadCartFromBackend] Fetching cart from API...');
    const data = await CartAPI.getCart();
    console.log('[loadCartFromBackend] API response:', data);

    if (data && data.cart) {
      // Preserve selected state from previous items if they still exist
      const selectedMap = {};
      if (window.CART_DATA && window.CART_DATA.items) {
        window.CART_DATA.items.forEach(item => {
          if (item.selected === true) {
            selectedMap[item.cart_item_id] = true;
          }
        });
      }
      
      // Set new cart data
      window.CART_DATA = data.cart;
      
      // Restore selected state for items that still exist
      window.CART_DATA.items.forEach(item => {
        if (selectedMap[item.cart_item_id]) {
          item.selected = true;
        }
      });
      
      console.log('[loadCartFromBackend] Cart data set:', window.CART_DATA);
      updateCartCount();
      renderCartItems(); // Update cart drawer UI and checkout button state
    } else {
      console.warn('[loadCartFromBackend] No cart data in response');
      window.CART_DATA = { items: [], subtotal: 0 };
      renderCartItems(); // Update cart drawer UI and checkout button state
    }
  } catch (error) {
    console.error('Failed to load cart:', error);
    window.CART_DATA = { items: [], subtotal: 0 };
    renderCartItems(); // Update cart drawer UI and checkout button state
  }
}

function updateCartCount() {
  const countEl = document.getElementById('cart-count');
  if (!countEl) return;

  const qty =
    window.CART_DATA.items?.reduce(
      (s, i) => s + parseInt(i.quantity || 0),
      0
    ) || 0;
  countEl.textContent = qty;
}

async function addToCart(productSlug, qty = 1) {
  try {
    const user = getUserData();

    if (!user) {
      alert('Please login to add items to cart');
      window.router?.navigateTo('/login');
      return;
    }

    // Find product by slug
    const product = window.PRODUCTS.find((p) => p.id === productSlug);

    if (!product) {
      alert('Product not found');
      return;
    }

    // Get variant if selected
    const variantSelect = document.querySelector(
      `.variant-select[data-id="${productSlug}"]`
    );
    const variantIdx = variantSelect
      ? parseInt(variantSelect.value || 0, 10)
      : 0;

    // Get variant ID - if product has variants, use the selected one, otherwise use first available
    let variantId = null;
    if (product.variants && product.variants.length > 0) {
      const selectedVariant = product.variants[variantIdx];
      variantId = selectedVariant ? selectedVariant.id : product.variants[0].id;
    }

    // Get quantity from input
    const qtyInput = document.querySelector(
      `.qty-input[data-id="${productSlug}"]`
    );
    const quantity = qtyInput ? parseInt(qtyInput.value, 10) : qty;

    // Validate quantity
    if (quantity < 1) {
      alert('Quantity must be at least 1');
      return;
    }

    await CartAPI.addToCart(product.dbId, quantity, variantId);
    await loadCartFromBackend();

    // Visual feedback
    const button = document.querySelector(`.btn.add[data-id="${productSlug}"]`);
    if (button) {
      const originalText = button.textContent;
      button.textContent = '✓ Added!';
      button.style.background = '#10b981';
      setTimeout(() => {
        button.textContent = originalText;
        button.style.background = '';
      }, 1500);
    }
  } catch (error) {
    alert(error.message || 'Failed to add to cart. Please try again.');
  }
}

async function renderCartItems() {
  const itemsEl = document.getElementById('cart-items');
  const totalEl = document.getElementById('cart-total');
  if (!itemsEl) return;

  itemsEl.innerHTML = '';

  // Calculate total quantity (including items with 0 quantity)
  const totalQty =
    window.CART_DATA.items?.reduce(
      (s, i) => s + parseInt(i.quantity || 0),
      0
    ) || 0;

  if (
    !window.CART_DATA.items ||
    window.CART_DATA.items.length === 0 ||
    totalQty === 0
  ) {
    itemsEl.innerHTML =
      '<p style="text-align:center;padding:2rem;color:#666;">Your cart is empty</p>';
    if (totalEl) totalEl.textContent = formatPHP(0);

    // Disable checkout button when cart is empty
    const checkoutBtn = document.getElementById('checkout-btn');
    console.log('[renderCartItems] Empty cart - checkout button:', checkoutBtn);
    if (checkoutBtn) {
      console.log('[renderCartItems] Disabling checkout button');
      checkoutBtn.style.opacity = '0.5';
      checkoutBtn.style.cursor = 'not-allowed';
      checkoutBtn.style.pointerEvents = 'none';
      checkoutBtn.title = 'Add items to cart to proceed';
      checkoutBtn.setAttribute('aria-disabled', 'true');
    } else {
      console.warn('[renderCartItems] Checkout button not found!');
    }
    return;
  }

  // Enable checkout button when cart has items
  const checkoutBtn = document.getElementById('checkout-btn');
  console.log('[renderCartItems] Cart has items - checkout button:', checkoutBtn);
  if (checkoutBtn) {
    console.log('[renderCartItems] Enabling checkout button');
    checkoutBtn.style.opacity = '1';
    checkoutBtn.style.cursor = 'pointer';
    checkoutBtn.style.pointerEvents = 'auto';
    checkoutBtn.title = '';
    checkoutBtn.removeAttribute('aria-disabled');
  }

  window.CART_DATA.items.forEach((item) => {
    const row = document.createElement('div');
    row.className = 'cart-item';

    const variantText = item.variant_title
      ? ` (${escapeHtml(item.variant_title)})`
      : '';
    const lineTotal = formatPHP(parseFloat(item.line_total || 0));

    row.innerHTML = `
      <input type="checkbox" class="cart-item-checkbox" data-cart-item-id="${item.cart_item_id}" ${item.selected === true ? 'checked' : ''} style="margin-right: 0.5rem; cursor: pointer; width: 18px; height: 18px;">
      <img src="${escapeHtml(
        ensureImageUrl(item.image_url)
      )}" alt="${escapeHtml(
      item.name
    )}" onerror="this.src='/serve-image.php?path=%2Fassets%2Fplaceholder.jpg'">
      <div class="cart-details">
        <div class="cart-title">${escapeHtml(item.name)}${variantText}</div>
        <div class="cart-meta">${formatPHP(item.unit_price)} × ${
      item.quantity
    } = ${lineTotal}</div>
      </div>
      <div class="cart-actions">
        <div class="qty-row">
          <button class="qty-btn" data-cart-item-id="${
            item.cart_item_id
          }" data-action="dec" title="Decrease quantity">−</button>
          <input class="qty-input" value="${item.quantity}" readonly>
          <button class="qty-btn" data-cart-item-id="${
            item.cart_item_id
          }" data-action="inc" title="Increase quantity">+</button>
        </div>
        <div class="remove-row">
          <button class="btn btn-danger" data-cart-item-id="${
            item.cart_item_id
          }" data-action="rem">Remove</button>
        </div>
      </div>
    `;
    itemsEl.appendChild(row);
    
    // Add event listener to track checkbox changes
    const checkbox = row.querySelector('.cart-item-checkbox');
    if (checkbox) {
      checkbox.addEventListener('change', (e) => {
        // Update the item's selected status in CART_DATA
        const cartItem = window.CART_DATA.items.find(i => i.cart_item_id == e.target.dataset.cartItemId);
        if (cartItem) {
          cartItem.selected = e.target.checked;
        }
        // Recalculate total when checkbox changes
        updateCartTotal();
      });
    }
  });

  // Calculate and display total for only selected items
  updateCartTotal();
}

function updateCartTotal() {
  const totalEl = document.getElementById('cart-total');
  if (!totalEl) return;
  
  // Only sum up selected items
  let selectedTotal = 0;
  const hasSelectedItems = window.CART_DATA.items?.some(item => item.selected === true) || false;
  
  window.CART_DATA.items?.forEach(item => {
    if (item.selected === true) {
      selectedTotal += parseFloat(item.line_total || 0);
    }
  });
  
  totalEl.textContent = formatPHP(selectedTotal || 0);
  
  // Disable/enable checkout button based on selected items
  const checkoutBtn = document.getElementById('checkout-btn');
  if (checkoutBtn) {
    if (hasSelectedItems) {
      checkoutBtn.disabled = false;
      checkoutBtn.style.opacity = '1';
      checkoutBtn.style.cursor = 'pointer';
      checkoutBtn.title = '';
    } else {
      checkoutBtn.disabled = true;
      checkoutBtn.style.opacity = '0.5';
      checkoutBtn.style.cursor = 'not-allowed';
      checkoutBtn.title = 'Select at least one item to proceed';
    }
  }
}

async function changeCartQty(cartItemId, delta) {
  try {
    const item = window.CART_DATA.items.find(
      (i) => i.cart_item_id == cartItemId
    );
    if (!item) return;

    const newQty = parseInt(item.quantity) + delta;

    // Prevent quantity from going below 1
    if (newQty < 1) {
      // Ask user if they want to remove the item
      if (confirm('Remove this item from cart?')) {
        await CartAPI.removeFromCart(cartItemId);
        await loadCartFromBackend();
        await renderCartItems();
      }
      return;
    }

    await CartAPI.updateCartItem(cartItemId, newQty);
    await loadCartFromBackend();
    await renderCartItems();
  } catch (error) {
    console.error('Update cart failed:', error);
    alert(error.message || 'Failed to update cart');
  }
}

async function removeFromCart(cartItemId) {
  try {
    if (!confirm('Remove this item from cart?')) {
      return;
    }

    await CartAPI.removeFromCart(cartItemId);
    await loadCartFromBackend();
    await renderCartItems();
  } catch (error) {
    console.error('Remove from cart failed:', error);
    alert(error.message || 'Failed to remove item');
  }
}

function openCart() {
  console.log('[openCart] Opening cart drawer');
  const drawer = document.getElementById('cart-drawer');
  const backdrop = document.getElementById('cart-backdrop');
  console.log('[openCart] Drawer:', drawer, 'Backdrop:', backdrop);

  if (!drawer) {
    console.error('[openCart] cart-drawer element not found');
    return;
  }

  drawer.classList.add('open');
  drawer.setAttribute('aria-hidden', 'false');
  if (backdrop) {
    backdrop.style.opacity = '1';
    backdrop.style.pointerEvents = 'auto';
  }
  console.log('[openCart] Cart drawer opened');
  renderCartItems();
}

function closeCart() {
  const drawer = document.getElementById('cart-drawer');
  const backdrop = document.getElementById('cart-backdrop');
  if (drawer) {
    drawer.classList.remove('open');
    drawer.setAttribute('aria-hidden', 'true');
  }
  if (backdrop) {
    backdrop.style.opacity = '0';
    backdrop.style.pointerEvents = 'none';
  }
}

// ========================================
// EVENT DELEGATION
// ========================================

if (!window.scriptClickListenersAttached) {
  window.scriptClickListenersAttached = true;

  document.addEventListener('click', (e) => {
    const t = e.target.closest('[data-action]');
    if (!t) return;

    const action = t.getAttribute('data-action');
    const id = t.getAttribute('data-id');
    const cartItemId = t.getAttribute('data-cart-item-id');

    console.log(
      '[Click Handler] Action:',
      action,
      'ID:',
      id,
      'CartItemID:',
      cartItemId
    );

    if (action === 'add') addToCart(id, 1);
    if (action === 'add-from-modal') {
      // Get quantity from modal input
      const qtyInput = document.getElementById(`modal-qty-${id}`);
      const qty = qtyInput ? parseInt(qtyInput.value, 10) || 1 : 1;
      console.log('[Add from Modal] Product ID:', id, 'Quantity:', qty);
      addToCart(id, qty);
      closeProductDetail();
    }
    if (action === 'inc' && cartItemId) changeCartQty(cartItemId, 1);
    if (action === 'dec' && cartItemId) changeCartQty(cartItemId, -1);
    if (action === 'rem' && cartItemId) removeFromCart(cartItemId);
    if (action === 'view') {
      console.log('[View Button Clicked] Product ID:', id);
      openProductDetail(id);
    }
  });
}

// Variant price change and quantity price update
if (!window.scriptChangeListenersAttached) {
  window.scriptChangeListenersAttached = true;

  document.addEventListener('change', (e) => {
    const sel = e.target;

    // Handle variant selection change
    if (sel.matches('.variant-select')) {
      const id = sel.getAttribute('data-id');
      const prod = PRODUCTS.find((p) => p.id === id);
      if (!prod) return;

      const variant = prod.variants && prod.variants[parseInt(sel.value, 10)];
      if (!variant) return;

      const variantPrice = parseFloat(variant.price || 0);

      // Update price in product card
      const priceEl = sel.closest('.product')?.querySelector('.price');
      if (priceEl) {
        priceEl.setAttribute('data-base', variantPrice);
        const qtyInput = sel.closest('.product')?.querySelector('.qty-input');
        const qty = qtyInput ? parseInt(qtyInput.value) || 1 : 1;
        priceEl.textContent = formatPHP(variantPrice * qty);
      }

      // Update price in product detail modal
      const modalPriceEl = document.querySelector('.product-detail-price');
      if (modalPriceEl) {
        modalPriceEl.setAttribute('data-base', variantPrice);
        const modalQtyInput = document.querySelector('#modal-qty-' + id);
        const qty = modalQtyInput ? parseInt(modalQtyInput.value) || 1 : 1;
        modalPriceEl.textContent = formatPHP(variantPrice * qty);
      }
    }
  });

  // Handle quantity input change
  document.addEventListener('input', (e) => {
    if (
      e.target.matches('.qty-input') ||
      e.target.matches('input[type="number"][id*="qty"]')
    ) {
      const input = e.target;
      const qty = Math.max(1, parseInt(input.value) || 1);

      // Update price in product card
      const priceEl = input.closest('.product')?.querySelector('.price');
      if (priceEl) {
        const basePrice = parseFloat(priceEl.getAttribute('data-base')) || 0;
        priceEl.textContent = formatPHP(basePrice * qty);
      }

      // Update price in product detail modal
      const modalPriceEl = document.querySelector('.product-detail-price');
      if (modalPriceEl && input.id && input.id.includes('modal-qty')) {
        const basePrice =
          parseFloat(modalPriceEl.getAttribute('data-base')) || 0;
        modalPriceEl.textContent = formatPHP(basePrice * qty);
      }

      // Update price on single product page
      if (input.id === 'prod-qty') {
        const prodPriceEl = document.getElementById('prod-price');
        if (prodPriceEl) {
          const basePrice =
            parseFloat(prodPriceEl.getAttribute('data-base')) || 0;
          prodPriceEl.textContent = formatPHP(basePrice * qty);
        }
      }
    }
  });
}

// ========================================
// PRODUCT DETAIL MODAL
// ========================================

function openProductDetail(productId) {
  console.log('[openProductDetail] Looking for product ID:', productId);
  console.log('[openProductDetail] PRODUCTS array:', window.PRODUCTS);

  const product = window.PRODUCTS.find((p) => p.id === productId);
  console.log('[openProductDetail] Found product:', product);

  if (!product) {
    console.error('[openProductDetail] Product not found with ID:', productId);
    return;
  }

  const modal = document.getElementById('product-modal');
  const backdrop = document.getElementById('product-modal-backdrop');
  const content = document.getElementById('product-modal-content');

  console.log(
    '[openProductDetail] Modal elements - modal:',
    modal,
    'backdrop:',
    backdrop,
    'content:',
    content
  );

  if (!modal || !backdrop || !content) {
    console.error('[openProductDetail] Missing modal elements');
    return;
  }

  const variantOptions = (product.variants || [])
    .map((v, idx) => {
      return `<option value="${idx}">${
        v.title || 'Option ' + (idx + 1)
      } - ${formatPHP(v.price)}</option>`;
    })
    .join('');

  content.innerHTML = `
    <div class="product-detail-grid">
      <div class="product-detail-image">
        <img src="${ensureImageUrl(product.img)}" alt="${product.title}">
      </div>
      <div class="product-detail-info">
        <h3>${product.title}</h3>
        <span class="product-detail-category">${product.category}</span>
        <div class="product-detail-price" data-base="${
          product.price
        }">${formatPHP(product.price)}</div>
        <div class="product-detail-description">
          Premium ${
            product.category
          } component. Built with cutting-edge technology to deliver exceptional performance and reliability.
        </div>
        <div class="product-actions">
          <div class="product-actions-row">
            <select class="variant-select" data-id="${
              product.id
            }" id="modal-variant-${product.id}">${
    variantOptions || '<option value="0">Standard</option>'
  }</select>
            <input type="number" class="qty-input" data-id="${
              product.id
            }" id="modal-qty-${product.id}" value="1" min="1" max="${
    product.stock || 99
  }">
          </div>
          <button class="btn add" data-id="${
            product.id
          }" data-action="add-from-modal" ${
    product.stock <= 0 ? 'disabled' : ''
  }>
            ${product.stock <= 0 ? 'Out of Stock' : 'Add to Cart'}
          </button>
        </div>
      </div>
    </div>
  `;

  console.log("[openProductDetail] Adding 'open' class to modal and backdrop");
  modal.classList.add('open');
  backdrop.classList.add('open');
  console.log('[openProductDetail] Modal opened successfully');

  // Update cart visibility for modal buttons
  updateCartVisibility();
}

function closeProductDetail() {
  const modal = document.getElementById('product-modal');
  const backdrop = document.getElementById('product-modal-backdrop');
  if (modal) modal.classList.remove('open');
  if (backdrop) backdrop.classList.remove('open');
}

async function loadSingleProduct() {
  const id = window.CURRENT_PRODUCT_ID;
  if (!id) return;

  console.log('[loadSingleProduct] Loading product:', id);

  try {
    const response = await fetch(
      `/InfoSec-MyPC/HTML_PHP/products.php?id=${id}`
    );
    if (!response.ok) throw new Error('Failed to load product');
    const product = await response.json();

    if (!product) throw new Error('Product not found');

    // Populate DOM

    const img = document.getElementById('prod-img');
    if (img) {
      img.src =
        product.image_url ||
        product.img ||
        '/InfoSec-MyPC/assets/placeholder.png';
      img.alt = product.title;
    }

    const setText = (id, text) => {
      const el = document.getElementById(id);
      if (el) el.textContent = text || '';
    };

    setText('prod-title', product.title);
    setText('prod-category', product.category_name);
    setText('prod-desc', product.description);

    // Price and Variants
    const priceEl = document.getElementById('prod-price');
    let currentPrice = parseFloat(product.price);
    if (priceEl) {
      priceEl.setAttribute('data-base', currentPrice);
      priceEl.textContent = formatPHP(currentPrice);
    }

    // Handle variants if they exist
    if (product.variants && product.variants.length > 0) {
      const qtyContainer = document.querySelector('.purchase-controls');
      if (qtyContainer) {
        let variantContainer = document.getElementById(
          'prod-variants-container'
        );
        if (!variantContainer) {
          variantContainer = document.createElement('div');
          variantContainer.id = 'prod-variants-container';
          variantContainer.style.marginBottom = '1rem';
          qtyContainer.parentNode.insertBefore(variantContainer, qtyContainer);
        }

        const options = product.variants
          .map((v, idx) => {
            return `<option value="${idx}" data-price="${v.price}" data-id="${
              v.id
            }">${v.title} - ${formatPHP(v.price)}</option>`;
          })
          .join('');

        variantContainer.innerHTML = `
                    <label for="prod-variant-select" style="display:block;margin-bottom:0.5rem;font-weight:500;">Option</label>
                    <select id="prod-variant-select" class="variant-select" style="width:100%;padding:0.5rem;border:1px solid var(--border);border-radius:4px;">
                        ${options}
                    </select>
                 `;

        // Add change listener
        const select = document.getElementById('prod-variant-select');
        select.addEventListener('change', (e) => {
          const idx = e.target.value;
          const variant = product.variants[idx];
          if (variant) {
            const variantPrice = parseFloat(variant.price);
            if (priceEl) {
              priceEl.setAttribute('data-base', variantPrice);
              const qtyInput = document.getElementById('prod-qty');
              const qty = qtyInput ? parseInt(qtyInput.value) || 1 : 1;
              priceEl.textContent = formatPHP(variantPrice * qty);
            }
            const qtyInput = document.getElementById('prod-qty');
            if (qtyInput) qtyInput.max = variant.stock;
          }
        });

        // Trigger initial change
        select.dispatchEvent(new Event('change'));
      }
    } else {
      const qtyInput = document.getElementById('prod-qty');
      if (qtyInput) qtyInput.max = product.stock;
    }

    // Add to cart button
    const addBtn = document.getElementById('prod-add');
    if (addBtn) {
      // Remove old listeners
      const newBtn = addBtn.cloneNode(true);
      addBtn.parentNode.replaceChild(newBtn, addBtn);

      newBtn.onclick = async () => {
        const qtyInput = document.getElementById('prod-qty');
        const qty = qtyInput ? parseInt(qtyInput.value) : 1;

        let variantId = null;
        const variantSelect = document.getElementById('prod-variant-select');
        if (variantSelect) {
          const idx = variantSelect.value;
          if (product.variants && product.variants[idx]) {
            variantId = product.variants[idx].id;
          }
        }

        try {
          await CartAPI.addToCart(product.id, qty, variantId);
          await loadCartFromBackend();

          const originalText = newBtn.textContent;
          newBtn.textContent = '✓ Added!';
          newBtn.style.background = '#10b981';
          setTimeout(() => {
            newBtn.textContent = originalText;
            newBtn.style.background = '';
          }, 1500);
        } catch (e) {
          alert(e.message || 'Failed to add to cart');
        }
      };
    }
  } catch (e) {
    console.error('Error loading product:', e);
    const container = document.querySelector('.product-detail');
    if (container)
      container.innerHTML = `<p class="error">Failed to load product details. ${e.message}</p>`;
  }

  // Update cart visibility for this page
  updateCartVisibility();
}

// ========================================
// PAGE INITIALIZATION
// ========================================

async function initializePageScript() {
  console.log('[initializePageScript] Starting page initialization');

  // Check user session
  await checkUserSession();
  updateAuthNav();
  syncAuthButton();

  // Update cart visibility immediately
  updateCartVisibility();

  // Check if this is admin/employee/superadmin page
  if (document.getElementById('superadmin-welcome')) {
    console.log('[initializePageScript] Detected superadmin page');
    initializeSuperAdmin?.();
    return;
  }
  if (document.getElementById('admin-welcome')) {
    console.log('[initializePageScript] Detected admin page');
    initializeAdmin?.();
    return;
  }
  if (document.getElementById('employee-welcome')) {
    console.log('[initializePageScript] Detected employee page');
    initializeEmployee?.();
    return;
  }

  // Load products if on shop page
  if (document.getElementById('product-grid')) {
    console.log('[initializePageScript] Detected shop page, loading products');
    await loadCategories(); // Load categories for filter dropdown
    await renderProducts();
    console.log(
      '[initializePageScript] Products loaded, window.PRODUCTS:',
      window.PRODUCTS
    );
  }

  // Load single product if on product page
  if (window.CURRENT_PRODUCT_ID) {
    await loadSingleProduct();
  }

  // Setup cart
  console.log('[initializePageScript] Setting up cart');
  await loadCartFromBackend();
  updateCartCount();

  // Setup event listeners
  console.log('[initializePageScript] Setting up event listeners');
  const cartToggle = document.getElementById('cart-toggle');
  if (cartToggle) {
    console.log(
      '[initializePageScript] Found cart-toggle, attaching click listener'
    );
    cartToggle.addEventListener('click', openCart);
  } else {
    console.warn('[initializePageScript] cart-toggle not found');
  }

  const closeBtn = document.querySelectorAll('#close-cart');
  if (closeBtn) closeBtn.forEach((b) => b.addEventListener('click', closeCart));

  const backdrop = document.getElementById('cart-backdrop');
  if (backdrop) backdrop.addEventListener('click', closeCart);

  const checkout = document.getElementById('checkout-btn');
  if (checkout)
    checkout.addEventListener('click', () => {
      const totalQty =
        window.CART_DATA.items?.reduce(
          (s, i) => s + parseInt(i.quantity || 0),
          0
        ) || 0;
      if (
        !window.CART_DATA.items ||
        window.CART_DATA.items.length === 0 ||
        totalQty === 0
      ) {
        alert('Please add items to your cart before checkout');
        return;
      }
      closeCart();
      window.router.navigateTo('/checkout');
    });

  // Product modal
  console.log('[initializePageScript] Setting up product modal listeners');
  const productModalClose = document.getElementById('product-modal-close');
  if (productModalClose) {
    console.log('[initializePageScript] Found product-modal-close button');
    productModalClose.addEventListener('click', closeProductDetail);
  } else {
    console.warn('[initializePageScript] product-modal-close button not found');
  }

  const productModalBackdrop = document.getElementById(
    'product-modal-backdrop'
  );
  if (productModalBackdrop) {
    console.log('[initializePageScript] Found product-modal-backdrop');
    productModalBackdrop.addEventListener('click', closeProductDetail);
  } else {
    console.warn('[initializePageScript] product-modal-backdrop not found');
  }

  console.log('[initializePageScript] Page initialization complete');

  // Add global quantity input validation and price update
  if (!window.qtyValidationAttached) {
    window.qtyValidationAttached = true;

    document.addEventListener('input', (e) => {
      if (e.target.matches('.qty-input, input[type="number"][id*="qty"]')) {
        let value = parseInt(e.target.value);
        // Ensure value is at least 1
        if (isNaN(value) || value < 1) {
          e.target.value = 1;
        }
      }
    });

    // Prevent negative values on blur
    document.addEventListener(
      'blur',
      (e) => {
        if (e.target.matches('.qty-input, input[type="number"][id*="qty"]')) {
          let value = parseInt(e.target.value);
          if (isNaN(value) || value < 1) {
            e.target.value = 1;
          }
        }
      },
      true
    );
  }

  // Category filter
  const catSel = document.getElementById('category-filter');
  if (catSel) {
    catSel.addEventListener('change', (e) => {
      STATE.category = e.target.value;
      STATE.page = 1;
      renderProducts();
    });
  }

  // Sort
  const sortSel = document.getElementById('sort-select');
  if (sortSel) {
    sortSel.addEventListener('change', (e) => {
      STATE.sort = e.target.value;
      STATE.page = 1;
      renderProducts();
    });
  }

  // Search
  const search = document.getElementById('search-input');
  if (search) {
    const debouncedSearch = debounce(async (query) => {
      console.log('[Search] Triggered with query:', query);
      STATE.query = query;
      STATE.page = 1;

      // Auto-switch to relevance sort when searching to show best matches
      if (query.length > 0) {
        STATE.sort = 'relevance';
        const sortSel = document.getElementById('sort-select');
        if (sortSel) sortSel.value = 'relevance';
      }

      await renderProducts();
    }, 300);

    search.addEventListener('input', (e) => {
      debouncedSearch(e.target.value);
    });
  }
}

// Make functions globally available
window.initializePageScript = initializePageScript;
window.updateAuthNav = updateAuthNav;
window.updateCartVisibility = updateCartVisibility;
window.doLogout = doLogout;
window.formatPHP = formatPHP;
