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

        window.addEventListener('popstate', (e) => this.handleRouteChange(e));
        document.addEventListener('click', (e) => this.handleLinkClick(e));

    const originAvailable = window.location && window.location.origin && window.location.origin !== 'null';
    const originOrHref = originAvailable ? window.location.origin : window.location.href.replace(/\/[^\/]*$/, '');
    this.baseRoot = String(originOrHref).replace(/\/$/, '');
    this.init();
    }
    
    init() {
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
        
        const _currentPath = window.location.pathname === '/' ? '/' : window.location.pathname;
        if (link.classList && link.classList.contains('logo') && href === '/' && _currentPath !== '/') {
            e.preventDefault();
            return;
        }
        if (href && !href.startsWith('http') && !href.startsWith('#') && href.includes('/')) {
            e.preventDefault();
            const noUrl = link.hasAttribute('data-no-url');
            const currentPath = window.location.pathname === '/' ? '/' : window.location.pathname;
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
        
        if (pushState && path !== window.location.pathname) {
            window.history.pushState({ path }, '', path === '/' ? '/' : path);
        }
        
        this.loadPage(page);
    }
    
    loadPage(page) {
        const app = document.getElementById('app');
        
    fetch(this.baseRoot + `/PHP/${page}Page.html`)
            .then(response => {
                if (!response.ok) throw new Error(`Failed to load ${page}Page.html`);
                return response.text();
            })
            .then(html => {
                app.innerHTML = html;
                
                app.style.opacity = '1';
                app.style.transition = 'opacity 0.3s ease-out';
                
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
        document.querySelectorAll('script[data-page]').forEach(script => script.remove());
        
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
        
        setTimeout(() => {
            const transitionScript = document.createElement('script');
            transitionScript.src = this.baseRoot + '/JS/pageTransition.js?v=' + Date.now();
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
