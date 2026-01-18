# Security Configuration Guide for XAMPP

This document explains the security fixes implemented to address OWASP ZAP vulnerabilities.

## Files Modified/Created

1. **`.htaccess`** - Apache-level security configuration
2. **`HTML_PHP/security_headers.php`** - PHP security headers class
3. **`HTML_PHP/db_config.php`** - Updated to use security headers
4. **`JS/bootstrap.js`** - Extracted inline scripts for CSP compliance
5. **`index.html`** - Stricter CSP without unsafe-inline for scripts

---

## XAMPP Server Configuration (Manual Steps Required)

### 1. Hide Apache Version (Server Header)

Edit `C:\xampp\apache\conf\httpd.conf`:

```apache
# Find and change (or add) these lines:
ServerTokens Prod
ServerSignature Off
```

### 2. Hide PHP Version (X-Powered-By)

Edit `C:\xampp\php\php.ini`:

```ini
; Find this line and set to Off:
expose_php = Off
```

### 3. Enable Required Apache Modules

Ensure these modules are enabled in `httpd.conf`:

```apache
LoadModule headers_module modules/mod_headers.so
LoadModule rewrite_module modules/mod_rewrite.so
```

### 4. Restart Apache

After making changes, restart Apache from the XAMPP Control Panel.

---

## Vulnerability Fixes Summary

### ✅ Cloud Metadata Protection (HIGH)
- **Location**: `.htaccess`
- **Fix**: Rewrite rules block requests containing `169.254.169.254`, `metadata.google.internal`, and `metadata.azure.com` in URI, query strings, and headers.

### ✅ Content Security Policy (MEDIUM)
- **Location**: `.htaccess`, `index.html`, `security_headers.php`
- **Fix**: 
  - Strict CSP with `default-src 'self'` as fallback
  - No wildcard directives
  - `unsafe-inline` removed from `script-src` (inline scripts moved to `bootstrap.js`)
  - `frame-ancestors 'none'` prevents clickjacking

### ✅ CORS Misconfiguration (MEDIUM)
- **Location**: `.htaccess`, `security_headers.php`
- **Fix**:
  - Removed wildcard `*` for CORS
  - PHP validates origins against whitelist
  - Only allows `localhost` and `127.0.0.1` by default

### ✅ Anti-Clickjacking (MEDIUM)
- **Location**: `.htaccess`, `security_headers.php`, `index.html`
- **Fix**:
  - `X-Frame-Options: DENY` header set
  - CSP `frame-ancestors 'none'` directive

### ✅ Information Leakage (LOW)
- **Location**: `.htaccess`, `security_headers.php`, `php.ini` (manual)
- **Fix**:
  - `X-Powered-By` header removed
  - `Server` header minimized (requires `httpd.conf` change)
  - PHP `expose_php = Off`

### ✅ Missing Security Headers (LOW)
- **Location**: `.htaccess`, `security_headers.php`
- **Fix**:
  - `X-Content-Type-Options: nosniff`
  - `X-XSS-Protection: 1; mode=block`
  - `Referrer-Policy: strict-origin-when-cross-origin`
  - `Permissions-Policy` with restricted features

### ⚠️ HSTS (Strict-Transport-Security)
- **Location**: `.htaccess`, `security_headers.php`
- **Status**: COMMENTED OUT by default
- **Important**: Do NOT enable HSTS on localhost without valid SSL!
  - HSTS tells browsers to ONLY use HTTPS
  - On localhost without SSL, this will break your site
  - Enable only when:
    1. You have valid HTTPS configured
    2. You're deploying to production
  - To enable, uncomment the line in `.htaccess`:
    ```apache
    Header always set Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
    ```

### ✅ Cache Control (INFORMATIONAL)
- **Location**: `.htaccess`, `security_headers.php`
- **Fix**:
  - `Cache-Control: no-store, no-cache, must-revalidate, max-age=0`
  - `Pragma: no-cache`
  - `Expires: 0`
  - Static assets (CSS, JS, images) have separate caching rules

---

## How to Use security_headers.php

### For API Endpoints
```php
<?php
require_once 'security_headers.php';
SecurityHeaders::apply(['api' => true]);
// Your API code here
```

### For HTML Pages (served via PHP)
```php
<?php
require_once 'security_headers.php';
SecurityHeaders::apply();
// Your HTML output here
```

### With CSP Nonces (for inline scripts)
```php
<?php
require_once 'security_headers.php';
$nonce = SecurityHeaders::applyWithNonce();
?>
<!DOCTYPE html>
<html>
<head>
    <script nonce="<?php echo $nonce; ?>">
        // This inline script is now allowed
    </script>
</head>
```

### Customization Options
```php
SecurityHeaders::apply([
    'api' => true,           // Enable CORS headers
    'cache' => true,         // Allow caching (for non-sensitive pages)
    'frame' => 'SAMEORIGIN'  // Allow same-origin framing
]);
```

---

## Testing Your Security Configuration

### 1. Test with Browser Developer Tools
Open Network tab, inspect response headers to verify:
- No `X-Powered-By` header
- `X-Frame-Options` is present
- `Content-Security-Policy` is present
- `X-Content-Type-Options: nosniff` is present

### 2. Re-run OWASP ZAP
After implementing fixes and restarting Apache, run another scan to verify vulnerabilities are resolved.

### 3. Test CSP
Open browser console - CSP violations will appear as errors. If you see errors, adjust the CSP policy or move offending inline code to external files.

### 4. Online Security Header Checkers
- https://securityheaders.com
- https://observatory.mozilla.org

---

## Production Deployment Checklist

- [ ] Enable HSTS (uncomment in `.htaccess`)
- [ ] Update CORS allowed origins in `security_headers.php`
- [ ] Set `session.cookie_secure = 1` in `php.ini`
- [ ] Configure HTTPS with valid certificate
- [ ] Remove debug/development code
- [ ] Set appropriate `ServerTokens` in Apache config
