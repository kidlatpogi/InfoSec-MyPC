<?php
/**
 * Direct Cart Test - Check if cart.php is working
 */
session_start();

// Simulate logged in user (use a real user ID from your database)
$_SESSION['user_id'] = 3; // Change this to a valid customer user ID

echo "Session user_id: " . ($_SESSION['user_id'] ?? 'NOT SET') . "<br>";
echo "Testing cart.php directly...<br><br>";

// Simulate POST request
$_POST['action'] = 'add';
$_POST['product_id'] = 1;  // Change to valid product ID
$_POST['variant_id'] = 1;  // Change to valid variant ID
$_POST['quantity'] = 1;

echo "POST data:<br>";
echo "- action: " . $_POST['action'] . "<br>";
echo "- product_id: " . $_POST['product_id'] . "<br>";
echo "- variant_id: " . $_POST['variant_id'] . "<br>";
echo "- quantity: " . $_POST['quantity'] . "<br><br>";

$_SERVER['REQUEST_METHOD'] = 'POST';

// Include the cart API
ob_start();
include 'cart.php';
$output = ob_get_clean();

echo "Cart API Output:<br>";
echo "<pre>" . htmlspecialchars($output) . "</pre>";
?>
