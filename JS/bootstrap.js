/**
 * Bootstrap script for MyPC application
 * Extracted from index.html to comply with CSP 'script-src' without 'unsafe-inline'
 * Note: api.js and router.js are now loaded directly via script tags in index.html
 */

(function() {
    'use strict';
    
    // Set base URL dynamically
    function setBaseUrl() {
        const base = document.createElement('base');
        const path = window.location.pathname;
        const dir = path.substring(0, path.lastIndexOf('/') + 1);
        base.href = window.location.origin + dir;
        document.head.appendChild(base);
    }
    
    // Dev helper: ensure styles.css is reloaded during development by appending timestamp
    function bustStyleCache() {
        try {
            var links = document.querySelectorAll('link[rel="stylesheet"][href*="styles.css"]');
            links.forEach(function(link) {
                var href = link.getAttribute('href').split('?')[0];
                link.setAttribute('href', href + '?v=' + Date.now());
            });
        } catch (e) {
            // Silently fail if cache busting doesn't work
        }
    }
    
    // Initialize application
    function init() {
        setBaseUrl();
        // Scripts are now loaded directly via script tags in index.html
        // Uncomment for development style cache busting:
        // bustStyleCache();
    }
    
    // Run initialization
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
