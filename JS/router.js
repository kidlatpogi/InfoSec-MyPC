class Router {
  constructor() {
    this.currentPage = null;
    this.isProtectedPage = false; // Track if current page is protected
    this.pages = {
      '/': 'landing',
      '/shop': 'home',
      '/login': 'login',
      '/admin-login': 'adminLogin',
      '/signup': 'signup',
      '/checkout': 'checkout',
      '/profile': 'profile',
      '/admin': 'admin',
      '/employee': 'employee',
      '/superadmin': 'superadmin',
    };

    window.addEventListener('popstate', (e) => this.handleRouteChange(e));
    document.addEventListener('click', (e) => this.handleLinkClick(e));

    // Set base root to the InfoSec-MyPC subdirectory
    // This is hardcoded to ensure correct paths even when internal rewrites change window.location
    this.baseRoot = window.location.origin + '/InfoSec-MyPC';
    
    this.init();
  }

  init() {
    let path = window.location.pathname;
    
    // Strip the base path (/InfoSec-MyPC) from the pathname
    if (path.startsWith('/InfoSec-MyPC')) {
      path = path.replace('/InfoSec-MyPC', '') || '/';
    }
    
    if (path.endsWith('/index.html')) {
      path = path.replace('/index.html', '') || '/';
    }
    if (path !== '/' && path.endsWith('/')) {
      path = path.slice(0, -1);
    }

    // Check if user is logged in and redirect to their dashboard
    const userData = localStorage.getItem('mypc_user_data');
    if (userData && (path === '/' || path === '/shop')) {
      try {
        const user = JSON.parse(userData);
        if (user.role === 'superadmin') {
          path = '/superadmin';
        } else if (user.role === 'admin') {
          path = '/admin';
        } else if (user.role === 'employee') {
          path = '/employee';
        }
      } catch (e) {
        console.error('Error parsing user data:', e);
      }
    }

    this.route(path);
  }

  handleLinkClick(e) {
    const link = e.target.closest('a');
    if (!link) return;

    const href = link.getAttribute('href');

    const _currentPath =
      window.location.pathname === '/' ? '/' : window.location.pathname;
    if (
      link.classList &&
      link.classList.contains('logo') &&
      href === '/' &&
      _currentPath !== '/'
    ) {
      e.preventDefault();
      return;
    }
    if (
      href &&
      !href.startsWith('http') &&
      !href.startsWith('#') &&
      href.includes('/')
    ) {
      e.preventDefault();
      const noUrl = link.hasAttribute('data-no-url');
      const currentPath =
        window.location.pathname === '/' ? '/' : window.location.pathname;
      if (currentPath === href) {
        const page = this.pages[href] || 'landing';
        const app = document.getElementById('app');
        app.style.opacity = '0';
        app.style.transition = 'opacity 0.3s ease-out';
        setTimeout(() => {
          this.loadPage(page);
        }, 300);
      } else {
        if (noUrl) {
          this.route(href, false);
        } else {
          this.navigateTo(href);
        }
      }
    } else if (href && href.startsWith('#')) {
      e.preventDefault();
      const elementId = href.slice(1);
      const element = document.getElementById(elementId);
      if (element) {
        setTimeout(() => {
          element.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }, 100);
      }
    }
  }

  handleRouteChange(e) {
    // If we were on a protected page, block navigation completely
    if (this.isProtectedPage && this.currentPage) {
      // Use history.go(1) to immediately move forward, canceling the back action
      window.history.go(1);
      return; // Don't navigate away
    }

    const path = e.state?.path || '/';
    this.route(path, false);
  }

  navigateTo(path) {
    const app = document.getElementById('app');
    app.style.opacity = '0';
    app.style.transition = 'opacity 0.3s ease-out';

    setTimeout(() => {
      this.route(path, true);
    }, 300);
  }

  route(path, pushState = true) {
    // Strip the base path (/InfoSec-MyPC) from the pathname
    if (path.startsWith('/InfoSec-MyPC')) {
      path = path.replace('/InfoSec-MyPC', '') || '/';
    }
    
    if (path.endsWith('/index.html')) {
      path = path.replace('/index.html', '') || '/';
    }

    let page = this.pages[path] || 'landing';
    window.CURRENT_PRODUCT_ID = null;
    const prodMatch = path.match(/^\/product\/([\w-]+)$/);
    if (prodMatch) {
      page = 'product';
      window.CURRENT_PRODUCT_ID = prodMatch[1];
    }

    if (this.currentPage === page) return;

    this.currentPage = page;

    // Track if we're navigating to a protected page
    this.isProtectedPage = ['admin', 'employee', 'superadmin'].includes(page);

    // For protected pages, replace history and push extra entry to block back button
    if (pushState && path !== window.location.pathname) {
      if (this.isProtectedPage) {
        // Replace current history entry
        window.history.replaceState({ path }, '', path === '/' ? '/' : path);
        // Push the same page again to create a barrier
        window.history.pushState({ path }, '', path === '/' ? '/' : path);
      } else {
        window.history.pushState({ path }, '', path === '/' ? '/' : path);
      }
    }

    this.loadPage(page);
  }

  loadPage(page) {
    const app = document.getElementById('app');

    fetch(this.baseRoot + `/HTML_PHP/${page}Page.html`)
      .then((response) => {
        if (!response.ok) throw new Error(`Failed to load ${page}Page.html`);
        return response.text();
      })
      .then((html) => {
        app.innerHTML = html;

        app.style.opacity = '1';
        app.style.transition = 'opacity 0.3s ease-out';

        this.reloadPageScripts(page);

        // Update page title
        const title = {
          landing: 'MyPC - Premium PC Components Store',
          home: 'Shop - MyPC Components Store',
          login: 'Login - MyPC',
          signup: 'Sign Up - MyPC',
          checkout: 'Checkout - MyPC',
          profile: 'My Profile - MyPC',
          admin: 'Admin Dashboard - MyPC',
          employee: 'Employee Dashboard - MyPC',
          superadmin: 'Superadmin Dashboard - MyPC',
          adminLogin: 'Admin Login - MyPC',
          product: 'Product - MyPC',
        };
        document.title = title[page] || 'MyPC';
      })
      .catch((error) => {
        console.error('Router Error:', error);
        app.innerHTML =
          '<div style="padding: 2rem; text-align: center;"><h1>Page not found</h1><p>Sorry, the page you requested could not be found.</p></div>';
      });
  }

  reloadPageScripts(page) {
    document
      .querySelectorAll('script[data-page]')
      .forEach((script) => script.remove());

    const script = document.createElement('script');
    script.src = this.baseRoot + '/JS/script.js?v=' + Date.now();
    script.dataset.page = page;
    script.defer = false;
    script.onload = () => {
      if (window.initializePageScript) {
        window.initializePageScript();
      }
      setTimeout(() => {
        if (window.updateAuthNav) {
          window.updateAuthNav();
        }
      }, 50);
    };
    document.body.appendChild(script);

    // Load auth script for login/signup pages
    if (page === 'login' || page === 'signup' || page === 'adminLogin') {
      setTimeout(() => {
        const authScript = document.createElement('script');
        authScript.src = this.baseRoot + '/JS/auth.js?v=' + Date.now();
        authScript.dataset.page = page;
        authScript.defer = false;
        document.body.appendChild(authScript);
      }, 100);
    }

    // Load profile script for profile page
    if (page === 'profile') {
      setTimeout(() => {
        const profileScript = document.createElement('script');
        profileScript.src = this.baseRoot + '/JS/profile.js?v=' + Date.now();
        profileScript.dataset.page = page;
        profileScript.defer = false;
        profileScript.onload = () => {
          if (window.initProfilePage) {
            window.initProfilePage();
          }
        };
        document.body.appendChild(profileScript);
      }, 100);
    }

    // Load checkout script for checkout page
    if (page === 'checkout') {
      setTimeout(() => {
        const checkoutScript = document.createElement('script');
        checkoutScript.src = this.baseRoot + '/JS/checkout.js?v=' + Date.now();
        checkoutScript.dataset.page = page;
        checkoutScript.defer = false;
        checkoutScript.onload = () => {
          if (window.initCheckoutPage) {
            window.initCheckoutPage();
          }
        };
        document.body.appendChild(checkoutScript);
      }, 100);
    }

    // Load admin script for admin page
    if (page === 'admin') {
      setTimeout(() => {
        const adminScript = document.createElement('script');
        adminScript.src = this.baseRoot + '/JS/admin.js?v=' + Date.now();
        adminScript.dataset.page = page;
        adminScript.defer = false;
        adminScript.onload = () => {
          if (window.initAdminPage) {
            window.initAdminPage();
          }
        };
        document.body.appendChild(adminScript);
      }, 100);
    }

    // Load employee script for employee page
    if (page === 'employee') {
      setTimeout(() => {
        const employeeScript = document.createElement('script');
        employeeScript.src = this.baseRoot + '/JS/employee.js?v=' + Date.now();
        employeeScript.dataset.page = page;
        employeeScript.defer = false;
        employeeScript.onload = () => {
          if (window.initEmployeePage) {
            window.initEmployeePage();
          }
        };
        document.body.appendChild(employeeScript);
      }, 100);
    }

    // Load superadmin script for superadmin page
    if (page === 'superadmin') {
      setTimeout(() => {
        const superadminScript = document.createElement('script');
        superadminScript.src =
          this.baseRoot + '/JS/superadmin.js?v=' + Date.now();
        superadminScript.dataset.page = page;
        superadminScript.defer = false;
        superadminScript.onload = () => {
          if (window.initSuperadminPage) {
            window.initSuperadminPage();
          }
        };
        document.body.appendChild(superadminScript);
      }, 100);
    }

    setTimeout(() => {
      const transitionScript = document.createElement('script');
      transitionScript.src =
        this.baseRoot + '/JS/pageTransition.js?v=' + Date.now();
      transitionScript.dataset.page = page;
      transitionScript.defer = false;
      document.body.appendChild(transitionScript);
    }, 100);
  }
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', () => {
    window.router = new Router();
  });
} else {
  window.router = new Router();
}
