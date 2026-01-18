/**
 * Checkout Page Handler
 * Manages checkout form initialization and address auto-fill
 */

// ========================================
// HELPER FUNCTIONS
// ========================================

function calculateShippingFee(subtotal) {
    // ₱150 shipping for orders below ₱5,000; free for ₱5,000 and above
    return subtotal >= 5000 ? 0 : 150;
}

function updateSelectedTotal() {
    const subtotalEl = document.getElementById('checkout-subtotal');
    const shippingEl = document.getElementById('checkout-shipping');
    const taxEl = document.getElementById('checkout-tax');
    const totalEl = document.getElementById('checkout-total');
    
    if (!subtotalEl || !totalEl) return;
    
    // Calculate subtotal from selected items in CART_DATA
    let subtotal = 0;
    
    if (window.CART_DATA && window.CART_DATA.items) {
        window.CART_DATA.items.forEach(item => {
            if (item.selected === true) {
                subtotal += parseFloat(item.line_total || 0);
            }
        });
    }
    
    // Calculate shipping fee
    const shippingFee = calculateShippingFee(subtotal);
    
    // Calculate tax (12% VAT)
    const tax = subtotal * 0.12;
    
    // Calculate total
    const total = subtotal + shippingFee + tax;
    
    // Update display
    subtotalEl.textContent = formatPHP(subtotal || 0);
    if (shippingEl) shippingEl.textContent = formatPHP(shippingFee);
    if (taxEl) taxEl.textContent = formatPHP(tax);
    totalEl.textContent = formatPHP(total || 0);
    
    // Store in window for checkout submission
    window.checkoutCalculations = {
        subtotal,
        shippingFee,
        tax,
        total
    };
}

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
                // Get the default address or first address
                let defaultAddress = addressesData.addresses.find(addr => addr.is_default === 1) || addressesData.addresses[0];
                
                const addressEl = document.getElementById('address');
                if (addressEl) {
                    addressEl.value = `${defaultAddress.line1}${defaultAddress.line2 ? ', ' + defaultAddress.line2 : ''}`;
                }

                const cityEl = document.getElementById('city');
                if (cityEl) {
                    cityEl.value = defaultAddress.city || '';
                }

                const postalEl = document.getElementById('postal');
                if (postalEl) {
                    postalEl.value = defaultAddress.postal_code || '';
                }

                // Auto-fill phone from address if available
                const addressPhoneEl = document.getElementById('phone');
                if (addressPhoneEl && defaultAddress.phone) {
                    addressPhoneEl.value = defaultAddress.phone;
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


        // Enable submit button if cart has items
        const submitBtn = document.querySelector('#checkout-form button[type="submit"]');
        if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.style.opacity = '1';
            submitBtn.style.cursor = 'pointer';
        }

        checkoutItemsEl.innerHTML = '';
        window.CART_DATA.items.forEach((item) => {
            // Only show items that were selected in the cart
            if (item.selected === true) {
                const itemDiv = document.createElement('div');
                itemDiv.className = 'summary-row';
                itemDiv.style.display = 'flex';
                itemDiv.style.justifyContent = 'space-between';
                itemDiv.style.alignItems = 'center';
                
                const labelSpan = document.createElement('span');
                labelSpan.textContent = `${item.name}${item.variant_title ? ' (' + item.variant_title + ')' : ''} x ${item.quantity}`;
                
                const priceSpan = document.createElement('span');
                priceSpan.textContent = formatPHP(item.unit_price * item.quantity);
                
                itemDiv.appendChild(labelSpan);
                itemDiv.appendChild(priceSpan);
                checkoutItemsEl.appendChild(itemDiv);
            }
        });

        // Add "Select All" functionality
        const selectAllCheckbox = document.getElementById('select-all-items');
        if (selectAllCheckbox) {
            selectAllCheckbox.addEventListener('change', (e) => {
                const itemCheckboxes = document.querySelectorAll('.item-checkbox');
                itemCheckboxes.forEach(checkbox => {
                    checkbox.checked = e.target.checked;
                    // Update CART_DATA when select all is used
                    const cartItem = window.CART_DATA.items.find(i => i.cart_item_id == checkbox.dataset.cartItemId);
                    if (cartItem) {
                        cartItem.selected = e.target.checked;
                    }
                });
                updateSelectedTotal();
            });
        }

        // Calculate and display the total for selected items
        updateSelectedTotal();

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

            // Check if at least one item was selected in the cart
            const selectedItems = window.CART_DATA.items.filter(item => item.selected === true);
            if (selectedItems.length === 0) {
                alert('Please select at least one item from your cart to checkout');
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

            // Validate phone number (must be exactly 11 digits)
            if (!/^\d{11}$/.test(phone)) {
                alert('Phone number must be exactly 11 digits');
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
                
                if (!existingAddresses.addresses || existingAddresses.addresses.length === 0) {
                    // First address - save it as default
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
                    addressId = addressResult.address_id;
                } else {
                    // Use the first existing address or create new one
                    addressId = existingAddresses.addresses[0].id;
                }
                
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
                // Collect selected cart item IDs from CART_DATA
                const selectedCartItemIds = window.CART_DATA.items
                    .filter(item => item.selected === true)
                    .map(item => item.cart_item_id);

                const orderResult = await OrdersAPI.createOrder(
                    addressId,
                    paymentMethod,
                    '', // notes (optional)
                    selectedCartItemIds // pass selected items
                );


                // Order created successfully
                alert('Order placed successfully! Order #' + (orderResult.order_number || orderResult.order_id));
                
                // Clear the cart (or just remove selected items)
                await CartAPI.clearCart();
                window.CART_DATA = { items: [], total: 0 };
                updateCartCount();
                
                // Set flag to show orders section after page load
                window.showOrdersAfterCheckout = true;
                
                // Redirect to profile page
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
    await loadCheckoutData();
    initializeCheckoutForm();
};

// Also support DOMContentLoaded for direct page loads
document.addEventListener('DOMContentLoaded', () => {
    if (window.initCheckoutPage) {
        window.initCheckoutPage();
    }
});
