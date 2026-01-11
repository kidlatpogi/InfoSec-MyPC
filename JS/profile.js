/**
 * Profile Page Handler
 * Manages profile data loading and section navigation
 */

// ========================================
// PROFILE DATA LOADING
// ========================================

async function loadProfileData() {
    try {
        const user = getUserData();
        console.log('[loadProfileData] Current user data:', user);
        
        if (!user) {
            // Not logged in, redirect to login
            window.router?.navigateTo('/login');
            return;
        }

        // Populate profile overview
        const welcomeHeading = document.querySelector('#overview h1');
        if (welcomeHeading) {
            welcomeHeading.textContent = `Welcome back, ${user.first_name}!`;
            console.log('[loadProfileData] Updated welcome heading');
        }

        // Populate account information
        const nameInfo = document.querySelector('#overview .info-item:nth-child(1) p');
        if (nameInfo) {
            nameInfo.textContent = `${user.first_name} ${user.last_name}`;
            console.log('[loadProfileData] Updated name info to:', nameInfo.textContent);
        } else {
            console.warn('[loadProfileData] Name info element not found');
        }

        const emailInfo = document.querySelector('#overview .info-item:nth-child(2) p');
        if (emailInfo) {
            emailInfo.textContent = user.email;
            console.log('[loadProfileData] Updated email info to:', emailInfo.textContent);
        } else {
            console.warn('[loadProfileData] Email info element not found');
        }

        const phoneInfo = document.querySelector('#overview .info-item:nth-child(3) p');
        if (phoneInfo) {
            phoneInfo.textContent = user.phone || 'Not provided';
            console.log('[loadProfileData] Updated phone info to:', phoneInfo.textContent);
        } else {
            console.warn('[loadProfileData] Phone info element not found');
        }

        const memberSinceInfo = document.querySelector('#overview .info-item:nth-child(4) p');
        if (memberSinceInfo && user.created_at) {
            const date = new Date(user.created_at);
            memberSinceInfo.textContent = date.toLocaleDateString('en-US', { month: 'long', year: 'numeric' });
        }

        // Populate edit profile form
        const editName = document.getElementById('edit-name');
        if (editName) {
            editName.value = `${user.first_name} ${user.last_name}`;
        }

        const editEmail = document.getElementById('edit-email');
        if (editEmail) {
            editEmail.value = user.email;
        }

        const editPhone = document.getElementById('edit-phone');
        if (editPhone) {
            editPhone.value = user.phone || '';
        }

        // Load orders
        await loadUserOrders();
        
        console.log('[loadProfileData] Profile data reload complete');

    } catch (error) {
        console.error('Failed to load profile data:', error);
    }
}

// ========================================
// ORDERS LOADING
// ========================================

async function loadUserOrders() {
    try {
        const data = await OrdersAPI.getOrders();
        const ordersList = document.getElementById('orders-list');

        if (!ordersList) return;

        if (!data.orders || data.orders.length === 0) {
            ordersList.innerHTML = '<p style="text-align:center;padding:2rem;color:#666;">No orders yet. Start shopping!</p>';

            // Update stats
            const totalOrdersStat = document.querySelector('.stat-box:nth-child(1) .stat-number');
            if (totalOrdersStat) totalOrdersStat.textContent = '0';

            const totalSpentStat = document.querySelector('.stat-box:nth-child(2) .stat-number');
            if (totalSpentStat) totalSpentStat.textContent = '₱0.00';

            return;
        }

        // Update stats - count all orders
        const totalOrdersStat = document.querySelector('.stat-box:nth-child(1) .stat-number');
        if (totalOrdersStat) {
            totalOrdersStat.textContent = data.orders.length;
            console.log('[loadUserOrders] Updated total orders to:', data.orders.length);
        }

        const totalSpent = data.orders.reduce((sum, order) => sum + parseFloat(order.total || 0), 0);
        const totalSpentStat = document.querySelector('.stat-box:nth-child(2) .stat-number');
        if (totalSpentStat) {
            totalSpentStat.textContent = formatPHP(totalSpent);
            console.log('[loadUserOrders] Updated total spent to:', formatPHP(totalSpent));
        }

        // Render orders
        ordersList.innerHTML = '';

        data.orders.forEach(order => {
            const statusColors = {
                'pending': '#ff9800',
                'processing': '#2196f3',
                'shipped': '#9c27b0',
                'delivered': '#28a745',
                'cancelled': '#d32f2f'
            };

            const statusColor = statusColors[order.status] || '#666';
            const orderDate = new Date(order.created_at).toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            });

            const itemsList = order.items?.map(item => item.product_name).join(', ') || 'No items';

            const orderCard = document.createElement('div');
            orderCard.className = 'order-card';
            orderCard.setAttribute('data-order-date', order.created_at);
            orderCard.setAttribute('data-order-status', order.status);

            orderCard.innerHTML = `
                <div class="order-header">
                    <span class="order-id">Order ${order.order_number}</span>
                    <span class="order-status" style="color: ${statusColor};">${order.status.charAt(0).toUpperCase() + order.status.slice(1)}</span>
                </div>
                <div class="order-body">
                    <p><strong>Date:</strong> ${orderDate}</p>
                    <p><strong>Total:</strong> ${formatPHP(order.total)}</p>
                    <p><strong>Items:</strong> ${itemsList}</p>
                </div>
                <div class="order-actions">
                    <button class="btn" onclick="viewOrderDetails(${order.id})">View Details</button>
                    ${order.status === 'pending' ? `<button class="btn" onclick="cancelOrder(${order.id})">Cancel</button>` : ''}
                </div>
            `;

            ordersList.appendChild(orderCard);
        });

    } catch (error) {
        console.error('Failed to load orders:', error);
        const ordersList = document.getElementById('orders-list');
        if (ordersList) {
            ordersList.innerHTML = '<p style="text-align:center;padding:2rem;color:#d32f2f;">Failed to load orders. Please try again.</p>';
        }
    }
}

// ========================================
// ORDER ACTIONS
// ========================================

async function viewOrderDetails(orderId) {
    try {
        const data = await OrdersAPI.getOrder(orderId);
        console.log('Order data:', data);
        
        if (data && data.order) {
            const order = data.order;
            displayOrderModal(order);
        } else {
            alert('Order not found');
        }
    } catch (error) {
        console.error('Failed to load order details:', error);
        alert('Failed to load order details: ' + (error.message || 'Unknown error'));
    }
}

function displayOrderModal(order) {
    const modal = document.getElementById('order-details-modal');
    const backdrop = document.getElementById('order-details-backdrop');
    const titleEl = document.getElementById('order-modal-title');
    const contentEl = document.getElementById('order-modal-content');
    
    // Set title
    titleEl.textContent = `Order #${order.order_number || order.id}`;
    
    // Build HTML content
    let itemsHTML = '';
    if (order.items && order.items.length > 0) {
        itemsHTML = order.items.map(item => {
            const imageUrl = item.image_url || item.product_image || 'assets/placeholder.png';
            return `
            <div class="order-item">
                <img src="${imageUrl}" alt="${item.product_name}" class="order-item-image" onerror="this.src='assets/placeholder.png'">
                <div class="order-item-info">
                    <div class="order-item-name">${item.product_name}</div>
                    <div class="order-item-variant">${item.variant_title || 'Standard'}</div>
                    <div class="order-item-details">
                        <span>${item.quantity}x ${formatPHP(item.unit_price)}</span>
                        <span><strong>${formatPHP(item.line_total)}</strong></span>
                    </div>
                </div>
            </div>
        `}).join('');
    } else {
        itemsHTML = '<p>No items in this order</p>';
    }
    
    const statusBadgeClass = `order-status-badge ${order.status}`;
    
    contentEl.innerHTML = `
        <div class="order-info-section">
            <h3>Order Information</h3>
            <div class="order-info-row">
                <span class="label">Status:</span>
                <span class="value"><div class="${statusBadgeClass}">${order.status.toUpperCase()}</div></span>
            </div>
            <div class="order-info-row">
                <span class="label">Order Date:</span>
                <span class="value">${new Date(order.placed_at).toLocaleDateString()}</span>
            </div>
        </div>
        
        <div class="order-info-section">
            <h3>Items Ordered</h3>
            <ul class="order-items-list">
                ${itemsHTML}
            </ul>
        </div>
        
        <div class="order-summary-box">
            <div class="order-summary-row">
                <span class="label">Subtotal:</span>
                <span class="value">${formatPHP(order.subtotal)}</span>
            </div>
            <div class="order-summary-row">
                <span class="label">Shipping:</span>
                <span class="value">${formatPHP(order.shipping)}</span>
            </div>
            <div class="order-summary-row">
                <span class="label">Tax (12%):</span>
                <span class="value">${formatPHP(order.tax)}</span>
            </div>
            <div class="order-summary-row total">
                <span class="label">Total:</span>
                <span class="value">${formatPHP(order.total)}</span>
            </div>
        </div>
    `;
    
    // Show modal
    modal.classList.add('open');
    backdrop.classList.add('open');
}

function closeOrderModal() {
    const modal = document.getElementById('order-details-modal');
    const backdrop = document.getElementById('order-details-backdrop');
    
    if (modal) {
        modal.classList.remove('open');
    }
    if (backdrop) {
        backdrop.classList.remove('open');
    }
}

async function cancelOrder(orderId) {
    if (!confirm('Are you sure you want to cancel this order?')) return;

    try {
        await OrdersAPI.cancelOrder(orderId);
        alert('Order cancelled successfully');
        await loadUserOrders(); // Reload orders
    } catch (error) {
        console.error('Failed to cancel order:', error);
        alert(error.message || 'Failed to cancel order');
    }
}

// ========================================
// SECTION NAVIGATION
// ========================================

function switchSection(sectionId) {
    const menuItems = document.querySelectorAll('.menu-item');
    const sections = document.querySelectorAll('.profile-section');
    
    // Remove active class from all menu items and sections
    menuItems.forEach(mi => mi.classList.remove('active'));
    sections.forEach(s => s.classList.remove('active'));
    
    // Add active class to the target menu item
    const targetMenuItem = document.querySelector(`.menu-item[data-section="${sectionId}"]`);
    if (targetMenuItem) {
        targetMenuItem.classList.add('active');
    }
    
    // Show corresponding section
    const targetSection = document.getElementById(sectionId);
    if (targetSection) {
        targetSection.classList.add('active');
    }
    
    console.log('[switchSection] Switched to:', sectionId);
}

function initProfileNavigation() {
    const menuItems = document.querySelectorAll('.menu-item');
    const sections = document.querySelectorAll('.profile-section');

    menuItems.forEach(item => {
        item.addEventListener('click', () => {
            const sectionId = item.getAttribute('data-section');

            // Handle logout
            if (sectionId === 'logout') {
                doLogout();
                return;
            }

            switchSection(sectionId);
        });
    });
}

// ========================================
// PROFILE EDIT FORM
// ========================================

function initProfileEditForm() {
    const form = document.getElementById('edit-profile-form');
    if (!form) return;

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        const fullName = document.getElementById('edit-name').value.trim();
        const email = document.getElementById('edit-email').value.trim();
        const phone = document.getElementById('edit-phone').value.trim();
        const currentPassword = document.getElementById('current-password').value;
        const newPassword = document.getElementById('new-password').value;
        const confirmPassword = document.getElementById('confirm-password').value;

        console.log('Form data:', { fullName, email, phone, hasCurrentPassword: !!currentPassword, hasNewPassword: !!newPassword });

        if (!fullName) {
            alert('Full name is required');
            return;
        }

        if (!email) {
            alert('Email is required');
            return;
        }

        // Validate phone number (must be exactly 11 digits)
        if (phone && !/^\d{11}$/.test(phone)) {
            alert('Phone number must be exactly 11 digits');
            return;
        }

        // Split full name into first and last name
        const nameParts = fullName.split(' ');
        const firstName = nameParts[0] || '';
        const lastName = nameParts.slice(1).join(' ') || '';

        console.log('Name split:', { firstName, lastName });

        // If changing password, validate
        if (newPassword || confirmPassword) {
            if (!currentPassword) {
                alert('Please enter your current password to change it');
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

        try {
            const requestBody = new URLSearchParams({
                first_name: firstName,
                last_name: lastName,
                email: email,
                phone: phone,
                current_password: currentPassword || '',
                new_password: newPassword || ''
            });
            
            console.log('Sending request to /HTML_PHP/auth.php?action=updateProfile');
            console.log('Request body:', requestBody.toString());
            
            const response = await fetch('/HTML_PHP/auth.php?action=updateProfile', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: requestBody
            });

            console.log('Response status:', response.status);
            console.log('Response headers:', Object.fromEntries(response.headers.entries()));
            
            const responseText = await response.text();
            console.log('Response text:', responseText);
            
            let data;
            try {
                data = JSON.parse(responseText);
            } catch (parseError) {
                console.error('Failed to parse JSON:', parseError);
                alert('Server returned invalid response. Check console for details.');
                return;
            }
            
            console.log('Update response:', data);

            if (data.success) {
                // Update localStorage with server response data
                if (data.user) {
                    // Use the user data from server response
                    const currentUser = getUserData();
                    const updatedUser = {
                        ...currentUser,
                        first_name: data.user.first_name,
                        last_name: data.user.last_name,
                        email: data.user.email,
                        phone: data.user.phone
                    };
                    localStorage.setItem('user_data', JSON.stringify(updatedUser));
                    console.log('Updated user data in localStorage:', updatedUser);
                } else {
                    // Fallback: update with the values we sent
                    const user = getUserData();
                    user.first_name = firstName;
                    user.last_name = lastName;
                    user.email = email;
                    user.phone = phone;
                    localStorage.setItem('user_data', JSON.stringify(user));
                    console.log('Updated user data (fallback):', user);
                }

                // Clear password fields immediately
                document.getElementById('current-password').value = '';
                document.getElementById('new-password').value = '';
                document.getElementById('confirm-password').value = '';

                // Switch to Profile Overview to show the changes
                switchSection('overview');
                
                // Immediately update the Profile Overview UI with new data
                const fullNameDisplay = `${firstName} ${lastName}`;
                
                // Update welcome heading
                const welcomeHeading = document.querySelector('#overview h1');
                if (welcomeHeading) {
                    welcomeHeading.textContent = `Welcome back, ${firstName}!`;
                }
                
                // Update account information directly
                const nameInfo = document.querySelector('#overview .info-item:nth-child(1) p');
                if (nameInfo) {
                    nameInfo.textContent = fullNameDisplay;
                }
                
                const emailInfo = document.querySelector('#overview .info-item:nth-child(2) p');
                if (emailInfo) {
                    emailInfo.textContent = email;
                }
                
                const phoneInfo = document.querySelector('#overview .info-item:nth-child(3) p');
                if (phoneInfo) {
                    phoneInfo.textContent = phone || 'Not provided';
                }
                
                console.log('Updated UI directly with:', { fullNameDisplay, email, phone });
                
                // Update the auth navigation to reflect name changes
                if (typeof window.updateAuthNav === 'function') {
                    window.updateAuthNav();
                    console.log('Auth nav updated');
                }
                
                // Show success message
                alert('Profile updated successfully!');
            } else {
                console.error('Update failed:', data);
                alert(data.message || 'Error updating profile');
            }
        } catch (error) {
            console.error('Error updating profile:', error);
            alert('Error updating profile. Please check the console for details.');
        }
    });
}

// ========================================
// ADDRESS MANAGEMENT
// ========================================

async function loadAddresses() {
    try {
        const data = await AddressesAPI.getAddresses();
        const addressesList = document.querySelector('#addresses .addresses-list');

        if (!addressesList) return;

        if (!data.addresses || data.addresses.length === 0) {
            addressesList.innerHTML = '<p style="text-align:center;padding:2rem;color:#666;">No addresses yet. Add one to get started!</p>';
            return;
        }

        addressesList.innerHTML = '';
        data.addresses.forEach(addr => {
            const addrCard = document.createElement('div');
            addrCard.className = 'address-card';
            addrCard.style.cssText = 'border:1px solid #ddd;border-radius:8px;padding:1rem;margin:0.5rem 0;background:#f9f9f9';
            addrCard.innerHTML = `
                <div style="display:flex;justify-content:space-between;align-items:flex-start;">
                    <div>
                        <strong>${addr.label || 'Address'}</strong>
                        <p>${addr.line1}${addr.line2 ? ', ' + addr.line2 : ''}</p>
                        <p>${addr.city} ${addr.postal_code}</p>
                        <p>📞 ${addr.phone}</p>
                        ${addr.is_default ? '<span class="badge" style="background:#10b981;color:white">Default</span>' : ''}
                    </div>
                    <div>
                        <button class="btn btn-sm" onclick="editAddress(${addr.id})" style="margin:0.25rem">Edit</button>
                        <button class="btn btn-sm btn-danger" onclick="deleteAddress(${addr.id})" style="margin:0.25rem">Delete</button>
                    </div>
                </div>
            `;
            addressesList.appendChild(addrCard);
        });
    } catch (error) {
        console.error('Failed to load addresses:', error);
        const addressesList = document.querySelector('#addresses .addresses-list');
        if (addressesList) {
            addressesList.innerHTML = '<p style="color:#d32f2f;">Failed to load addresses</p>';
        }
    }
}

function initAddressManagement() {
    const addAddressBtn = document.querySelector('#addresses .primary');
    const addressModal = document.getElementById('address-modal');
    const addressForm = document.getElementById('address-form');
    const modalTitle = document.getElementById('address-modal-title');
    window.editingAddressId = null;

    if (addAddressBtn) {
        addAddressBtn.addEventListener('click', () => {
            window.editingAddressId = null;
            modalTitle.textContent = 'Add New Address';
            document.getElementById('address-label').value = '';
            document.getElementById('address-phone').value = '';
            document.getElementById('address-line1').value = '';
            document.getElementById('address-line2').value = '';
            document.getElementById('address-city').value = '';
            document.getElementById('address-postal').value = '';
            document.getElementById('address-default').checked = false;
            addressModal.classList.add('open');
        });
    }

    // Handle form submission
    addressForm.onsubmit = async (e) => {
        e.preventDefault();

        const label = document.getElementById('address-label').value.trim();
        const phone = document.getElementById('address-phone').value.trim();
        const addressLine1 = document.getElementById('address-line1').value.trim();
        const addressLine2 = document.getElementById('address-line2').value.trim();
        const city = document.getElementById('address-city').value.trim();
        const postalCode = document.getElementById('address-postal').value.trim();
        const isDefault = document.getElementById('address-default').checked;

        // Validate phone number (must be exactly 11 digits)
        if (!/^\d{11}$/.test(phone)) {
            alert('Phone number must be exactly 11 digits');
            return;
        }

        try {
            // Check if setting as default and another default exists
            if (isDefault) {
                const data = await AddressesAPI.getAddresses();
                const currentDefault = data.addresses && data.addresses.find(addr => addr.is_default && addr.id != window.editingAddressId);
                
                if (currentDefault) {
                    const confirmChange = confirm('An address is already set as default. Would you like to change it to this address?');
                    if (!confirmChange) {
                        return;
                    }
                }
            }

            if (window.editingAddressId) {
                // Update existing address
                await AddressesAPI.updateAddress(window.editingAddressId, {
                    label,
                    phone,
                    line1: addressLine1,
                    line2: addressLine2,
                    city,
                    postal_code: postalCode,
                    is_default: isDefault
                });
                alert('Address updated successfully');
            } else {
                // Add new address
                await AddressesAPI.addAddress('', phone, addressLine1, city, postalCode, addressLine2, label, isDefault);
                alert('Address added successfully');
            }
            addressModal.classList.remove('open');
            loadAddresses();
        } catch (error) {
            alert('Error: ' + error.message);
        }
    };

    // Close modal button
    document.querySelectorAll('#address-modal .modal-close, #address-modal [data-action="cancel"]').forEach(btn => {
        btn.addEventListener('click', () => {
            addressModal.classList.remove('open');
        });
    });

    // Initial load
    loadAddresses();
}

async function editAddress(addressId) {
    const addressModal = document.getElementById('address-modal');
    const modalTitle = document.getElementById('address-modal-title');

    try {
        // Fetch current address data
        const data = await AddressesAPI.getAddresses();
        const address = data.addresses.find(a => a.id == addressId);

        if (!address) {
            alert('Address not found');
            return;
        }

        // Set as currently editing
        window.editingAddressId = addressId;

        // Populate form with current data
        document.getElementById('address-label').value = address.label || '';
        document.getElementById('address-phone').value = address.phone || '';
        document.getElementById('address-line1').value = address.line1 || '';
        document.getElementById('address-line2').value = address.line2 || '';
        document.getElementById('address-city').value = address.city || '';
        document.getElementById('address-postal').value = address.postal_code || '';
        document.getElementById('address-default').checked = address.is_default || false;

        // Set modal title
        modalTitle.textContent = `Edit Address: ${address.label}`;

        // Show modal
        addressModal.classList.add('open');
    } catch (error) {
        alert('Error loading address: ' + error.message);
    }
}

async function deleteAddress(addressId) {
    if (!confirm('Delete this address?')) return;

    try {
        // Get all addresses before deletion
        const data = await AddressesAPI.getAddresses();
        const addressToDelete = data.addresses.find(addr => addr.id == addressId);
        
        // Delete the address
        await AddressesAPI.deleteAddress(addressId);
        
        // If the deleted address was default and there are other addresses, make the first remaining one default
        if (addressToDelete && addressToDelete.is_default && data.addresses.length > 1) {
            const remainingAddresses = data.addresses.filter(addr => addr.id != addressId);
            if (remainingAddresses.length > 0) {
                const newDefaultAddress = remainingAddresses[0];
                await AddressesAPI.updateAddress(newDefaultAddress.id, { is_default: true });
            }
        }
        
        alert('Address deleted successfully');
        loadAddresses();
    } catch (error) {
        alert('Error deleting address: ' + error.message);
    }
}

// ========================================
// ORDER SORTING
// ========================================

function initOrderSorting() {
    const sortDate = document.getElementById('order-sort-date');
    const sortStatus = document.getElementById('order-sort-status');

    if (sortDate) {
        sortDate.addEventListener('change', sortOrders);
    }

    if (sortStatus) {
        sortStatus.addEventListener('change', sortOrders);
    }
}

function sortOrders() {
    const sortDate = document.getElementById('order-sort-date')?.value || 'newest';
    const sortStatus = document.getElementById('order-sort-status')?.value || 'all';
    const ordersList = document.getElementById('orders-list');

    if (!ordersList) return;

    const orders = Array.from(ordersList.querySelectorAll('.order-card'));

    // Filter by status
    orders.forEach(order => {
        const status = order.getAttribute('data-order-status');
        if (sortStatus === 'all' || status === sortStatus.toLowerCase()) {
            order.style.display = '';
        } else {
            order.style.display = 'none';
        }
    });

    // Sort by date
    const visibleOrders = orders.filter(order => order.style.display !== 'none');
    visibleOrders.sort((a, b) => {
        const dateA = new Date(a.getAttribute('data-order-date'));
        const dateB = new Date(b.getAttribute('data-order-date'));
        return sortDate === 'newest' ? dateB - dateA : dateA - dateB;
    });

    // Re-append in sorted order
    visibleOrders.forEach(order => ordersList.appendChild(order));
}

// ========================================
// INITIALIZATION
// ========================================

async function initProfilePage() {
    await loadProfileData();
    initProfileNavigation();
    initProfileEditForm();
    initAddressManagement();
    initOrderSorting();
    initOrderDetailsModal();
    
    // If coming from checkout, show orders section
    if (window.showOrdersAfterCheckout) {
        switchSection('orders');
        window.showOrdersAfterCheckout = false;
    }
}

function initOrderDetailsModal() {
    const closeBtn = document.getElementById('order-modal-close');
    const backdrop = document.getElementById('order-details-backdrop');
    
    if (closeBtn) {
        closeBtn.addEventListener('click', closeOrderModal);
    }
    
    if (backdrop) {
        backdrop.addEventListener('click', closeOrderModal);
    }
}

// Delete (archive) own account - Step 1: Confirmation Modal
function deleteMyAccount() {
    const confirmModal = document.getElementById('delete-account-confirm-modal');
    const confirmBackdrop = document.getElementById('delete-account-confirm-backdrop');
    const confirmNoBtn = document.getElementById('delete-account-confirm-no');
    const confirmYesBtn = document.getElementById('delete-account-confirm-yes');
    const confirmCloseBtn = document.getElementById('delete-account-confirm-close');
    
    if (!confirmModal || !confirmBackdrop) {
        alert('Error: Confirmation modal not found');
        return;
    }
    
    // Show the initial confirmation modal
    confirmModal.classList.add('active');
    confirmBackdrop.classList.add('active');
    
    const handleNo = () => {
        confirmModal.classList.remove('active');
        confirmBackdrop.classList.remove('active');
        // Remove event listeners
        confirmNoBtn.removeEventListener('click', handleNo);
        confirmYesBtn.removeEventListener('click', handleYes);
        confirmCloseBtn.removeEventListener('click', handleNo);
        confirmBackdrop.removeEventListener('click', handleBackdropClick);
    };
    
    const handleYes = () => {
        confirmModal.classList.remove('active');
        confirmBackdrop.classList.remove('active');
        // Remove event listeners
        confirmNoBtn.removeEventListener('click', handleNo);
        confirmYesBtn.removeEventListener('click', handleYes);
        confirmCloseBtn.removeEventListener('click', handleNo);
        confirmBackdrop.removeEventListener('click', handleBackdropClick);
        // Show password confirmation modal
        showPasswordConfirmationModal();
    };
    
    const handleBackdropClick = (e) => {
        if (e.target === confirmBackdrop) {
            handleNo();
        }
    };
    
    // Event listeners for confirmation modal
    confirmNoBtn.addEventListener('click', handleNo);
    confirmYesBtn.addEventListener('click', handleYes);
    confirmCloseBtn.addEventListener('click', handleNo);
    confirmBackdrop.addEventListener('click', handleBackdropClick);
}

// Delete Account - Step 2: Password Confirmation Modal
function showPasswordConfirmationModal() {
    const modal = document.getElementById('delete-account-modal');
    const backdrop = document.getElementById('delete-account-backdrop');
    const passwordInput = document.getElementById('delete-account-password');
    const confirmCheckbox = document.getElementById('delete-account-confirm');
    const confirmBtn = document.getElementById('delete-account-confirm-btn');
    const cancelBtn = document.getElementById('delete-account-cancel');
    const closeBtn = document.getElementById('delete-account-close');
    
    if (!backdrop || !modal) {
        alert('Error: Modal not found');
        return;
    }
    
    // Reset form
    passwordInput.value = '';
    confirmCheckbox.checked = false;
    confirmBtn.disabled = true;
    
    // Show modal
    backdrop.classList.add('active');
    modal.classList.add('active');
    
    // Update confirm button state based on inputs
    const updateConfirmBtn = () => {
        confirmBtn.disabled = !passwordInput.value || !confirmCheckbox.checked;
    };
    
    const handleConfirm = async () => {
        const password = passwordInput.value;
        
        if (!password) {
            alert('Please enter your password.');
            return;
        }
        
        if (!confirmCheckbox.checked) {
            alert('Please confirm that you understand this action cannot be undone.');
            return;
        }
        
        try {
            confirmBtn.disabled = true;
            confirmBtn.textContent = 'Deleting...';
            
            const result = await AuthAPI.deleteAccount(password);
            alert('Your account has been deactivated. You will be logged out now.');
            window.location.href = '/';
        } catch (error) {
            confirmBtn.disabled = false;
            confirmBtn.textContent = 'Delete Account';
            alert('Failed to delete account: ' + (error.message || 'Unknown error'));
        }
    };
    
    const handleCancel = () => {
        backdrop.classList.remove('active');
        modal.classList.remove('active');
        passwordInput.value = '';
        confirmCheckbox.checked = false;
        // Remove event listeners
        passwordInput.removeEventListener('input', updateConfirmBtn);
        confirmCheckbox.removeEventListener('change', updateConfirmBtn);
        confirmBtn.removeEventListener('click', handleConfirm);
        cancelBtn.removeEventListener('click', handleCancel);
        closeBtn.removeEventListener('click', handleCancel);
        backdrop.removeEventListener('click', handleBackdropClick);
    };
    
    const handleBackdropClick = (e) => {
        if (e.target === backdrop) {
            handleCancel();
        }
    };
    
    // Event listeners
    passwordInput.addEventListener('input', updateConfirmBtn);
    confirmCheckbox.addEventListener('change', updateConfirmBtn);
    confirmBtn.addEventListener('click', handleConfirm);
    cancelBtn.addEventListener('click', handleCancel);
    closeBtn.addEventListener('click', handleCancel);
    backdrop.addEventListener('click', handleBackdropClick);
    
    // Initialize button state and focus
    updateConfirmBtn();
    passwordInput.focus();
}

// Make functions globally available
window.initProfilePage = initProfilePage;
window.switchSection = switchSection;
window.viewOrderDetails = viewOrderDetails;
window.cancelOrder = cancelOrder;
window.editAddress = editAddress;
window.deleteAddress = deleteAddress;
window.loadAddresses = loadAddresses;
window.closeOrderModal = closeOrderModal;
window.deleteMyAccount = deleteMyAccount;

// Auto-init removed to prevent double initialization by router
