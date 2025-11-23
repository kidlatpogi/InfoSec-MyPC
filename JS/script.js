/**
 * MyPC Store - Frontend Integration Script
 * Connects to PHP backend API
 */

// Global products array - will be loaded from backend
window.PRODUCTS = [];
window.CURRENT_USER = null;

// Format currency
function formatPHP(n) {
    return "₱" + parseFloat(n).toLocaleString("en-PH", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

// ========================================
// USER SESSION MANAGEMENT
// ========================================

async function checkUserSession() {
    try {
        const data = await AuthAPI.getCurrentUser();
        if (data.user) {
            window.CURRENT_USER = data.user;
            localStorage.setItem("mypc_user", data.user.email);
            localStorage.setItem("mypc_user_data", JSON.stringify(data.user));
            return data.user;
        }
    } catch (error) {
        // Not logged in
        window.CURRENT_USER = null;
        localStorage.removeItem("mypc_user");
        localStorage.removeItem("mypc_user_data");
    }
    return null;
}

function getUserSession() {
    return localStorage.getItem("mypc_user");
}

function getUserData() {
    try {
        return JSON.parse(localStorage.getItem("mypc_user_data"));
    } catch (e) {
        return null;
    }
}

function clearUserSession() {
    window.CURRENT_USER = null;
    localStorage.removeItem("mypc_user");
    localStorage.removeItem("mypc_user_data");
}

// Unified logout helper
async function doLogout(ask = true) {
    try {
        if (ask) {
            if (!window.confirm("Are you sure you want to logout?")) return false;
        }

        await AuthAPI.logout();
        clearUserSession();
        updateAuthNav();
        syncAuthButton();

        if (window.router) window.router.navigateTo("/");
        return true;
    } catch (error) {
        console.error("Logout failed", error);
        alert("Logout failed. Please try again.");
        return false;
    }
}

// Update auth navigation
function updateAuthNav() {
    const authNav = document.getElementById("auth-nav");
    if (!authNav) return;

    const user = getUserData();
    if (user) {
        let dashboardLink = "";

        if (user.role === 'superadmin') {
            dashboardLink = `<a href="/superadmin" style="text-decoration:none;color:#f59e0b;font-weight:600">Superadmin</a>`;
        } else if (user.role === 'admin') {
            dashboardLink = `<a href="/admin" style="text-decoration:none;color:#ef4444;font-weight:600">Admin</a>`;
        } else if (user.role === 'employee') {
            dashboardLink = `<a href="/employee" style="text-decoration:none;color:#3b82f6;font-weight:600">Dashboard</a>`;
        }

        authNav.innerHTML = `<div style="display:flex;gap:0.5rem;align-items:center;"><a href="/profile" style="text-decoration:none;color:var(--accent);font-weight:600">Profile</a>${dashboardLink}<span class="user-email">${user.email}</span></div>`;
    } else {
        authNav.innerHTML = '<a href="/login" style="font-weight:600;margin-right:0.5rem">Login</a><a href="/signup" style="font-weight:600">Create account</a>';
    }
}

function syncAuthButton() {
    const btn = document.querySelector(".auth-btn");
    if (!btn) return;

    const user = getUserData();
    if (user) {
        btn.innerHTML = `${user.email}`;
        btn.title = "Account";
        btn.addEventListener("click", () => {
            window.router.navigateTo("/profile");
        });
    } else {
        const parent = btn.parentElement;
        if (parent) {
            parent.innerHTML = '<a href="/login" style="font-weight:600;margin-right:0.5rem">Login</a><a href="/signup" style="font-weight:600">Create account</a>';
        }
    }
}

// ========================================
// PRODUCTS MANAGEMENT
// ========================================

// Pagination & sort state
window.STATE = window.STATE || {
    query: "",
    category: "",
    sort: "relevance",
    page: 1,
    perPage: 20,
};

// Load products from backend
async function loadProducts(filters = {}) {
    try {
        const data = await ProductsAPI.getProducts({
            search: filters.search || STATE.query,
            category: filters.category || STATE.category,
            page: filters.page || STATE.page,
            limit: filters.limit || STATE.perPage
        });

        if (data.products) {
            // Transform backend data to match frontend format
            window.PRODUCTS = data.products.map(p => ({
                id: p.slug || p.id,
                title: p.name,
                category: p.category_name || 'Uncategorized',
                price: parseFloat(p.base_price),
                img: p.image_url || 'data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 300 200%22%3E%3Crect fill=%22%23f0f0f0%22 width=%22300%22 height=%22200%22/%3E%3Ctext x=%2250%25%22 y=%2250%25%22 font-size=%2224%22 fill=%22%23666%22 text-anchor=%22middle%22 dominant-baseline=%22middle%22%3EProduct%3C/text%3E%3C/svg%3E',
                variants: p.variants || [],
                stock: p.stock_quantity || 0,
                dbId: p.id // Store database ID for cart operations
            }));

            return data;
        }
    } catch (error) {
        console.error("Failed to load products:", error);
        window.PRODUCTS = [];
    }
    return { products: [], pagination: { page: 1, total: 0, pages: 0 } };
}

function applySort(list, sort) {
    if (sort === "price-asc") return list.sort((a, b) => a.price - b.price);
    if (sort === "price-desc") return list.sort((a, b) => b.price - a.price);
    if (sort === "alpha") return list.sort((a, b) => a.title.localeCompare(b.title));
    return list; // relevance
}

async function renderProducts() {
    const grid = document.getElementById("product-grid");
    if (!grid) return;

    // Load products from backend
    const data = await loadProducts();
    let list = window.PRODUCTS.slice();

    // Apply client-side sorting
    list = applySort(list, STATE.sort);

    grid.innerHTML = "";

    if (list.length === 0) {
        grid.innerHTML = '<p style="grid-column: 1/-1; text-align:center; padding:2rem;">No products found.</p>';
        return;
    }

    list.forEach((p) => {
        const el = document.createElement("article");
        el.className = "product";

        // Build variant options
        const variantOptions = (p.variants || [])
            .map((v, idx) => {
                const priceAdj = parseFloat(v.price_adjustment || 0);
                return `<option value="${idx}">${v.label}${priceAdj ? " (" + (priceAdj > 0 ? "+" : "") + formatPHP(priceAdj) + ")" : ""}</option>`;
            })
            .join("");

        el.innerHTML = `
      <img src="${p.img}" alt="${p.title}">
      <h3>${p.title}</h3>
      <div class="meta">${p.category}</div>
      <div class="price" data-base="${p.price}">${formatPHP(p.price)}</div>
      <div class="actions">
        <select class="variant-select" data-id="${p.id}">${variantOptions || '<option value="0">Standard</option>'}</select>
        <input type="number" class="qty-input" data-id="${p.id}" value="1" min="1" max="${p.stock || 99}">
      </div>
      <div class="actions">
        <button class="btn" data-id="${p.id}" data-action="view">View</button>
        <button class="btn add" data-id="${p.id}" data-action="add" ${p.stock <= 0 ? 'disabled' : ''}>
          ${p.stock <= 0 ? 'Out of Stock' : 'Add to cart'}
        </button>
      </div>
    `;
        grid.appendChild(el);
    });

    renderPagination(data.pagination?.page || 1, data.pagination?.pages || 1);
}

function renderPagination(page, total) {
    const el = document.getElementById("pagination");
    if (!el) return;
    el.innerHTML = "";

    for (let i = 1; i <= total; i++) {
        const b = document.createElement("button");
        b.className = "page-btn" + (i === page ? " active" : "");
        b.textContent = i;
        b.addEventListener("click", () => {
            STATE.page = i;
            renderProducts();
        });
        el.appendChild(b);
    }
}

// ========================================
// CART MANAGEMENT
// ========================================

let CART_DATA = { items: [], subtotal: 0 };

async function loadCartFromBackend() {
    try {
        const user = getUserData();
        if (!user) {
            CART_DATA = { items: [], subtotal: 0 };
            updateCartCount();
            return;
        }

        const data = await CartAPI.getCart();
        if (data.cart) {
            CART_DATA = data.cart;
            updateCartCount();
        }
    } catch (error) {
        console.error("Failed to load cart:", error);
        CART_DATA = { items: [], subtotal: 0 };
    }
}

function updateCartCount() {
    const countEl = document.getElementById("cart-count");
    if (!countEl) return;

    const qty = CART_DATA.items?.reduce((s, i) => s + parseInt(i.quantity || 0), 0) || 0;
    countEl.textContent = qty;
}

async function addToCart(productSlug, qty = 1) {
    try {
        const user = getUserData();
        if (!user) {
            alert("Please login to add items to cart");
            window.router?.navigateTo("/login");
            return;
        }

        // Find product by slug
        const product = window.PRODUCTS.find(p => p.id === productSlug);
        if (!product) {
            alert("Product not found");
            return;
        }

        // Get variant if selected
        const variantSelect = document.querySelector(`.variant-select[data-id="${productSlug}"]`);
        const variantIdx = variantSelect ? parseInt(variantSelect.value || 0, 10) : null;
        const variantId = (product.variants && product.variants[variantIdx]) ? product.variants[variantIdx].id : null;

        // Get quantity from input
        const qtyInput = document.querySelector(`.qty-input[data-id="${productSlug}"]`);
        const quantity = qtyInput ? parseInt(qtyInput.value, 10) : qty;

        await CartAPI.addToCart(product.dbId, quantity, variantId);
        await loadCartFromBackend();

        // Visual feedback
        const button = document.querySelector(`.btn.add[data-id="${productSlug}"]`);
        if (button) {
            const originalText = button.textContent;
            button.textContent = "✓ Added!";
            button.style.background = "#10b981";
            setTimeout(() => {
                button.textContent = originalText;
                button.style.background = "";
            }, 1500);
        }
    } catch (error) {
        console.error("Add to cart failed:", error);
        alert(error.message || "Failed to add to cart");
    }
}

async function renderCartItems() {
    const itemsEl = document.getElementById("cart-items");
    const totalEl = document.getElementById("cart-total");
    if (!itemsEl) return;

    await loadCartFromBackend();

    itemsEl.innerHTML = "";

    if (!CART_DATA.items || CART_DATA.items.length === 0) {
        itemsEl.innerHTML = '<p style="text-align:center;padding:2rem;color:#666;">Your cart is empty</p>';
        if (totalEl) totalEl.textContent = formatPHP(0);
        return;
    }

    CART_DATA.items.forEach((item) => {
        const row = document.createElement("div");
        row.className = "cart-item";
        row.innerHTML = `
      <img src="${item.image_url || '/assets/placeholder.jpg'}" alt="${item.name}">
      <div style="flex:1">
        <div>${item.name}</div>
        <div style="color:#666">${formatPHP(item.unit_price)} x ${item.quantity} ${item.variant_label ? '• ' + item.variant_label : ''}</div>
      </div>
      <div class="cart-actions">
        <div class="qty-row">
          <button class="qty-btn" data-cart-item-id="${item.cart_item_id}" data-action="dec">−</button>
          <input class="qty-input" value="${item.quantity}" readonly>
          <button class="qty-btn" data-cart-item-id="${item.cart_item_id}" data-action="inc">+</button>
        </div>
        <div class="remove-row">
          <button class="btn" data-cart-item-id="${item.cart_item_id}" data-action="rem">Remove</button>
        </div>
      </div>
    `;
        itemsEl.appendChild(row);
    });

    if (totalEl) totalEl.textContent = formatPHP(CART_DATA.subtotal || 0);
}

async function changeCartQty(cartItemId, delta) {
    try {
        const item = CART_DATA.items.find(i => i.cart_item_id == cartItemId);
        if (!item) return;

        const newQty = parseInt(item.quantity) + delta;

        if (newQty <= 0) {
            await CartAPI.removeFromCart(cartItemId);
        } else {
            await CartAPI.updateCartItem(cartItemId, newQty);
        }

        await renderCartItems();
    } catch (error) {
        console.error("Update cart failed:", error);
        alert(error.message || "Failed to update cart");
    }
}

async function removeFromCart(cartItemId) {
    try {
        await CartAPI.removeFromCart(cartItemId);
        await renderCartItems();
    } catch (error) {
        console.error("Remove from cart failed:", error);
        alert(error.message || "Failed to remove item");
    }
}

function openCart() {
    const drawer = document.getElementById("cart-drawer");
    const backdrop = document.getElementById("cart-backdrop");
    if (!drawer) return;

    drawer.classList.add("open");
    drawer.setAttribute("aria-hidden", "false");
    if (backdrop) {
        backdrop.style.opacity = "1";
        backdrop.style.pointerEvents = "auto";
    }
    renderCartItems();
}

function closeCart() {
    const drawer = document.getElementById("cart-drawer");
    const backdrop = document.getElementById("cart-backdrop");
    if (drawer) {
        drawer.classList.remove("open");
        drawer.setAttribute("aria-hidden", "true");
    }
    if (backdrop) {
        backdrop.style.opacity = "0";
        backdrop.style.pointerEvents = "none";
    }
}

// ========================================
// EVENT DELEGATION
// ========================================

document.addEventListener("click", (e) => {
    const t = e.target.closest("[data-action]");
    if (!t) return;

    const action = t.getAttribute("data-action");
    const id = t.getAttribute("data-id");
    const cartItemId = t.getAttribute("data-cart-item-id");

    if (action === "add") addToCart(id, 1);
    if (action === "inc" && cartItemId) changeCartQty(cartItemId, 1);
    if (action === "dec" && cartItemId) changeCartQty(cartItemId, -1);
    if (action === "rem" && cartItemId) removeFromCart(cartItemId);
    if (action === "view") openProductDetail(id);
});

// Variant price change
document.addEventListener("change", (e) => {
    const sel = e.target;
    if (sel.matches(".variant-select")) {
        const id = sel.getAttribute("data-id");
        const prod = PRODUCTS.find((p) => p.id === id);
        if (!prod) return;

        const base = prod.price;
        const variant = prod.variants && prod.variants[parseInt(sel.value, 10)];
        const priceAdj = variant ? parseFloat(variant.price_adjustment || 0) : 0;
        const priceEl = sel.closest(".product").querySelector(".price");
        if (priceEl) priceEl.textContent = formatPHP(base + priceAdj);
    }
});

// ========================================
// PRODUCT DETAIL MODAL
// ========================================

function openProductDetail(productId) {
    const product = window.PRODUCTS.find((p) => p.id === productId);
    if (!product) return;

    const modal = document.getElementById("product-modal");
    const backdrop = document.getElementById("product-modal-backdrop");
    const content = document.getElementById("product-modal-content");

    if (!modal || !backdrop || !content) return;

    const variantOptions = (product.variants || [])
        .map((v, idx) => {
            const priceAdj = parseFloat(v.price_adjustment || 0);
            return `<option value="${idx}">${v.label}${priceAdj ? " (" + (priceAdj > 0 ? "+" : "") + formatPHP(priceAdj) + ")" : ""}</option>`;
        })
        .join("");

    content.innerHTML = `
    <div class="product-detail-grid">
      <div class="product-detail-image">
        <img src="${product.img}" alt="${product.title}">
      </div>
      <div class="product-detail-info">
        <h3>${product.title}</h3>
        <span class="product-detail-category">${product.category}</span>
        <div class="product-detail-price" data-base="${product.price}">${formatPHP(product.price)}</div>
        <div class="product-detail-description">
          Premium ${product.category} component. Built with cutting-edge technology to deliver exceptional performance and reliability.
        </div>
        <div class="product-actions">
          <select class="variant-select" data-id="${product.id}" id="modal-variant-${product.id}">${variantOptions || '<option value="0">Standard</option>'}</select>
          <input type="number" class="qty-input" data-id="${product.id}" id="modal-qty-${product.id}" value="1" min="1" max="${product.stock || 99}">
          <button class="btn add" data-id="${product.id}" data-action="add-from-modal" ${product.stock <= 0 ? 'disabled' : ''}>
            ${product.stock <= 0 ? 'Out of Stock' : 'Add to Cart'}
          </button>
        </div>
      </div>
    </div>
  `;

    modal.classList.add("open");
    backdrop.classList.add("open");
}

function closeProductDetail() {
    const modal = document.getElementById("product-modal");
    const backdrop = document.getElementById("product-modal-backdrop");
    if (modal) modal.classList.remove("open");
    if (backdrop) backdrop.classList.remove("open");
}

// ========================================
// PAGE INITIALIZATION
// ========================================

async function initializePageScript() {
    // Check user session
    await checkUserSession();
    updateAuthNav();
    syncAuthButton();

    // Check if this is admin/employee/superadmin page
    if (document.getElementById("superadmin-welcome")) {
        initializeSuperAdmin?.();
        return;
    }
    if (document.getElementById("admin-welcome")) {
        initializeAdmin?.();
        return;
    }
    if (document.getElementById("employee-welcome")) {
        initializeEmployee?.();
        return;
    }

    // Load products if on shop page
    if (document.getElementById("product-grid")) {
        await renderProducts();
    }

    // Setup cart
    await loadCartFromBackend();
    updateCartCount();

    // Setup event listeners
    const cartToggle = document.getElementById("cart-toggle");
    if (cartToggle) cartToggle.addEventListener("click", openCart);

    const closeBtn = document.querySelectorAll("#close-cart");
    if (closeBtn) closeBtn.forEach((b) => b.addEventListener("click", closeCart));

    const backdrop = document.getElementById("cart-backdrop");
    if (backdrop) backdrop.addEventListener("click", closeCart);

    const checkout = document.getElementById("checkout-btn");
    if (checkout) checkout.addEventListener("click", () => {
        closeCart();
        window.router.navigateTo("/checkout");
    });

    // Product modal
    const productModalClose = document.getElementById("product-modal-close");
    if (productModalClose) productModalClose.addEventListener("click", closeProductDetail);

    const productModalBackdrop = document.getElementById("product-modal-backdrop");
    if (productModalBackdrop) productModalBackdrop.addEventListener("click", closeProductDetail);

    // Category filter
    const catSel = document.getElementById("category-filter");
    if (catSel) {
        catSel.addEventListener("change", (e) => {
            STATE.category = e.target.value;
            STATE.page = 1;
            renderProducts();
        });
    }

    // Sort
    const sortSel = document.getElementById("sort-select");
    if (sortSel) {
        sortSel.addEventListener("change", (e) => {
            STATE.sort = e.target.value;
            STATE.page = 1;
            renderProducts();
        });
    }

    // Search
    const search = document.getElementById("search-input");
    if (search) {
        search.addEventListener("input", (e) => {
            STATE.query = e.target.value;
            STATE.page = 1;
            renderProducts();
        });
    }
}

// Make functions globally available
window.initializePageScript = initializePageScript;
window.updateAuthNav = updateAuthNav;
window.doLogout = doLogout;
window.formatPHP = formatPHP;
