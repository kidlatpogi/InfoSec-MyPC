<?php
require_once 'HTML_PHP/db_config.php';

$db = getDB();

// Check if the users table has the first_name and last_name columns
$users = $db->fetchAll("SELECT id, email, first_name, last_name, role FROM users LIMIT 5");

echo "✓ Database migration verified!\n\n";
echo "Sample users:\n";
foreach ($users as $user) {
    echo "ID: {$user['id']}, Email: {$user['email']}, Name: {$user['first_name']} {$user['last_name']}, Role: {$user['role']}\n";
}
?>
