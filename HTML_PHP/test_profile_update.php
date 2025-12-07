<?php
/**
 * Test Profile Update
 */

require_once 'db_config.php';
session_start();

echo "<h2>Profile Update Test</h2>";

// Check session
echo "<h3>Session Check:</h3>";
echo "Session ID: " . session_id() . "<br>";
echo "User ID in session: " . (isset($_SESSION['user_id']) ? $_SESSION['user_id'] : 'NOT SET') . "<br>";
echo "Session data: <pre>" . print_r($_SESSION, true) . "</pre>";

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo "<p style='color:red;'>ERROR: Not logged in. Please login first.</p>";
    exit;
}

$db = getDB();
$user_id = $_SESSION['user_id'];

// Get current user data
echo "<h3>Current User Data:</h3>";
$user = $db->fetchOne("SELECT * FROM users WHERE id = ?", [$user_id]);
echo "<pre>" . print_r($user, true) . "</pre>";

// Test update with minimal data
echo "<h3>Testing Update:</h3>";

try {
    $first_name = "Test";
    $last_name = "User";
    $phone = "1234567890";
    
    $updates = [];
    $params = [];
    
    $updates[] = 'first_name = ?';
    $params[] = $first_name;
    
    $updates[] = 'last_name = ?';
    $params[] = $last_name;
    
    $updates[] = 'phone = ?';
    $params[] = $phone;
    
    $params[] = $user_id;
    
    $query = "UPDATE users SET " . implode(', ', $updates) . " WHERE id = ?";
    
    echo "Query: " . $query . "<br>";
    echo "Params: <pre>" . print_r($params, true) . "</pre>";
    
    $result = $db->query($query, $params);
    echo "<p style='color:green;'>✓ Update successful!</p>";
    
    // Fetch updated data
    $updated = $db->fetchOne("SELECT * FROM users WHERE id = ?", [$user_id]);
    echo "<h3>Updated User Data:</h3>";
    echo "<pre>" . print_r($updated, true) . "</pre>";
    
} catch (Exception $e) {
    echo "<p style='color:red;'>ERROR: " . $e->getMessage() . "</p>";
    echo "<pre>" . $e->getTraceAsString() . "</pre>";
}
?>
