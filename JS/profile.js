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
            if (totalSpentStat) totalSpentStat.textContent = '₱0';

            return;
        }

        // Update stats
        const totalOrdersStat = document.querySelector('.stat-box:nth-child(1) .stat-number');
        if (totalOrdersStat) totalOrdersStat.textContent = data.orders.length;

        const totalSpent = data.orders.reduce((sum, order) => sum + parseFloat(order.total || 0), 0);
        const totalSpentStat = document.querySelector('.stat-box:nth-child(2) .stat-number');
        if (totalSpentStat) totalSpentStat.textContent = formatPHP(totalSpent);

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
        if (data.order) {
            alert(`Order Details:\n\nOrder #${data.order.order_number}\nStatus: ${data.order.status}\nTotal: ${formatPHP(data.order.total)}\n\nShipping Address:\n${data.order.shipping_address}`);
        }
    } catch (error) {
        console.error('Failed to load order details:', error);
        alert('Failed to load order details');
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
                        <p>${addr.recipient_name}</p>
                        <p>${addr.address_line1}${addr.address_line2 ? ', ' + addr.address_line2 : ''}</p>
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
    let editingAddressId = null;

    if (addAddressBtn) {
        addAddressBtn.addEventListener('click', () => {
            editingAddressId = null;
            modalTitle.textContent = 'Add New Address';
            document.getElementById('address-label').value = '';
            document.getElementById('address-recipient').value = '';
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
        const recipientName = document.getElementById('address-recipient').value.trim();
        const phone = document.getElementById('address-phone').value.trim();
        const addressLine1 = document.getElementById('address-line1').value.trim();
        const addressLine2 = document.getElementById('address-line2').value.trim();
        const city = document.getElementById('address-city').value.trim();
        const postalCode = document.getElementById('address-postal').value.trim();
        const isDefault = document.getElementById('address-default').checked;

        try {
            if (editingAddressId) {
                // Update existing address
                await AddressesAPI.updateAddress(editingAddressId, {
                    label,
                    recipient_name: recipientName,
                    phone,
                    address: addressLine1,
                    address_line_2: addressLine2,
                    city,
                    postal_code: postalCode,
                    is_default: isDefault
                });
                alert('Address updated successfully');
            } else {
                // Add new address
                await AddressesAPI.addAddress(recipientName, phone, addressLine1, city, postalCode, addressLine2, label, isDefault);
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
    const addressForm = document.getElementById('address-form');
    const modalTitle = document.getElementById('address-modal-title');

    // Fetch current address data
    const addresses = await AddressesAPI.getAddresses();
    const address = addresses.find(a => a.id == addressId);

    if (!address) {
        alert('Address not found');
        return;
    }

    // Populate form with current data
    document.getElementById('address-label').value = address.label || '';
    document.getElementById('address-recipient').value = address.recipient_name || '';
    document.getElementById('address-phone').value = address.phone || '';
    document.getElementById('address-line1').value = address.address || '';
    document.getElementById('address-line2').value = address.address_line_2 || '';
    document.getElementById('address-city').value = address.city || '';
    document.getElementById('address-postal').value = address.postal_code || '';
    document.getElementById('address-default').checked = address.is_default || false;

    // Set modal title
    modalTitle.textContent = `Edit Address: ${address.label}`;

    // Show modal
    addressModal.classList.add('open');

    // Create a new form handler for this edit
    const newForm = addressForm.cloneNode(true);
    addressForm.parentNode.replaceChild(newForm, addressForm);

    newForm.onsubmit = async (e) => {
        e.preventDefault();

        const label = document.getElementById('address-label').value.trim();
        const recipientName = document.getElementById('address-recipient').value.trim();
        const phone = document.getElementById('address-phone').value.trim();
        const addressLine1 = document.getElementById('address-line1').value.trim();
        const addressLine2 = document.getElementById('address-line2').value.trim();
        const city = document.getElementById('address-city').value.trim();
        const postalCode = document.getElementById('address-postal').value.trim();
        const isDefault = document.getElementById('address-default').checked;

        try {
            await AddressesAPI.updateAddress(addressId, {
                label,
                recipient_name: recipientName,
                phone,
                address: addressLine1,
                address_line_2: addressLine2,
                city,
                postal_code: postalCode,
                is_default: isDefault
            });
            alert('Address updated successfully');
            addressModal.classList.remove('open');
            loadAddresses();
        } catch (error) {
            alert('Error updating address: ' + error.message);
        }
    };
}

async function deleteAddress(addressId) {
    if (!confirm('Delete this address?')) return;

    try {
        await AddressesAPI.deleteAddress(addressId);
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
}

// Make functions globally available
window.initProfilePage = initProfilePage;
window.viewOrderDetails = viewOrderDetails;
window.cancelOrder = cancelOrder;
window.editAddress = editAddress;
window.deleteAddress = deleteAddress;
window.loadAddresses = loadAddresses;

// Auto-init removed to prevent double initialization by router
