<?php
// Test password verification
$password = '10101831B';
$hash = '$2y$10$uuWnh3P0BqIfEebgpPltRO5PAzU/2.9CdhNyP.yAvYmEEHwYWQUtDW';

echo "Testing password verification:\n";
echo "Password: {$password}\n";
echo "Hash: {$hash}\n\n";

if (password_verify($password, $hash)) {
    echo "✓ Password verification SUCCESSFUL\n";
} else {
    echo "✗ Password verification FAILED\n";
    echo "\nGenerating new hash...\n";
    $newHash = password_hash($password, PASSWORD_BCRYPT);
    echo "New hash: {$newHash}\n";
}
?>