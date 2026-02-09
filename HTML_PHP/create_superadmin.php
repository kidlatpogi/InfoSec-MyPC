<?php
/**
 * Create Superadmin Account - Direct PDO
 */

try {
    $pdo = new PDO('mysql:host=localhost;dbname=mypc_db;charset=utf8mb4', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $email = 'zeus@superadmin.com';
    $password = '10101831B';
    // Ref: Slide 89 — ARGON2ID preferred, BCRYPT cost 12 fallback
    if (defined('PASSWORD_ARGON2ID')) {
        $passwordHash = password_hash($password, PASSWORD_ARGON2ID, [
            'memory_cost' => 65536,
            'time_cost'   => 4,
            'threads'     => 2,
        ]);
    } else {
        $passwordHash = password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
    }

    echo "Creating superadmin account...\n";
    echo "Email: {$email}\n";
    echo "Password: {$password}\n\n";

    // Delete if exists
    $stmt = $pdo->prepare("DELETE FROM users WHERE email = ?");
    $stmt->execute([$email]);

    // Create superadmin
    $stmt = $pdo->prepare(
        "INSERT INTO users (email, password_hash, full_name, phone, is_admin) 
         VALUES (?, ?, ?, ?, 1)"
    );
    $stmt->execute([$email, $passwordHash, 'Zeus Superadmin', '09123456789']);

    echo "✓ Superadmin account created successfully!\n\n";

    // Verify
    $stmt = $pdo->prepare("SELECT email, is_admin, password_hash FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    echo "Verification:\n";
    echo "Email: {$user['email']}\n";
    echo "Is Admin: {$user['is_admin']}\n\n";

    // Test password
    if (password_verify($password, $user['password_hash'])) {
        echo "✓ Password verification SUCCESSFUL\n";
        echo "\nYou can now login with:\n";
        echo "Email: {$email}\n";
        echo "Password: {$password}\n";
    } else {
        echo "✗ Password verification FAILED\n";
    }

} catch (Exception $e) {
    echo "✗ Error: " . $e->getMessage() . "\n";
    exit(1);
}
?>