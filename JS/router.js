/* Router - Handles all page navigation and clean URLs */

class Router {
    constructor() {
        this.currentPage = null;
        this.pages = {
            '/': 'landing',
            '/shop': 'home',
            '/login': 'login',
            '/signup': 'signup',
            '/checkout': 'checkout',
            '/profile': 'profile',
            '/admin': 'admin',
            '/employee': 'employee',
            '/superadmin': 'superadmin'
        };
        
        // Store original history state for back button
        window.addEventListener('popstate', (e) => this.handleRouteChange(e));
        
        // Intercept all link clicks
        document.addEventListener('click', (e) => this.handleLinkClick(e));
        
    // Compute base root to use for fetch and script URLs so app works on nested routes
    // and when opened via file:// (fallback to directory of the file)
    const originAvailable = window.location && window.location.origin && window.location.origin !== 'null';
    const originOrHref = originAvailable ? window.location.origin : window.location.href.replace(/\/[^\/]*$/, '');
    this.baseRoot = String(originOrHref).replace(/\/$/, '');
    // Handle initial route
    this.init();
    }
    
    init() {
        // NOTE: removed GitHub Pages 404 -> index redirect flow.
        // If you deploy to a host that doesn't rewrite unknown paths to index.html,
        // configure a rewrite (Vercel, Netlify) so direct /shop requests still serve
        // the SPA entry. This router will now avoid relying on sessionStorage redirects.
        
        // Remove trailing slash for clean URLs
        let path = window.location.pathname;
        if (path.endsWith('/index.html')) {
            path = path.replace('/index.html', '') || '/';
        }
        if (path !== '/' && path.endsWith('/')) {
            path = path.slice(0, -1);
        }
        
        this.route(path);
    }
    
    handleLinkClick(e) {
        const link = e.target.closest('a');
        if (!link) return;
        
        const href = link.getAttribute('href');
        
        // If clicking the logo, don't redirect away from current page UNLESS already on landing page
        const _currentPath = window.location.pathname === '/' ? '/' : window.location.pathname;
        if (link.classList && link.classList.contains('logo') && href === '/' && _currentPath !== '/') {
            e.preventDefault();
            return;
        }
        // Only handle internal navigation links
        if (href && !href.startsWith('http') && !href.startsWith('#') && href.includes('/')) {
            e.preventDefault();
            // If the link has data-no-url attribute, load the page but do NOT push/replace the URL
            const noUrl = link.hasAttribute('data-no-url');
            // If clicking the same page, reload the page content without server request
            const currentPath = window.location.pathname === '/' ? '/' : window.location.pathname;
            if (currentPath === href) {
                // Reload page content without making server request
                const page = this.pages[href] || 'landing';
                const app = document.getElementById('app');
                app.style.opacity = '0';
                app.style.transition = 'opacity 0.3s ease-out';
                setTimeout(() => {
                    this.loadPage(page);
                }, 300);
            } else {
                if (noUrl) {
                    // Load page content but don't change the visible URL or history
                    this.route(href, false);
                } else {
                    this.navigateTo(href);
                }
            }
        } else if (href && href.startsWith('#')) {
            // Handle anchor links with smooth scroll
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
        const path = e.state?.path || '/';
        this.route(path, false);
    }
    
    navigateTo(path) {
        // Add page exit animation
        const app = document.getElementById('app');
        app.style.opacity = '0';
        app.style.transition = 'opacity 0.3s ease-out';
        
        // After animation, load new page
        setTimeout(() => {
            this.route(path, true);
        }, 300);
    }
    
    route(path, pushState = true) {
        // Normalize path
        if (path.endsWith('/index.html')) {
            path = path.replace('/index.html', '') || '/';
        }
        
        // Support dynamic product routes: /product/:id
        let page = this.pages[path] || 'landing';
        // reset current product id
        window.CURRENT_PRODUCT_ID = null;
        const prodMatch = path.match(/^\/product\/([\w-]+)$/);
        if (prodMatch) {
            page = 'product';
            window.CURRENT_PRODUCT_ID = prodMatch[1];
        }
        
        if (this.currentPage === page) return;
        
        this.currentPage = page;
        
        // Push state to history
        if (pushState && path !== window.location.pathname) {
            window.history.pushState({ path }, '', path === '/' ? '/' : path);
        }
        
        // Load and render page
        this.loadPage(page);
    }
    
    loadPage(page) {
        const app = document.getElementById('app');
        
    // Load HTML content from PHP folder (use baseRoot so fetch works on nested routes and file://)
    fetch(this.baseRoot + `/PHP/${page}Page.html`)
            .then(response => {
                if (!response.ok) throw new Error(`Failed to load ${page}Page.html`);
                return response.text();
            })
            .then(html => {
                // Pages are stored without body tags - just use the content directly
                app.innerHTML = html;
                
                // Add entrance animation
                app.style.opacity = '1';
                app.style.transition = 'opacity 0.3s ease-out';
                
                // Reload scripts specific to this page
                this.reloadPageScripts(page);
                
                // Update page title
                const title = {
                    'landing': 'MyPC - Premium PC Components Store',
                    'home': 'Shop - MyPC Components Store',
                    'login': 'Login - MyPC',
                    'signup': 'Sign Up - MyPC',
                    'checkout': 'Checkout - MyPC',
                    'profile': 'My Profile - MyPC',
                    'admin': 'Admin Dashboard - MyPC',
                    'employee': 'Employee Dashboard - MyPC',
                    'superadmin': 'Superadmin Dashboard - MyPC',
                    'product': 'Product - MyPC'
                };
                document.title = title[page] || 'MyPC';
            })
            .catch(error => {
                console.error('Router Error:', error);
                app.innerHTML = '<div style="padding: 2rem; text-align: center;"><h1>Page not found</h1><p>Sorry, the page you requested could not be found.</p></div>';
            });
    }
    
    reloadPageScripts(page) {
        // Remove old scripts except router
        document.querySelectorAll('script[data-page]').forEach(script => script.remove());
        
        // Always load script.js first for all pages (it handles user session and auth nav)
    const script = document.createElement('script');
    // Use baseRoot so scripts resolve correctly when on nested routes or file://
    script.src = this.baseRoot + '/JS/script.js?v=' + Date.now();
        script.dataset.page = page;
        script.defer = false;
        script.onload = () => {
            // Call initialization after script loads
            if (window.initializePageScript) {
                window.initializePageScript();
            }
            // Ensure updateAuthNav is called after initialization
            setTimeout(() => {
                if (window.updateAuthNav) {
                    window.updateAuthNav();
                }
            }, 50);
        };
        document.body.appendChild(script);
        
        // Reload page transition handler after a small delay to ensure DOM is ready
        setTimeout(() => {
            const transitionScript = document.createElement('script');
            transitionScript.src = this.baseRoot + '/JS/pageTransition.js?v=' + Date.now();
            transitionScript.dataset.page = page;
            transitionScript.defer = false;
            document.body.appendChild(transitionScript);
        }, 100);
    }
}

// Initialize router when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        window.router = new Router();
    });
} else {
    window.router = new Router();
}
