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

        console.log('[loadCheckoutItems] Before loadCartFromBackend, window.CART_DATA:', window.CART_DATA);
        
        await loadCartFromBackend();
        
        console.log('[loadCheckoutItems] After loadCartFromBackend, window.CART_DATA:', window.CART_DATA);

        if (!window.CART_DATA || !window.CART_DATA.items || window.CART_DATA.items.length === 0) {
            console.warn('[loadCheckoutItems] Cart is empty or not loaded');
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

        console.log('[loadCheckoutItems] Cart items to render:', window.CART_DATA.items);

        // Enable submit button if cart has items
        const submitBtn = document.querySelector('#checkout-form button[type="submit"]');
        if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.style.opacity = '1';
            submitBtn.style.cursor = 'pointer';
        }

        checkoutItemsEl.innerHTML = '';
        window.CART_DATA.items.forEach((item) => {
            console.log('[loadCheckoutItems] Rendering item:', item);
            const itemDiv = document.createElement('div');
            itemDiv.className = 'summary-row';
            itemDiv.innerHTML = `
                <span>${item.name}${item.variant_title ? ' (' + item.variant_title + ')' : ''} x ${item.quantity}</span>
                <span>${formatPHP(item.unit_price * item.quantity)}</span>
            `;
            checkoutItemsEl.appendChild(itemDiv);
        });

        if (checkoutTotalEl) {
            console.log('[loadCheckoutItems] Setting total to:', window.CART_DATA.subtotal);
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
            const paymentMethod = document.querySelector('input[name="payment"]:checked')?.value;

            // Validate required fields
            if (!fullname || !email || !phone || !address || !city || !postal) {
                alert('Please fill in all required fields');
                return;
            }

            if (!paymentMethod) {
                alert('Please select a payment method');
                return;
            }

            // Disable submit button to prevent double submission
            const submitBtn = document.querySelector('#checkout-form button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.textContent = 'Processing...';
            }

            // Split full name into first and last name
            const nameParts = fullname.split(' ');
            const firstName = nameParts[0];
            const lastName = nameParts.slice(1).join(' ') || firstName;

            // Save address first
            let addressId;
            try {
                // Check if user already has addresses
                const existingAddresses = await AddressesAPI.getAddresses();
                console.log('Existing addresses:', existingAddresses);
                
                if (!existingAddresses.addresses || existingAddresses.addresses.length === 0) {
                    // First address - save it as default
                    console.log('No existing addresses, creating new one...');
                    const addressResult = await AddressesAPI.addAddress(
                        fullname,  // recipient name
                        phone,
                        address,   // address line 1
                        city,
                        postal,
                        '',        // address line 2
                        'Home',    // label
                        true       // is default
                    );
                    console.log('Address created:', addressResult);
                    addressId = addressResult.address_id;
                } else {
                    // Use the first existing address or create new one
                    console.log('Using existing address:', existingAddresses.addresses[0]);
                    addressId = existingAddresses.addresses[0].id;
                }
                
                console.log('Address ID to use for order:', addressId);
            } catch (error) {
                console.error('Error saving address:', error);
                console.error('Error details:', error.message);
                alert('Error saving address: ' + (error.message || 'Please try again.'));
                if (submitBtn) {
                    submitBtn.disabled = false;
                    submitBtn.textContent = 'Place Order';
                }
                return;
            }

            // Create the order
            try {
                const orderResult = await OrdersAPI.createOrder(
                    addressId,
                    paymentMethod,
                    '' // notes (optional)
                );

                console.log('Order creation result:', orderResult);

                // Order created successfully
                alert('Order placed successfully! Order #' + (orderResult.order_number || orderResult.order_id));
                
                // Clear the cart
                await CartAPI.clearCart();
                window.CART_DATA = { items: [], total: 0 };
                updateCartCount();
                
                // Redirect to profile page to see the order
                window.router.navigateTo('/profile');

            } catch (error) {
                console.error('Checkout error:', error);
                console.error('Error details:', error.message, error.stack);
                alert('Error processing checkout: ' + (error.message || 'Please try again.'));
                if (submitBtn) {
                    submitBtn.disabled = false;
                    submitBtn.textContent = 'Place Order';
                }
            }

        } catch (error) {
            console.error('Checkout error:', error);
            alert('Error processing checkout. Please try again.');
        }
    });
}

// ========================================
// INITIALIZATION
// ========================================

window.initCheckoutPage = async function() {
    console.log('[checkout.js] Initializing checkout page');
    await loadCheckoutData();
    initializeCheckoutForm();
};

// Also support DOMContentLoaded for direct page loads
document.addEventListener('DOMContentLoaded', () => {
    console.log('[checkout.js] DOMContentLoaded - calling initCheckoutPage');
    if (window.initCheckoutPage) {
        window.initCheckoutPage();
    }
});
