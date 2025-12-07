/**
 * Checkout Page Handler
 * Manages checkout form initialization and address auto-fill
 */

// ========================================
// CHECKOUT DATA LOADING
// ========================================

async function loadCheckoutData() {
    try {
        const user = getUserData();
        if (!user) {
            // Not logged in, redirect to login
            window.router?.navigateTo('/login');
            return;
        }

        // Auto-fill user information
        const fullnameEl = document.getElementById('fullname');
        if (fullnameEl) {
            fullnameEl.value = `${user.first_name} ${user.last_name}`;
        }

        const emailEl = document.getElementById('email');
        if (emailEl) {
            emailEl.value = user.email;
        }

        const phoneEl = document.getElementById('phone');
        if (phoneEl) {
            phoneEl.value = user.phone || '';
        }

        // Load user addresses
        try {
            const addressesData = await AddressesAPI.getAddresses();
            if (addressesData.addresses && addressesData.addresses.length > 0) {
                // Get the first address (or primary address)
                const address = addressesData.addresses[0];
                
                const addressEl = document.getElementById('address');
                if (addressEl) {
                    addressEl.value = `${address.line1}${address.line2 ? ', ' + address.line2 : ''}`;
                }

                const cityEl = document.getElementById('city');
                if (cityEl) {
                    cityEl.value = address.city || '';
                }

                const postalEl = document.getElementById('postal');
                if (postalEl) {
                    postalEl.value = address.postal_code || '';
                }
            }
        } catch (error) {
            console.warn('Could not load addresses:', error);
            // It's okay if addresses don't load, user can enter manually
        }

        // Load cart items
        await loadCheckoutItems();

    } catch (error) {
        console.error('Failed to load checkout data:', error);
    }
}

// ========================================
// CHECKOUT ITEMS LOADING
// ========================================

async function loadCheckoutItems() {
    try {
        const checkoutItemsEl = document.getElementById('checkout-items');
        const checkoutTotalEl = document.getElementById('checkout-total');

        if (!checkoutItemsEl) return;

        await loadCartFromBackend();

        if (!window.CART_DATA.items || window.CART_DATA.items.length === 0) {
            checkoutItemsEl.innerHTML = '<p style="text-align:center;padding:2rem;color:#d32f2f;">Your cart is empty. Please add items before checking out.</p>';
            if (checkoutTotalEl) checkoutTotalEl.textContent = formatPHP(0);
            
            // Disable submit button
            const submitBtn = document.querySelector('#checkout-form button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.style.opacity = '0.5';
                submitBtn.style.cursor = 'not-allowed';
            }
            return;
        }

        // Enable submit button if cart has items
        const submitBtn = document.querySelector('#checkout-form button[type="submit"]');
        if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.style.opacity = '1';
            submitBtn.style.cursor = 'pointer';
        }

        checkoutItemsEl.innerHTML = '';
        window.CART_DATA.items.forEach((item) => {
            const itemDiv = document.createElement('div');
            itemDiv.className = 'summary-row';
            itemDiv.innerHTML = `
                <span>${item.name}${item.variant_label ? ' (' + item.variant_label + ')' : ''} x ${item.quantity}</span>
                <span>${formatPHP(item.unit_price * item.quantity)}</span>
            `;
            checkoutItemsEl.appendChild(itemDiv);
        });

        if (checkoutTotalEl) {
            checkoutTotalEl.textContent = formatPHP(window.CART_DATA.subtotal || 0);
        }

    } catch (error) {
        console.error('Failed to load checkout items:', error);
    }
}

// ========================================
// CHECKOUT FORM SUBMISSION
// ========================================

function initializeCheckoutForm() {
    const form = document.getElementById('checkout-form');
    if (!form) return;

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        try {
            // Validate cart
            if (!window.CART_DATA.items || window.CART_DATA.items.length === 0) {
                alert('Your cart is empty');
                return;
            }

            // Get form data
            const fullname = document.getElementById('fullname').value.trim();
            const email = document.getElementById('email').value.trim();
            const phone = document.getElementById('phone').value.trim();
            const address = document.getElementById('address').value.trim();
            const city = document.getElementById('city').value.trim();
            const postal = document.getElementById('postal').value.trim();
            const paymentMethod = document.querySelector('input[name="payment"]:checked').value;

            // Validate required fields
            if (!fullname || !email || !phone || !address || !city || !postal) {
                alert('Please fill in all required fields');
                return;
            }

            // Submit order (this would typically call an API)
            console.log('Order submitted:', {
                fullname, email, phone, address, city, postal, paymentMethod
            });

            // TODO: Call OrdersAPI.createOrder() here
            alert('Order submitted successfully!');
            window.router.navigateTo('/profile');

        } catch (error) {
            console.error('Checkout error:', error);
            alert('Error processing checkout. Please try again.');
        }
    });
}

// ========================================
// INITIALIZATION
// ========================================

document.addEventListener('DOMContentLoaded', () => {
    console.log('[checkout.js] Initializing checkout page');
    loadCheckoutData();
    initializeCheckoutForm();
});
