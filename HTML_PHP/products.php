<?php
/**
 * Products API
 * Handles product listing, search, and details
 */

require_once 'db_config.php';

$db = getDB();
$method = $_SERVER['REQUEST_METHOD'];

try {
    // Get categories
    if ($method === 'GET' && isset($_GET['action']) && $_GET['action'] === 'categories') {
        $categories = $db->fetchAll(
            "SELECT id, name, slug, description 
             FROM categories 
             ORDER BY name ASC"
        );

        sendSuccess(['categories' => $categories]);
    }

    // Get single product by ID or slug
    elseif ($method === 'GET' && isset($_GET['id'])) {
        $identifier = sanitizeInput($_GET['id']);

        // Check if it's numeric (ID) or string (slug)
        if (is_numeric($identifier)) {
            $sql = "SELECT p.*, c.name as category_name, c.slug as category_slug 
                    FROM products p 
                    LEFT JOIN categories c ON p.category_id = c.id 
                    WHERE p.id = ? AND p.active = 1";
            $params = [intval($identifier)];
        } else {
            $sql = "SELECT p.*, c.name as category_name, c.slug as category_slug 
                    FROM products p 
                    LEFT JOIN categories c ON p.category_id = c.id 
                    WHERE p.slug = ? AND p.active = 1";
            $params = [$identifier];
        }

        $product = $db->fetchOne($sql, $params);

        if (!$product) {
            sendError('Product not found', 404);
        }

        // Get product variants
        $variants = $db->fetchAll(
            "SELECT id, variant_sku, title, price, stock 
             FROM product_variants 
             WHERE product_id = ? 
             ORDER BY price ASC",
            [$product['id']]
        );

        $product['variants'] = $variants;
        
        // Calculate display price and stock
        $product['price'] = !empty($variants) ? $variants[0]['price'] : 0;
        $product['stock'] = array_reduce($variants, function($carry, $item) {
            return $carry + $item['stock'];
        }, 0);

        // Get product images
        $images = $db->fetchAll(
            "SELECT id, url, alt_text, `order` 
             FROM product_images 
             WHERE product_id = ? 
             ORDER BY `order` ASC",
            [$product['id']]
        );

        // Convert image URLs to use image serving script
        foreach ($images as &$img) {
            $img['url'] = '/serve-image.php?path=' . urlencode($img['url']);
        }
        unset($img);
        
        $product['images'] = $images;

        // Get product reviews
        $reviews = $db->fetchAll(
            "SELECT r.*, CONCAT(u.first_name, ' ', u.last_name) as full_name 
             FROM reviews r 
             LEFT JOIN users u ON r.user_id = u.id 
             WHERE r.product_id = ? 
             ORDER BY r.created_at DESC 
             LIMIT 10",
            [$product['id']]
        );

        $product['reviews'] = $reviews;

        // Calculate average rating
        $ratingResult = $db->fetchOne(
            "SELECT AVG(rating) as avg_rating, COUNT(*) as review_count 
             FROM reviews 
             WHERE product_id = ?",
            [$product['id']]
        );

        $product['avg_rating'] = $ratingResult['avg_rating'] ? round($ratingResult['avg_rating'], 1) : 0;
        $product['review_count'] = $ratingResult['review_count'];

        sendSuccess(['product' => $product]);
    }

    // Get all products or filter by category/search
    elseif ($method === 'GET') {
        $category = isset($_GET['category']) ? sanitizeInput($_GET['category']) : '';
        $search = isset($_GET['search']) ? sanitizeInput($_GET['search']) : '';
        $page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
        $limit = isset($_GET['limit']) ? min(100, max(1, intval($_GET['limit']))) : 20;
        $offset = ($page - 1) * $limit;

        // Build query with improved search
        $params = [];
        
        if ($search) {
            $searchTerm = trim($search);
            $searchLower = strtolower($searchTerm);
            
            // Build query with relevance scoring
            $sql = "SELECT p.id, p.sku, p.name, p.slug, p.short_description, 
                           p.long_description, c.name as category_name, c.slug as category_slug,
                           CASE
                             WHEN LOWER(p.name) = ? THEN 1000
                             WHEN LOWER(p.name) LIKE ? THEN 900
                             WHEN LOWER(p.name) LIKE ? THEN 800
                             WHEN LOWER(c.name) = ? THEN 700
                             WHEN LOWER(c.name) LIKE ? THEN 600
                             WHEN LOWER(p.sku) LIKE ? THEN 500
                             WHEN LOWER(p.short_description) LIKE ? THEN 400
                             WHEN LOWER(p.name) LIKE ? THEN 300
                             WHEN LOWER(p.long_description) LIKE ? THEN 200
                             ELSE 0
                           END as relevance
                    FROM products p 
                    LEFT JOIN categories c ON p.category_id = c.id 
                    WHERE p.active = 1";
            
            // Add parameters for relevance scoring
            $params[] = $searchLower;  // Exact name match
            $params[] = $searchLower . '%';  // Name starts with
            $params[] = '%' . $searchLower . '%';  // Name contains
            $params[] = $searchLower;  // Category exact
            $params[] = $searchLower . '%';  // Category starts
            $params[] = '%' . $searchLower . '%';  // SKU contains
            $params[] = '%' . $searchLower . '%';  // Short desc contains
            $params[] = '%' . str_replace(' ', '%', $searchLower) . '%';  // Any word match
            $params[] = '%' . $searchLower . '%';  // Long desc contains
            
        } else {
            // No search - standard query
            $sql = "SELECT p.id, p.sku, p.name, p.slug, p.short_description, 
                           p.long_description, c.name as category_name, c.slug as category_slug
                    FROM products p 
                    LEFT JOIN categories c ON p.category_id = c.id 
                    WHERE p.active = 1";
        }

        // Add category filter
        if ($category) {
            $sql .= " AND c.slug = ?";
            $params[] = $category;
        }

        // Add search filter - prioritize name and category, exclude description-only matches
        if ($search) {
            $searchLower = strtolower(trim($search));
            $sql .= " AND (
                LOWER(p.name) LIKE ? OR 
                LOWER(c.name) LIKE ? OR
                LOWER(p.sku) LIKE ?
            )";
            
            $params[] = '%' . $searchLower . '%';
            $params[] = '%' . $searchLower . '%';
            $params[] = '%' . $searchLower . '%';
        }

        // Order by relevance if searching, otherwise by date
        if ($search) {
            $sql .= " ORDER BY relevance DESC, p.created_at DESC LIMIT ? OFFSET ?";
        } else {
            $sql .= " ORDER BY p.created_at DESC LIMIT ? OFFSET ?";
        }
        
        $params[] = $limit;
        $params[] = $offset;

        $products = $db->fetchAll($sql, $params);

        // Get variants and images for each product
        foreach ($products as &$product) {
            $variants = $db->fetchAll(
                "SELECT id, variant_sku, title, price, stock 
                 FROM product_variants 
                 WHERE product_id = ? 
                 ORDER BY price ASC",
                [$product['id']]
            );
            $product['variants'] = $variants;
            
            // Calculate display price (min price) and total stock
            $product['price'] = !empty($variants) ? $variants[0]['price'] : 0;
            $product['stock'] = array_reduce($variants, function($carry, $item) {
                return $carry + $item['stock'];
            }, 0);

            $images = $db->fetchAll(
                "SELECT id, url, alt_text, `order` 
                 FROM product_images 
                 WHERE product_id = ? 
                 ORDER BY `order` ASC LIMIT 1",
                [$product['id']]
            );
            
            // Convert image URLs to use image serving script
            foreach ($images as &$img) {
                $img['url'] = '/serve-image.php?path=' . urlencode($img['url']);
            }
            unset($img);
            
            $product['images'] = $images;
            
            // Set main image URL
            if (!empty($images)) {
                $product['image_url'] = $images[0]['url'];
            } else {
                $product['image_url'] = null;
            }
        }

        // Get total count for pagination
        $countSql = "SELECT COUNT(*) as total FROM products p 
                     LEFT JOIN categories c ON p.category_id = c.id 
                     WHERE p.active = 1";
        $countParams = [];

        if ($category) {
            $countSql .= " AND c.slug = ?";
            $countParams[] = $category;
        }

        if ($search) {
            $searchLower = strtolower(trim($search));
            $countSql .= " AND (
                LOWER(p.name) LIKE ? OR 
                LOWER(c.name) LIKE ? OR
                LOWER(p.sku) LIKE ?
            )";
            
            $countParams[] = '%' . $searchLower . '%';
            $countParams[] = '%' . $searchLower . '%';
            $countParams[] = '%' . $searchLower . '%';
        }

        $totalResult = $db->fetchOne($countSql, $countParams);
        $total = $totalResult['total'];

        sendSuccess([
            'products' => $products,
            'pagination' => [
                'page' => $page,
                'limit' => $limit,
                'total' => $total,
                'pages' => ceil($total / $limit)
            ]
        ]);
    }

    // Invalid action
    else {
        sendError('Invalid action', 400);
    }

} catch (Exception $e) {
    error_log("Products API Error: " . $e->getMessage());
    sendError('An error occurred. Please try again later.', 500);
}
?>