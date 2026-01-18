/**
 * Bootstrap script for MyPC application
 * Extracted from index.html to comply with CSP 'script-src' without 'unsafe-inline'
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
    
    // Dynamic loader: compute app root for both http(s) and file:// environments
    function loadApplicationScripts() {
        try {
            var baseRoot;
            if (window.location.protocol === 'file:') {
                // file:///C:/path/to/index.html -> base root is directory containing the file
                baseRoot = window.location.href.replace(/\/[^\/]*$/, '/');
            } else {
                baseRoot = window.location.origin;
            }
            
            // Load API helper first
            var apiScript = document.createElement('script');
            apiScript.src = 'JS/api.js';
            apiScript.defer = false;
            document.body.appendChild(apiScript);

            // Then load router
            var routerScript = document.createElement('script');
            routerScript.src = 'JS/router.js';
            routerScript.defer = false;
            document.body.appendChild(routerScript);
        } catch (e) {
            // fallback to relative path
            var fallbackScript = document.createElement('script');
            fallbackScript.src = 'JS/router.js';
            document.body.appendChild(fallbackScript);
        }
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
        loadApplicationScripts();
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
