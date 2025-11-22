<?php
require_once 'db_config.php';
session_start();

$conn = getDBConnection();
$method = $_SERVER['REQUEST_METHOD'];

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'error' => 'Not authenticated']);
    exit();
}

$user_id = $_SESSION['user_id'];

// Get user's cart
if ($method === 'GET') {
    $sql = "SELECT c.*, p.name, p.price, p.image_url, p.stock_quantity 
            FROM cart_items c 
            JOIN products p ON c.product_id = p.id 
            WHERE c.user_id = $user_id";
    
    $result = $conn->query($sql);
    $items = [];
    
    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }
    
    echo json_encode(['success' => true, 'cart' => $items]);
}

// Add item to cart
elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'add') {
    $product_id = (int)$_POST['product_id'];
    $quantity = (int)$_POST['quantity'];
    
    // Check if item already in cart
    $check = $conn->query("SELECT id, quantity FROM cart_items WHERE user_id = $user_id AND product_id = $product_id");
    
    if ($check->num_rows > 0) {
        // Update quantity
        $row = $check->fetch_assoc();
        $new_quantity = $row['quantity'] + $quantity;
        $conn->query("UPDATE cart_items SET quantity = $new_quantity WHERE id = {$row['id']}");
    } else {
        // Insert new item
        $conn->query("INSERT INTO cart_items (user_id, product_id, quantity, added_at) VALUES ($user_id, $product_id, $quantity, NOW())");
    }
    
    echo json_encode(['success' => true]);
}

// Update cart item quantity
elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'update') {
    $cart_item_id = (int)$_POST['cart_item_id'];
    $quantity = (int)$_POST['quantity'];
    
    if ($quantity > 0) {
        $conn->query("UPDATE cart_items SET quantity = $quantity WHERE id = $cart_item_id AND user_id = $user_id");
    } else {
        $conn->query("DELETE FROM cart_items WHERE id = $cart_item_id AND user_id = $user_id");
    }
    
    echo json_encode(['success' => true]);
}

// Remove item from cart
elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'remove') {
    $cart_item_id = (int)$_POST['cart_item_id'];
    $conn->query("DELETE FROM cart_items WHERE id = $cart_item_id AND user_id = $user_id");
    echo json_encode(['success' => true]);
}

// Clear cart
elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'clear') {
    $conn->query("DELETE FROM cart_items WHERE user_id = $user_id");
    echo json_encode(['success' => true]);
}

$conn->close();
?>
