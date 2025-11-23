<?php
/**
 * Orders API
 * Handles order creation and retrieval with transaction support
 */

require_once 'db_config.php';
session_start();

$db = getDB();
$method = $_SERVER['REQUEST_METHOD'];

// Check authentication
if (!isset($_SESSION['user_id'])) {
    sendError('Not authenticated', 401);
}

$user_id = $_SESSION['user_id'];

try {
    // Create new order from cart
    if ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'create') {
        $address_id = isset($_POST['address_id']) ? intval($_POST['address_id']) : 0;
        $payment_method = isset($_POST['payment_method']) ? sanitizeInput($_POST['payment_method']) : 'cod';
        $notes = isset($_POST['notes']) ? sanitizeInput($_POST['notes']) : null;
        
        // Validate payment method
        $valid_methods = ['cod', 'card', 'gcash', 'paymaya', 'bank_transfer'];
        if (!in_array($payment_method, $valid_methods)) {
            sendError('Invalid payment method');
        }
        
        // Get user info
        $user = $db->fetchOne(
            "SELECT email, CONCAT(first_name, ' ', last_name) as name, phone FROM users WHERE id = ?",
            [$user_id]
        );
        
        if (!$user) {
            sendError('User not found', 404);
        }
        
        // Get address if provided
        $shipping_address_text = '';
        if ($address_id > 0) {
            $address = $db->fetchOne(
                "SELECT * FROM addresses WHERE id = ? AND user_id = ?",
                [$address_id, $user_id]
            );
            
            if ($address) {
                $shipping_address_text = $address['address_line1'] . 
                    ($address['address_line2'] ? ', ' . $address['address_line2'] : '') . 
                    ', ' . $address['city'] . ' ' . $address['postal_code'];
            }
        }
        
        // Get cart
        $cart = $db->fetchOne("SELECT id FROM carts WHERE user_id = ?", [$user_id]);
        
        if (!$cart) {
            sendError('Cart not found', 404);
        }
        
        $cart_id = $cart['id'];
        
        // Get cart items
        $cart_items = $db->fetchAll(
            "SELECT ci.product_id, ci.variant_id, ci.quantity,
                    p.name, p.base_price, p.stock_quantity, p.sku,
                    pv.label as variant_label, pv.price_adjustment, pv.stock_quantity as variant_stock
             FROM cart_items ci
             JOIN products p ON ci.product_id = p.id
             LEFT JOIN product_variants pv ON ci.variant_id = pv.id
             WHERE ci.cart_id = ?",
            [$cart_id]
        );
        
        if (empty($cart_items)) {
            sendError('Cart is empty');
        }
        
        // Start transaction
        $db->beginTransaction();
        
        try {
            // Calculate totals and validate stock
            $subtotal = 0;
            foreach ($cart_items as $item) {
                $unit_price = $item['base_price'] + ($item['price_adjustment'] ?? 0);
                $line_total = $unit_price * $item['quantity'];
                $subtotal += $line_total;
                
                // Check stock availability
                $available_stock = $item['variant_id'] ? $item['variant_stock'] : $item['stock_quantity'];
                if ($item['quantity'] > $available_stock) {
                    throw new Exception("Insufficient stock for {$item['name']}");
                }
            }
            
            // Calculate shipping (simple flat rate for now)
            $shipping_fee = $subtotal > 5000 ? 0 : 150;
            $total = $subtotal + $shipping_fee;
            
            // Generate order number
            $order_number = 'ORD-' . date('Ymd') . '-' . strtoupper(substr(uniqid(), -6));
            
            // Create order
            $order_id = $db->insert(
                "INSERT INTO orders (
                    order_number, user_id, address_id, customer_email, customer_name, customer_phone,
                    shipping_address, status, payment_method, payment_status,
                    subtotal, shipping_fee, total, notes, created_at
                ) VALUES (?, ?, ?, ?, ?, ?, ?, 'pending', ?, 'pending', ?, ?, ?, ?, NOW())",
                [
                    $order_number, $user_id, $address_id > 0 ? $address_id : null,
                    $user['email'], $user['name'], $user['phone'],
                    $shipping_address_text, $payment_method,
                    $subtotal, $shipping_fee, $total, $notes
                ]
            );
            
            // Create order items and update stock
            foreach ($cart_items as $item) {
                $unit_price = $item['base_price'] + ($item['price_adjustment'] ?? 0);
                $line_total = $unit_price * $item['quantity'];
                
                // Insert order item
                $db->insert(
                    "INSERT INTO order_items (
                        order_id, product_id, product_name, variant_label, sku,
                        unit_price, quantity, line_total, created_at
                    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())",
                    [
                        $order_id, $item['product_id'], $item['name'],
                        $item['variant_label'], $item['sku'],
                        $unit_price, $item['quantity'], $line_total
                    ]
                );
                
                // Update stock
                if ($item['variant_id']) {
                    $db->query(
                        "UPDATE product_variants SET stock_quantity = stock_quantity - ? WHERE id = ?",
                        [$item['quantity'], $item['variant_id']]
                    );
                } else {
                    $db->query(
                        "UPDATE products SET stock_quantity = stock_quantity - ? WHERE id = ?",
                        [$item['quantity'], $item['product_id']]
                    );
                }
            }
            
            // Clear cart
            $db->query("DELETE FROM cart_items WHERE cart_id = ?", [$cart_id]);
            
            // Commit transaction
            $db->commit();
            
            sendSuccess([
                'order_id' => $order_id,
                'order_number' => $order_number,
                'total' => $total
            ], 'Order created successfully');
            
        } catch (Exception $e) {
            // Rollback on error
            $db->rollback();
            throw $e;
        }
    }
    
    // Get user's orders
    elseif ($method === 'GET' && !isset($_GET['id'])) {
        $orders = $db->fetchAll(
            "SELECT id, order_number, status, payment_status, payment_method,
                    subtotal, shipping_fee, total, created_at
             FROM orders
             WHERE user_id = ?
             ORDER BY created_at DESC",
            [$user_id]
        );
        
        // Get items for each order
        foreach ($orders as &$order) {
            $items = $db->fetchAll(
                "SELECT product_name, variant_label, sku, unit_price, quantity, line_total
                 FROM order_items
                 WHERE order_id = ?",
                [$order['id']]
            );
            $order['items'] = $items;
        }
        
        sendSuccess(['orders' => $orders]);
    }
    
    // Get single order details
    elseif ($method === 'GET' && isset($_GET['id'])) {
        $order_id = intval($_GET['id']);
        
        // Get order and verify ownership
        $order = $db->fetchOne(
            "SELECT * FROM orders WHERE id = ? AND user_id = ?",
            [$order_id, $user_id]
        );
        
        if (!$order) {
            sendError('Order not found', 404);
        }
        
        // Get order items
        $items = $db->fetchAll(
            "SELECT oi.*, p.image_url, p.slug
             FROM order_items oi
             LEFT JOIN products p ON oi.product_id = p.id
             WHERE oi.order_id = ?",
            [$order_id]
        );
        
        $order['items'] = $items;
        
        sendSuccess(['order' => $order]);
    }
    
    // Cancel order (only if pending)
    elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'cancel') {
        $order_id = isset($_POST['order_id']) ? intval($_POST['order_id']) : 0;
        
        if ($order_id <= 0) {
            sendError('Invalid order ID');
        }
        
        // Get order and verify ownership
        $order = $db->fetchOne(
            "SELECT id, status FROM orders WHERE id = ? AND user_id = ?",
            [$order_id, $user_id]
        );
        
        if (!$order) {
            sendError('Order not found', 404);
        }
        
        if ($order['status'] !== 'pending') {
            sendError('Only pending orders can be cancelled');
        }
        
        // Update order status
        $db->query(
            "UPDATE orders SET status = 'cancelled', updated_at = NOW() WHERE id = ?",
            [$order_id]
        );
        
        // TODO: Restore stock quantities
        
        sendSuccess([], 'Order cancelled successfully');
    }
    
    // Invalid action
    else {
        sendError('Invalid action', 400);
    }
    
} catch (Exception $e) {
    error_log("Orders API Error: " . $e->getMessage());
    sendError('An error occurred. Please try again later.', 500);
}
?>
