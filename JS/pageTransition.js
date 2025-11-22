/* Smooth Page Transition Handler */

// Add page transition event listener to all internal navigation links
document.addEventListener('DOMContentLoaded', function() {
    // Get all navigation links (excluding external, anchor, and special links)
    const internalLinks = document.querySelectorAll('a[href*=".html"]');
    
    internalLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            
            // Only intercept internal HTML pages
            if (href && href.includes('.html') && !href.startsWith('http')) {
                e.preventDefault();
                
                // Add exit animation
                document.body.classList.add('page-exit');
                
                // After animation completes, navigate
                setTimeout(() => {
                    window.location.href = href;
                }, 300); // Match CSS animation duration
            }
        });
    });
    
    // Add entrance animation when page loads
    document.body.classList.add('page-enter');
    
    // Smooth scroll behavior for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href !== '#') {
                e.preventDefault();
                const element = document.querySelector(href);
                if (element) {
                    element.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            }
        });
    });
});
