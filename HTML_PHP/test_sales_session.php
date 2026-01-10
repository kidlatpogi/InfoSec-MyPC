<?php
/**
 * Test Sales Session - Debug session issues
 */

header('Content-Type: text/html; charset=UTF-8');

// Secure session configuration (must match auth.php)
ini_set('session.cookie_httponly', 1);
ini_set('session.cookie_secure', 0);
ini_set('session.cookie_samesite', 'Strict');
ini_set('session.use_only_cookies', 1);

session_start();

?>
<!DOCTYPE html>
<html>
<head>
    <title>Session Debug</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .info { background: #f0f0f0; padding: 10px; margin: 10px 0; border-radius: 5px; }
        .success { background: #d4edda; color: #155724; }
        .error { background: #f8d7da; color: #721c24; }
        pre { background: #333; color: #0f0; padding: 10px; overflow-x: auto; }
    </style>
</head>
<body>
    <h1>Session Debug</h1>
    
    <div class="info">
        <h3>Session Info</h3>
        <p><strong>Session ID:</strong> <?= session_id() ?></p>
        <p><strong>Session Name:</strong> <?= session_name() ?></p>
    </div>
    
    <div class="info <?= isset($_SESSION['user_id']) ? 'success' : 'error' ?>">
        <h3>Authentication Status</h3>
        <?php if (isset($_SESSION['user_id'])): ?>
            <p>✅ <strong>Logged In!</strong></p>
            <p><strong>User ID:</strong> <?= htmlspecialchars($_SESSION['user_id']) ?></p>
            <p><strong>Role:</strong> <?= htmlspecialchars($_SESSION['user_role'] ?? 'unknown') ?></p>
            <p><strong>Email:</strong> <?= htmlspecialchars($_SESSION['user_email'] ?? 'unknown') ?></p>
        <?php else: ?>
            <p>❌ <strong>NOT Logged In</strong></p>
            <p>Session user_id is not set. You need to log in first.</p>
            <hr>
            <h4>Quick Login Test</h4>
            <form id="loginForm">
                <input type="email" id="email" placeholder="Email" style="padding: 8px; width: 200px;"><br><br>
                <input type="password" id="password" placeholder="Password" style="padding: 8px; width: 200px;"><br><br>
                <button type="submit" style="padding: 8px 16px;">Login</button>
            </form>
            <div id="loginResult"></div>
            <script>
            document.getElementById('loginForm').addEventListener('submit', async (e) => {
                e.preventDefault();
                const email = document.getElementById('email').value;
                const password = document.getElementById('password').value;
                const resultDiv = document.getElementById('loginResult');
                
                try {
                    const response = await fetch('/HTML_PHP/auth.php', {
                        method: 'POST',
                        credentials: 'include',
                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                        body: `action=login&email=${encodeURIComponent(email)}&password=${encodeURIComponent(password)}`
                    });
                    const data = await response.json();
                    resultDiv.innerHTML = `<pre>${JSON.stringify(data, null, 2)}</pre>`;
                    if (data.success) {
                        resultDiv.innerHTML += '<p style="color:green;">✅ Login successful! Refresh this page.</p>';
                    }
                } catch (error) {
                    resultDiv.innerHTML = `<p style="color:red;">Error: ${error.message}</p>`;
                }
            });
            </script>
        <?php endif; ?>
    </div>
    
    <div class="info">
        <h3>Cookies Received</h3>
        <pre><?php print_r($_COOKIE); ?></pre>
    </div>
    
    <div class="info">
        <h3>Full Session Data</h3>
        <pre><?php print_r($_SESSION); ?></pre>
    </div>
    
    <div class="info">
        <h3>Test Sales Analytics API</h3>
        <p>Click the button to test the API call from JavaScript:</p>
        <button onclick="testAPI()">Test API</button>
        <div id="result"></div>
    </div>
    
    <script>
    async function testAPI() {
        const resultDiv = document.getElementById('result');
        resultDiv.innerHTML = '<p>Loading...</p>';
        
        try {
            const response = await fetch('/HTML_PHP/sales_analytics.php?year=2026', {
                credentials: 'include'
            });
            
            resultDiv.innerHTML = `<p>Status: ${response.status} ${response.statusText}</p>`;
            
            const text = await response.text();
            resultDiv.innerHTML += `<pre>${text}</pre>`;
            
        } catch (error) {
            resultDiv.innerHTML = `<p style="color: red;">Error: ${error.message}</p>`;
        }
    }
    </script>
    
    <div class="info">
        <h3>Session Configuration</h3>
        <pre><?php
        echo "session.cookie_httponly: " . ini_get('session.cookie_httponly') . "\n";
        echo "session.cookie_secure: " . ini_get('session.cookie_secure') . "\n";
        echo "session.cookie_samesite: " . ini_get('session.cookie_samesite') . "\n";
        echo "session.use_only_cookies: " . ini_get('session.use_only_cookies') . "\n";
        echo "session.save_path: " . session_save_path() . "\n";
        ?></pre>
    </div>
</body>
</html>
