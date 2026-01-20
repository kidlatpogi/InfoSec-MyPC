/**
 * Authentication Handlers
 * Login and Signup form handling
 */

// ========================================
// LOGIN HANDLER
// ========================================

function initLoginPage() {
    const form = document.getElementById('login-form');
    if (!form) return;

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        // Clear previous errors
        document.querySelectorAll('.error').forEach(el => el.textContent = '');

        const email = document.getElementById('email').value.trim();
        const password = document.getElementById('password').value;

        // Basic validation
        if (!email || !password) {
            if (!email) document.getElementById('email-error').textContent = 'Email is required';
            if (!password) document.getElementById('password-error').textContent = 'Password is required';
            return;
        }

        // Disable submit button
        const submitBtn = form.querySelector('button[type="submit"]');
        const originalText = submitBtn.textContent;
        submitBtn.disabled = true;
        submitBtn.textContent = 'Signing in...';

        try {
            const data = await AuthAPI.login(email, password);

            if (data.success && data.user) {
                // Store user data
                localStorage.setItem('mypc_user', data.user.email);
                localStorage.setItem('mypc_user_data', JSON.stringify(data.user));
                window.CURRENT_USER = data.user;

                // Hide any warnings
                const lockoutWarning = document.getElementById('lockout-warning');
                const attemptsWarning = document.getElementById('attempts-warning');
                if (lockoutWarning) lockoutWarning.style.display = 'none';
                if (attemptsWarning) attemptsWarning.style.display = 'none';

                // Show success message
                alert('Login successful! Welcome back.');

                // Redirect based on role
                if (data.user.role === 'superadmin') {
                    window.router?.navigateTo('/superadmin');
                } else if (data.user.role === 'admin') {
                    window.router?.navigateTo('/admin');
                } else if (data.user.role === 'employee') {
                    window.router?.navigateTo('/employee');
                } else {
                    window.router?.navigateTo('/shop');
                }
            }
        } catch (error) {
            console.error('Login error:', error);
            
            // Check if response has lockout information
            if (error.response) {
                try {
                    const errorData = await error.response.json();
                    if (errorData.locked && typeof window.startUserLockoutTimer === 'function') {
                        window.startUserLockoutTimer(errorData.remaining_seconds);
                    } else if (errorData.failed_attempts > 0 && typeof window.showUserAttemptsWarning === 'function') {
                        window.showUserAttemptsWarning(errorData.failed_attempts);
                    }
                } catch (parseError) {
                    // Ignore parse errors
                }
            }
            
            document.getElementById('password-error').textContent = error.message || 'Invalid email or password';
        } finally {
            submitBtn.disabled = false;
            submitBtn.textContent = originalText;
        }
    });
}

// ========================================
// SIGNUP HANDLER
// ========================================

function initSignupPage() {
    const form = document.getElementById('signup-form');
    if (!form) return;

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        // Clear previous errors
        document.querySelectorAll('.error').forEach(el => el.textContent = '');

        const email = document.getElementById('email').value.trim();
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirm-password')?.value;
        const firstName = document.getElementById('first-name')?.value.trim();
        const lastName = document.getElementById('last-name')?.value.trim();
        const phone = document.getElementById('phone')?.value.trim() || '';

        // Validation
        let hasError = false;

        // 1. Validate First Name (No numbers or special characters)
        if (!firstName) {
            document.getElementById('first-name-error').textContent = 'First name is required';
            hasError = true;
        } else if (!/^[a-zA-Z\s]+$/.test(firstName)) {
            document.getElementById('first-name-error').textContent = 'First name must contain only letters';
            hasError = true;
        }

        // 2. Validate Last Name (No numbers or special characters)
        if (!lastName) {
            document.getElementById('last-name-error').textContent = 'Last name is required';
            hasError = true;
        } else if (!/^[a-zA-Z\s]+$/.test(lastName)) {
            document.getElementById('last-name-error').textContent = 'Last name must contain only letters';
            hasError = true;
        }

        // 3. Validate Email (Strict format)
        if (!email) {
            document.getElementById('email-error').textContent = 'Email is required';
            hasError = true;
        } else if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
            document.getElementById('email-error').textContent = 'Invalid email format';
            hasError = true;
        }

        // 4. Validate Phone (Must be exactly 11 digits)
        if (phone && !/^\d{11}$/.test(phone)) {
            document.getElementById('phone-error').textContent = 'Phone number must be exactly 11 digits';
            hasError = true;
        }

        // 5. Validate Password (Min 6 chars, 1 upper, 1 lower, 1 special)
        if (!password) {
            document.getElementById('password-error').textContent = 'Password is required';
            hasError = true;
        } else {
            if (password.length < 6) {
                document.getElementById('password-error').textContent = 'Password must be at least 6 characters';
                hasError = true;
            } else if (!/[A-Z]/.test(password)) {
                document.getElementById('password-error').textContent = 'Password must contain at least one uppercase letter';
                hasError = true;
            } else if (!/[a-z]/.test(password)) {
                document.getElementById('password-error').textContent = 'Password must contain at least one lowercase letter';
                hasError = true;
            } else if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
                document.getElementById('password-error').textContent = 'Password must contain at least one special character';
                hasError = true;
            }
        }

        // 6. Confirm Password
        if (confirmPassword !== undefined && password !== confirmPassword) {
            document.getElementById('confirm-password-error').textContent = 'Passwords do not match';
            hasError = true;
        }

        if (hasError) return;

        // Disable submit button
        const submitBtn = form.querySelector('button[type="submit"]');
        const originalText = submitBtn.textContent;
        submitBtn.disabled = true;
        submitBtn.textContent = 'Creating account...';

        try {
            const data = await AuthAPI.register(email, password, firstName, lastName, phone);

            if (data.success && data.user) {
                // Store user data
                localStorage.setItem('mypc_user', data.user.email);
                localStorage.setItem('mypc_user_data', JSON.stringify(data.user));
                window.CURRENT_USER = data.user;

                // Show success message
                alert('Account created successfully! Welcome to MyPC.');

                // Redirect to shop
                window.router?.navigateTo('/shop');
            }
        } catch (error) {
            console.error('Signup error:', error);
            document.getElementById('email-error').textContent = error.message || 'Registration failed. Please try again.';
        } finally {
            submitBtn.disabled = false;
            submitBtn.textContent = originalText;
        }
    });
}

// ========================================
// ADMIN LOGIN HANDLER
// ========================================

function initAdminLoginPage() {
    const form = document.getElementById('admin-login-form');
    if (!form) return;

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        // Clear previous errors
        document.querySelectorAll('.error').forEach(el => el.textContent = '');

        const email = document.getElementById('admin-email').value.trim();
        const password = document.getElementById('admin-password').value;

        // Basic validation
        if (!email || !password) {
            if (!email) document.getElementById('email-error').textContent = 'Email is required';
            if (!password) document.getElementById('password-error').textContent = 'Password is required';
            return;
        }

        // Disable submit button
        const submitBtn = document.getElementById('admin-login-btn');
        const originalText = submitBtn.innerHTML;
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<span style="display:inline-flex;align-items:center;gap:0.5rem;">Signing in...</span>';

        try {
            // Compute the correct API base path dynamically
            let apiBase = '/HTML_PHP';
            if (typeof window !== 'undefined' && window.router && window.router.baseRoot) {
                apiBase = window.router.baseRoot + '/HTML_PHP';
            } else if (typeof window !== 'undefined') {
                const pathname = window.location.pathname;
                const directory = pathname.substring(0, pathname.lastIndexOf('/'));
                apiBase = directory + '/HTML_PHP';
            }
            
            const response = await fetch(apiBase + '/admin_auth.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    action: 'adminLogin',
                    email: email,
                    password: password
                })
            });

            const data = await response.json();

            if (data.success && data.user) {
                // Store user data
                localStorage.setItem('mypc_user', data.user.email);
                localStorage.setItem('mypc_user_data', JSON.stringify(data.user));
                localStorage.setItem('mypc_admin_session', 'true');
                window.CURRENT_USER = data.user;

                // Hide any warnings
                document.getElementById('lockout-warning').style.display = 'none';
                document.getElementById('attempts-warning').style.display = 'none';

                // Show success message
                alert('Admin login successful! Welcome back.');

                // Redirect based on role
                if (data.user.role === 'superadmin') {
                    window.router?.navigateTo('/superadmin');
                } else if (data.user.role === 'admin') {
                    window.router?.navigateTo('/admin');
                }
            } else {
                // Handle failed login
                const errorMsg = data.error || 'Invalid email or password';
                document.getElementById('password-error').textContent = errorMsg;

                // Handle lockout
                if (data.locked) {
                    startLockoutTimer(data.remaining_seconds);
                } else if (data.failed_attempts > 0) {
                    showAttemptsWarning(data.failed_attempts);
                }
            }
        } catch (error) {
            console.error('Admin login error:', error);
            document.getElementById('password-error').textContent = 'Login failed. Please try again.';
        } finally {
            submitBtn.disabled = false;
            submitBtn.innerHTML = originalText;
        }
    });
}

// ========================================
// VISIBILITY TOGGLE
// ========================================

function togglePassword(fieldId) {
    const field = document.getElementById(fieldId);
    if (!field) return;

    // Find the SVG icon next to this field
    const container = field.parentElement;
    const svg = container.querySelector('svg');
    if (!svg) return;

    if (field.type === 'password') {
        field.type = 'text';
        // Change to eye-slash icon (password visible)
        svg.innerHTML = `
      <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
      <line x1="1" y1="1" x2="23" y2="23"></line>
    `;
    } else {
        field.type = 'password';
        // Change to eye icon (password hidden)
        svg.innerHTML = `
      <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
      <circle cx="12" cy="12" r="3"></circle>
    `;
    }
}

// ========================================
// AUTO-INITIALIZE
// ========================================

// Initialize based on which form is present
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        initLoginPage();
        initSignupPage();
        initAdminLoginPage();
    });
} else {
    initLoginPage();
    initSignupPage();
    initAdminLoginPage();
}

// Make functions globally available
window.togglePassword = togglePassword;
window.initLoginPage = initLoginPage;
window.initSignupPage = initSignupPage;
window.initAdminLoginPage = initAdminLoginPage;
