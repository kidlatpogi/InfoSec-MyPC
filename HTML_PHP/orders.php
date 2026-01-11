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
        
        // Get selected cart item IDs (if provided)
        $selected_items = [];
        if (isset($_POST['selected_items'])) {
            $selected_items = json_decode($_POST['selected_items'], true);
            if (!is_array($selected_items)) {
                $selected_items = [];
            }
        }

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

        // Get cart items - if selected_items provided, filter by those IDs
        $query = "SELECT ci.id as cart_item_id, ci.variant_id, ci.quantity,
                    p.name, p.sku,
                    pv.title, pv.price, pv.stock
             FROM cart_items ci
             JOIN product_variants pv ON ci.variant_id = pv.id
             JOIN products p ON pv.product_id = p.id
             WHERE ci.cart_id = ?";
        
        $params = [$cart_id];
        
        if (!empty($selected_items)) {
            $placeholders = implode(',', array_fill(0, count($selected_items), '?'));
            $query .= " AND ci.id IN ($placeholders)";
            $params = array_merge([$cart_id], $selected_items);
        }
        
        $cart_items = $db->fetchAll($query, $params);

        if (empty($cart_items)) {
            sendError('Cart is empty or no items selected');
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
                    user_id, address_id, status, subtotal, shipping, tax, total, notes, customer_name, customer_email, customer_phone, shipping_address
                ) VALUES (?, ?, 'pending', ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                [
                    $user_id,
                    $address_id > 0 ? $address_id : null,
                    $subtotal,
                    $shipping_fee,
                    $tax,
                    $total,
                    $notes,
                    $user['name'],
                    $user['email'],
                    $user['phone'],
                    $shipping_address_text
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

            // Clear cart - only remove the items that were ordered
            if (!empty($selected_items)) {
                // Remove only selected items
                $placeholders = implode(',', array_fill(0, count($selected_items), '?'));
                $db->query("DELETE FROM cart_items WHERE cart_id = ? AND id IN ($placeholders)", array_merge([$cart_id], $selected_items));
            } else {
                // Remove all items if no selection was made (backward compatibility)
                $db->query("DELETE FROM cart_items WHERE cart_id = ?", [$cart_id]);
            }

            // Commit transaction
            $db->commit();

            // Format order number
            $order_number = 'ORD-' . str_pad($order_id, 6, '0', STR_PAD_LEFT);

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

    // Get order status summary (count of each status)
    // NOTE: This must come BEFORE the general GET handler to avoid the statusSummary check being skipped
    elseif ($method === 'GET' && isset($_GET['action']) && $_GET['action'] === 'statusSummary') {
        // Get current user role
        $user = $db->fetchOne("SELECT role FROM users WHERE id = ?", [$user_id]);
        $role = $user['role'] ?? 'user';
        
        // Get year parameter if provided
        $year = isset($_GET['year']) ? intval($_GET['year']) : null;
        
        // Admins, superadmins, and employees can see all order statuses
        if (in_array($role, ['admin', 'superadmin', 'employee'])) {
            if ($year) {
                $statusCounts = $db->fetchAll(
                    "SELECT status, COUNT(*) as count
                     FROM orders
                     WHERE YEAR(placed_at) = ?
                     GROUP BY status",
                    [$year]
                );
            } else {
                $statusCounts = $db->fetchAll(
                    "SELECT status, COUNT(*) as count
                     FROM orders
                     GROUP BY status"
                );
            }
        } else {
            // Regular users only see count of their own orders
            if ($year) {
                $statusCounts = $db->fetchAll(
                    "SELECT status, COUNT(*) as count
                     FROM orders
                     WHERE user_id = ? AND YEAR(placed_at) = ?
                     GROUP BY status",
                    [$user_id, $year]
                );
            } else {
                $statusCounts = $db->fetchAll(
                    "SELECT status, COUNT(*) as count
                     FROM orders
                     WHERE user_id = ?
                     GROUP BY status",
                    [$user_id]
                );
            }
        }
        
        // Format response with all statuses
        $allStatuses = ['pending', 'processing', 'paid', 'shipped', 'completed', 'cancelled', 'refunded'];
        $summary = [];
        
        foreach ($allStatuses as $status) {
            $count = 0;
            foreach ($statusCounts as $row) {
                if ($row['status'] === $status) {
                    $count = $row['count'];
                    break;
                }
            }
            $summary[$status] = $count;
        }
        
        sendSuccess(['status_summary' => $summary]);
    }

    // Get user's orders (or all orders for admin/superadmin/employee)
    elseif ($method === 'GET' && !isset($_GET['action']) && !isset($_GET['id'])) {
        // Get current user role
        $user = $db->fetchOne("SELECT role FROM users WHERE id = ?", [$user_id]);
        $role = $user['role'] ?? 'user';
        
        // Admins, superadmins, and employees can see all orders
        if (in_array($role, ['admin', 'superadmin', 'employee'])) {
            $orders = $db->fetchAll(
                "SELECT id, status, total, subtotal, shipping, tax, placed_at as created_at,
                        customer_email, customer_name
                 FROM orders
                 ORDER BY placed_at DESC"
            );
        } else {
            // Regular users only see their own orders
            $orders = $db->fetchAll(
                "SELECT id, status, total, subtotal, shipping, tax, placed_at as created_at
                 FROM orders
                 WHERE user_id = ?
                 ORDER BY placed_at DESC",
                [$user_id]
            );
        }

        // Get items for each order and add order_number
        foreach ($orders as &$order) {
            $order['order_number'] = 'ORD-' . str_pad($order['id'], 6, '0', STR_PAD_LEFT);
            
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
        
        // Get current user role
        $user = $db->fetchOne("SELECT role FROM users WHERE id = ?", [$user_id]);
        $role = $user['role'] ?? 'user';

        // Get order (admins can view any order, users only their own)
        if (in_array($role, ['admin', 'superadmin', 'employee'])) {
            $order = $db->fetchOne(
                "SELECT o.* FROM orders o
                 WHERE o.id = ?",
                [$order_id]
            );
        } else {
            $order = $db->fetchOne(
                "SELECT * FROM orders WHERE id = ? AND user_id = ?",
                [$order_id, $user_id]
            );
        }

        if (!$order) {
            sendError('Order not found', 404);
        }

        // Get order items with product details and images
        $items = $db->fetchAll(
            "SELECT oi.*, p.slug, p.name as product_name_full, pv.title as variant_title_full,
                    pi.url as image_url
             FROM order_items oi
             LEFT JOIN product_variants pv ON oi.variant_id = pv.id
             LEFT JOIN products p ON pv.product_id = p.id
             LEFT JOIN product_images pi ON p.id = pi.product_id AND pi.`order` = 0
             WHERE oi.order_id = ?",
            [$order_id]
        );

        $order['items'] = $items;
        $order['order_number'] = 'ORD-' . str_pad($order['id'], 6, '0', STR_PAD_LEFT);

        sendSuccess(['order' => $order]);
    }
    
    // Update order status (admin only)
    elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'update_status') {
        // Check if user is admin/superadmin/employee
        $user = $db->fetchOne("SELECT role FROM users WHERE id = ?", [$user_id]);
        $role = $user['role'] ?? 'user';
        
        if (!in_array($role, ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized - Admin access required', 403);
        }
        
        $order_id = isset($_POST['order_id']) ? intval($_POST['order_id']) : 0;
        $new_status = isset($_POST['status']) ? sanitizeInput($_POST['status']) : '';
        
        if ($order_id <= 0) {
            sendError('Invalid order ID');
        }
        
        // Validate status (matches database enum: pending, processing, paid, shipped, completed, cancelled, refunded)
        $valid_statuses = ['pending', 'processing', 'paid', 'shipped', 'completed', 'cancelled', 'refunded'];
        if (!in_array($new_status, $valid_statuses)) {
            sendError('Invalid status');
        }
        
        // Get order
        $order = $db->fetchOne("SELECT id, status FROM orders WHERE id = ?", [$order_id]);
        
        if (!$order) {
            sendError('Order not found', 404);
        }
        
        // Update status
        $db->query(
            "UPDATE orders SET status = ? WHERE id = ?",
            [$new_status, $order_id]
        );
        
        sendSuccess([], 'Order status updated successfully');
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

    // Delete order (admin/superadmin/employee only)
    elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'delete') {
        // Check if user is admin/superadmin/employee
        $user = $db->fetchOne("SELECT role FROM users WHERE id = ?", [$user_id]);
        $role = $user['role'] ?? 'user';
        
        if (!in_array($role, ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized - Admin access required', 403);
        }
        
        $order_id = isset($_POST['order_id']) ? intval($_POST['order_id']) : 0;
        
        if ($order_id <= 0) {
            sendError('Invalid order ID');
        }
        
        // Get order
        $order = $db->fetchOne("SELECT id, status FROM orders WHERE id = ?", [$order_id]);
        
        if (!$order) {
            sendError('Order not found', 404);
        }
        
        // Start transaction
        $db->beginTransaction();
        
        try {
            // If order is not cancelled, restore stock first
            if ($order['status'] !== 'cancelled') {
                $order_items = $db->fetchAll(
                    "SELECT oi.variant_id, oi.quantity FROM order_items oi WHERE oi.order_id = ?",
                    [$order_id]
                );
                
                // Restore stock for each item
                foreach ($order_items as $item) {
                    $db->execute(
                        "UPDATE product_variants SET stock = stock + ? WHERE id = ?",
                        [$item['quantity'], $item['variant_id']]
                    );
                }
            }
            
            // Delete order items first (foreign key)
            $db->execute("DELETE FROM order_items WHERE order_id = ?", [$order_id]);
            
            // Delete the order
            $db->execute("DELETE FROM orders WHERE id = ?", [$order_id]);
            
            // Commit transaction
            $db->commit();
            
            sendSuccess([], 'Order deleted successfully');
        } catch (Exception $e) {
            // Rollback on error
            $db->rollback();
            throw $e;
        }
    }
    
    // Get sales analytics data
    elseif ($method === 'GET' && isset($_GET['action']) && $_GET['action'] === 'sales_analytics') {
        // Check if user is admin/superadmin
        $user = $db->fetchOne("SELECT role FROM users WHERE id = ?", [$user_id]);
        $role = $user['role'] ?? 'user';
        
        if (!in_array($role, ['admin', 'superadmin'])) {
            sendError('Unauthorized - Admin access required', 403);
        }
        
        $year = isset($_GET['year']) ? intval($_GET['year']) : date('Y');
        
        // Get monthly sales for the specified year
        $monthlySales = $db->fetchAll(
            "SELECT 
                MONTH(placed_at) as month,
                COUNT(*) as order_count,
                SUM(total) as total_sales,
                SUM(subtotal) as subtotal,
                SUM(tax) as total_tax,
                SUM(shipping) as total_shipping
             FROM orders 
             WHERE YEAR(placed_at) = ? 
               AND status NOT IN ('cancelled')
             GROUP BY MONTH(placed_at)
             ORDER BY MONTH(placed_at)",
            [$year]
        );
        
        // Get yearly sales summary (last 5 years)
        $yearlySales = $db->fetchAll(
            "SELECT 
                YEAR(placed_at) as year,
                COUNT(*) as order_count,
                SUM(total) as total_sales,
                SUM(subtotal) as subtotal,
                SUM(tax) as total_tax,
                SUM(shipping) as total_shipping
             FROM orders 
             WHERE status NOT IN ('cancelled')
             GROUP BY YEAR(placed_at)
             ORDER BY YEAR(placed_at) DESC
             LIMIT 5"
        );
        
        // Get today's sales
        $todaySales = $db->fetchOne(
            "SELECT 
                COUNT(*) as order_count,
                COALESCE(SUM(total), 0) as total_sales
             FROM orders 
             WHERE DATE(placed_at) = CURDATE() 
               AND status NOT IN ('cancelled')"
        );
        
        // Get this month's sales
        $thisMonthSales = $db->fetchOne(
            "SELECT 
                COUNT(*) as order_count,
                COALESCE(SUM(total), 0) as total_sales
             FROM orders 
             WHERE YEAR(placed_at) = YEAR(CURDATE()) 
               AND MONTH(placed_at) = MONTH(CURDATE())
               AND status NOT IN ('cancelled')"
        );
        
        // Get this year's sales
        $thisYearSales = $db->fetchOne(
            "SELECT 
                COUNT(*) as order_count,
                COALESCE(SUM(total), 0) as total_sales
             FROM orders 
             WHERE YEAR(placed_at) = YEAR(CURDATE())
               AND status NOT IN ('cancelled')"
        );
        
        // Get top selling products
        $topProducts = $db->fetchAll(
            "SELECT 
                oi.product_name,
                SUM(oi.quantity) as total_quantity,
                SUM(oi.line_total) as total_revenue,
                COUNT(DISTINCT oi.order_id) as order_count
             FROM order_items oi
             JOIN orders o ON oi.order_id = o.id
             WHERE o.status NOT IN ('cancelled', 'refunded')
             GROUP BY oi.product_name
             ORDER BY total_quantity DESC
             LIMIT 10"
        );
        
        // Get sales by status
        $salesByStatus = $db->fetchAll(
            "SELECT 
                status,
                COUNT(*) as order_count,
                COALESCE(SUM(total), 0) as total_sales
             FROM orders 
             GROUP BY status
             ORDER BY order_count DESC"
        );
        
        // Get completed orders count (for analytics)
        $completedOrders = $db->fetchOne(
            "SELECT 
                COUNT(*) as order_count,
                COALESCE(SUM(total), 0) as total_sales
             FROM orders 
             WHERE status = 'completed'"
        );
        
        // Fill in missing months with 0
        $monthlyData = [];
        for ($m = 1; $m <= 12; $m++) {
            $monthlyData[$m] = [
                'month' => $m,
                'order_count' => 0,
                'total_sales' => 0,
                'subtotal' => 0,
                'total_tax' => 0,
                'total_shipping' => 0
            ];
        }
        
        foreach ($monthlySales as $row) {
            $monthlyData[$row['month']] = $row;
        }
        
        sendSuccess([
            'monthly' => array_values($monthlyData),
            'yearly' => $yearlySales,
            'today' => $todaySales,
            'this_month' => $thisMonthSales,
            'this_year' => $thisYearSales,
            'selected_year' => $year,
            'top_products' => $topProducts,
            'sales_by_status' => $salesByStatus,
            'completed_orders' => $completedOrders
        ]);
    }
    
    // Invalid action
    else {
        sendError('Invalid action', 400);
    }

} catch (Exception $e) {
    error_log("Orders API Error: " . $e->getMessage());
    error_log("Orders API Error Stack: " . $e->getTraceAsString());
    // Return detailed error in development mode
    sendError('An error occurred: ' . $e->getMessage(), 500);
}
?>