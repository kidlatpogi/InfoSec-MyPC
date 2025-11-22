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

// Create new order
if ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'create') {
    $address_id = (int)$_POST['address_id'];
    $payment_method = $conn->real_escape_string($_POST['payment_method']);
    
    // Get cart items
    $cart = $conn->query("SELECT product_id, quantity FROM cart_items WHERE user_id = $user_id");
    
    if ($cart->num_rows === 0) {
        echo json_encode(['success' => false, 'error' => 'Cart is empty']);
        exit();
    }
    
    // Calculate total
    $total = 0;
    $cart_items = [];
    while ($item = $cart->fetch_assoc()) {
        $cart_items[] = $item;
        $product = $conn->query("SELECT price FROM products WHERE id = {$item['product_id']}")->fetch_assoc();
        $total += $product['price'] * $item['quantity'];
    }
    
    // Create order
    $conn->query("INSERT INTO orders (user_id, total_amount, status, payment_method, shipping_address_id, created_at) 
                  VALUES ($user_id, $total, 'pending', '$payment_method', $address_id, NOW())");
    
    $order_id = $conn->insert_id;
    
    // Create order items
    foreach ($cart_items as $item) {
        $product = $conn->query("SELECT price FROM products WHERE id = {$item['product_id']}")->fetch_assoc();
        $price = $product['price'];
        $quantity = $item['quantity'];
        
        $conn->query("INSERT INTO order_items (order_id, product_id, quantity, price_at_time) 
                      VALUES ($order_id, {$item['product_id']}, $quantity, $price)");
        
        // Update stock
        $conn->query("UPDATE products SET stock_quantity = stock_quantity - $quantity WHERE id = {$item['product_id']}");
    }
    
    // Clear cart
    $conn->query("DELETE FROM cart_items WHERE user_id = $user_id");
    
    echo json_encode(['success' => true, 'order_id' => $order_id]);
}

// Get user's orders
elseif ($method === 'GET') {
    $sql = "SELECT * FROM orders WHERE user_id = $user_id ORDER BY created_at DESC";
    $result = $conn->query($sql);
    $orders = [];
    
    while ($row = $result->fetch_assoc()) {
        $order_id = $row['id'];
        
        // Get order items
        $items = $conn->query("SELECT oi.*, p.name, p.image_url 
                               FROM order_items oi 
                               JOIN products p ON oi.product_id = p.id 
                               WHERE oi.order_id = $order_id");
        
        $row['items'] = [];
        while ($item = $items->fetch_assoc()) {
            $row['items'][] = $item;
        }
        
        $orders[] = $row;
    }
    
    echo json_encode(['success' => true, 'orders' => $orders]);
}

$conn->close();
?>
