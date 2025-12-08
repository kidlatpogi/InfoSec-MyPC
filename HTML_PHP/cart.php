<?php
/**
 * Shopping Cart API
 * Handles cart operations for logged-in users
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
    // Get user's cart
    if ($method === 'GET') {
        // Get or create cart for user
        $cart = $db->fetchOne("SELECT id FROM carts WHERE user_id = ?", [$user_id]);

        if (!$cart) {
            // Create cart if doesn't exist
            $cart_id = $db->insert("INSERT INTO carts (user_id) VALUES (?)", [$user_id]);
        } else {
            $cart_id = $cart['id'];
        }

        // Get cart items with product details
        $items = $db->fetchAll(
            "SELECT ci.id as cart_item_id, ci.quantity, ci.added_at,
                    p.id as product_id, p.name, p.slug,
                    pv.id as variant_id, pv.title as variant_title, 
                    pv.price as price,
                    pv.price as unit_price,
                    pv.price * ci.quantity as line_total,
                    (SELECT url FROM product_images WHERE product_id = p.id ORDER BY `order` ASC LIMIT 1) as image_url
             FROM cart_items ci
             JOIN product_variants pv ON ci.variant_id = pv.id
             JOIN products p ON pv.product_id = p.id
             WHERE ci.cart_id = ?
             ORDER BY ci.added_at DESC",
            [$cart_id]
        );

        // Convert image URLs to use image serving script
        foreach ($items as &$item) {
            if (!empty($item['image_url'])) {
                $item['image_url'] = '/serve-image.php?path=' . urlencode($item['image_url']);
            }
        }
        unset($item);

        // Calculate totals
        $subtotal = 0;
        foreach ($items as $item) {
            $subtotal += $item['line_total'];
        }

        sendSuccess([
            'cart' => [
                'items' => $items,
                'item_count' => count($items),
                'subtotal' => $subtotal
            ]
        ]);
    }

    // Add item to cart
    elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'add') {
        $product_id = isset($_POST['product_id']) ? intval($_POST['product_id']) : 0;
        $variant_id = isset($_POST['variant_id']) && $_POST['variant_id'] !== '' && $_POST['variant_id'] !== 'null' ? intval($_POST['variant_id']) : null;
        $quantity = isset($_POST['quantity']) ? intval($_POST['quantity']) : 1;

        if ($product_id <= 0 || $quantity <= 0) {
            sendError('Invalid product or quantity');
        }

        // If no variant_id provided, get the first available variant for this product
        if ($variant_id === null || $variant_id === 0) {
            $variant = $db->fetchOne(
                "SELECT pv.id, pv.stock as stock, p.id as product_id FROM product_variants pv 
                 JOIN products p ON pv.product_id = p.id 
                 WHERE p.id = ? AND p.active = 1 AND pv.stock > 0
                 ORDER BY pv.id ASC LIMIT 1",
                [$product_id]
            );
        } else {
            // Verify specific variant exists
            $variant = $db->fetchOne(
                "SELECT pv.id, pv.stock as stock, p.id as product_id FROM product_variants pv 
                 JOIN products p ON pv.product_id = p.id 
                 WHERE pv.id = ? AND p.active = 1",
                [$variant_id]
            );
        }

        if (!$variant) {
            sendError('Product variant not found or out of stock', 404);
        }
        
        // Use the found variant_id
        $variant_id = $variant['id'];

        // Check stock availability
        if ($quantity > $variant['stock']) {
            sendError("Only {$variant['stock']} items available in stock");
        }

        // Get or create cart
        $cart = $db->fetchOne("SELECT id FROM carts WHERE user_id = ?", [$user_id]);

        if (!$cart) {
            $cart_id = $db->insert("INSERT INTO carts (user_id) VALUES (?)", [$user_id]);
        } else {
            $cart_id = $cart['id'];
        }

        // Check if item already in cart
        $existing = $db->fetchOne(
            "SELECT id, quantity FROM cart_items 
             WHERE cart_id = ? AND variant_id = ?",
            [$cart_id, $variant_id]
        );

        if ($existing) {
            // Update quantity
            $new_quantity = $existing['quantity'] + $quantity;

            if ($new_quantity > $variant['stock']) {
                sendError("Cannot add more items. Only {$variant['stock']} available in stock");
            }

            $db->query(
                "UPDATE cart_items SET quantity = ? WHERE id = ?",
                [$new_quantity, $existing['id']]
            );
        } else {
            // Insert new item
            $db->insert(
                "INSERT INTO cart_items (cart_id, variant_id, quantity) 
                 VALUES (?, ?, ?)",
                [$cart_id, $variant_id, $quantity]
            );
        }

        sendSuccess([], 'Item added to cart');
    }

    // Update cart item quantity
    elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'update') {
        $cart_item_id = isset($_POST['cart_item_id']) ? intval($_POST['cart_item_id']) : 0;
        $quantity = isset($_POST['quantity']) ? intval($_POST['quantity']) : 0;

        if ($cart_item_id <= 0) {
            sendError('Invalid cart item');
        }

        // Get cart item and verify ownership, check variant stock
        $cart_item = $db->fetchOne(
            "SELECT ci.*, c.user_id, pv.stock as variant_stock
             FROM cart_items ci
             JOIN carts c ON ci.cart_id = c.id
             JOIN product_variants pv ON ci.variant_id = pv.id
             WHERE ci.id = ?",
            [$cart_item_id]
        );

        if (!$cart_item || $cart_item['user_id'] != $user_id) {
            sendError('Cart item not found', 404);
        }

        if ($quantity <= 0) {
            // Remove item
            $db->query("DELETE FROM cart_items WHERE id = ?", [$cart_item_id]);
            sendSuccess([], 'Item removed from cart');
        } else {
            // Check stock from variant
            $available_stock = $cart_item['variant_stock'];
            if ($quantity > $available_stock) {
                sendError("Only {$available_stock} items available");
            }

            // Update quantity
            $db->query(
                "UPDATE cart_items SET quantity = ? WHERE id = ?",
                [$quantity, $cart_item_id]
            );
            sendSuccess([], 'Cart updated');
        }
    }

    // Remove item from cart
    elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'remove') {
        $cart_item_id = isset($_POST['cart_item_id']) ? intval($_POST['cart_item_id']) : 0;

        if ($cart_item_id <= 0) {
            sendError('Invalid cart item');
        }

        // Verify ownership before deleting
        $cart_item = $db->fetchOne(
            "SELECT ci.id FROM cart_items ci
             JOIN carts c ON ci.cart_id = c.id
             WHERE ci.id = ? AND c.user_id = ?",
            [$cart_item_id, $user_id]
        );

        if (!$cart_item) {
            sendError('Cart item not found', 404);
        }

        $db->query("DELETE FROM cart_items WHERE id = ?", [$cart_item_id]);
        sendSuccess([], 'Item removed from cart');
    }

    // Clear cart
    elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'clear') {
        $cart = $db->fetchOne("SELECT id FROM carts WHERE user_id = ?", [$user_id]);

        if ($cart) {
            $db->query("DELETE FROM cart_items WHERE cart_id = ?", [$cart['id']]);
        }

        sendSuccess([], 'Cart cleared');
    }

    // Invalid action
    else {
        sendError('Invalid action', 400);
    }

} catch (Exception $e) {
    error_log("Cart API Exception: " . $e->getMessage());
    sendError('An error occurred. Please try again later.', 500);
}
?>