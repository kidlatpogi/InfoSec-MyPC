<?php
require_once 'HTML_PHP/Database.php';

$db = Database::getInstance();

// Check if admin_accounts table exists
echo "=== Checking admin_accounts table ===\n";
$admins = $db->fetchAll("SELECT id, email, role, password_hash, is_active FROM admin_accounts");
echo "Total admins: " . count($admins) . "\n\n";

foreach ($admins as $admin) {
    echo "ID: " . $admin['id'] . "\n";
    echo "Email: " . $admin['email'] . "\n";
    echo "Role: " . $admin['role'] . "\n";
    echo "Active: " . $admin['is_active'] . "\n";
    echo "Password Hash: " . substr($admin['password_hash'], 0, 20) . "...\n";
    echo "---\n";
}

// Test password verification for superadmin@mypc.com
echo "\n=== Testing password verification ===\n";
$testEmail = 'superadmin@mypc.com';
$testPassword = '@dmin123';

$admin = $db->fetchOne("SELECT * FROM admin_accounts WHERE email = ?", [$testEmail]);
if ($admin) {
    echo "Admin found: " . $admin['email'] . "\n";
    echo "Password hash: " . $admin['password_hash'] . "\n";
    $verified = password_verify($testPassword, $admin['password_hash']);
    echo "Password verification result: " . ($verified ? 'TRUE' : 'FALSE') . "\n";
} else {
    echo "Admin not found with email: " . $testEmail . "\n";
}
?>
