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
            "SELECT email, full_name as name, phone FROM users WHERE id = ?",
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
                $shipping_address_text = $address['line1'] .
                    ($address['line2'] ? ', ' . $address['line2'] : '') .
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
            "SELECT ci.variant_id, ci.quantity,
                    p.name, p.sku,
                    pv.title, pv.price, pv.stock
             FROM cart_items ci
             JOIN product_variants pv ON ci.variant_id = pv.id
             JOIN products p ON pv.product_id = p.id
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
                $line_total = $item['price'] * $item['quantity'];
                $subtotal += $line_total;

                // Check stock availability
                if ($item['quantity'] > $item['stock']) {
                    throw new Exception("Insufficient stock for {$item['name']}");
                }
            }

            // Calculate shipping (simple flat rate for now)
            $shipping_fee = $subtotal > 5000 ? 0 : 150;
            $tax = $subtotal * 0.12; // 12% VAT
            $total = $subtotal + $shipping_fee + $tax;

            // Create order
            $order_id = $db->insert(
                "INSERT INTO orders (
                    user_id, address_id, status, subtotal, shipping, tax, total, notes
                ) VALUES (?, ?, 'pending', ?, ?, ?, ?, ?)",
                [
                    $user_id,
                    $address_id > 0 ? $address_id : null,
                    $subtotal,
                    $shipping_fee,
                    $tax,
                    $total,
                    $notes
                ]
            );

            // Create order items and update stock
            foreach ($cart_items as $item) {
                $line_total = $item['price'] * $item['quantity'];

                // Insert order item
                $db->insert(
                    "INSERT INTO order_items (
                        order_id, variant_id, product_name, variant_title, unit_price, quantity, line_total
                    ) VALUES (?, ?, ?, ?, ?, ?, ?)",
                    [
                        $order_id,
                        $item['variant_id'],
                        $item['name'],
                        $item['title'],
                        $item['price'],
                        $item['quantity'],
                        $line_total
                    ]
                );

                // Update stock
                $db->query(
                    "UPDATE product_variants SET stock = stock - ? WHERE id = ?",
                    [$item['quantity'], $item['variant_id']]
                );
            }

            // Clear cart
            $db->query("DELETE FROM cart_items WHERE cart_id = ?", [$cart_id]);

            // Commit transaction
            $db->commit();

            sendSuccess([
                'order_id' => $order_id,
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
            "SELECT id, status, total, placed_at
             FROM orders
             WHERE user_id = ?
             ORDER BY placed_at DESC",
            [$user_id]
        );

        // Get items for each order
        foreach ($orders as &$order) {
            $items = $db->fetchAll(
                "SELECT product_name, variant_title, unit_price, quantity, line_total
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
            "SELECT oi.*, p.slug
             FROM order_items oi
             LEFT JOIN product_variants pv ON oi.variant_id = pv.id
             LEFT JOIN products p ON pv.product_id = p.id
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

        // Start transaction
        $db->beginTransaction();

        try {
            // Get order items to restore stock
            $order_items = $db->fetchAll(
                "SELECT oi.variant_id, oi.quantity FROM order_items oi WHERE oi.order_id = ?",
                [$order_id]
            );

            // Restore stock for each item
            foreach ($order_items as $item) {
                // Restore to variant stock
                $db->query(
                    "UPDATE product_variants SET stock = stock + ? WHERE id = ?",
                    [$item['quantity'], $item['variant_id']]
                );
            }

            // Update order status to cancelled
            $db->query(
                "UPDATE orders SET status = 'cancelled' WHERE id = ?",
                [$order_id]
            );

            // Commit transaction
            $db->commit();

            sendSuccess([], 'Order cancelled successfully and stock has been restored');
        } catch (Exception $e) {
            // Rollback on error
            $db->rollback();
            throw $e;
        }
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