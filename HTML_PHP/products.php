<?php
/**
 * Products API
 * Handles product listing, search, and details
 */

require_once 'db_config.php';

$db = getDB();
$method = $_SERVER['REQUEST_METHOD'];

try {
    // Get all products or filter by category/search
    if ($method === 'GET' && !isset($_GET['id'])) {
        $category = isset($_GET['category']) ? sanitizeInput($_GET['category']) : '';
        $search = isset($_GET['search']) ? sanitizeInput($_GET['search']) : '';
        $page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
        $limit = isset($_GET['limit']) ? min(100, max(1, intval($_GET['limit']))) : 20;
        $offset = ($page - 1) * $limit;
        
        // Build query
        $sql = "SELECT p.id, p.sku, p.name, p.slug, p.description, p.base_price, 
                       p.stock_quantity, p.image_url, c.name as category_name, c.slug as category_slug
                FROM products p 
                LEFT JOIN categories c ON p.category_id = c.id 
                WHERE p.is_active = 1";
        
        $params = [];
        
        if ($category) {
            $sql .= " AND c.slug = ?";
            $params[] = $category;
        }
        
        if ($search) {
            $sql .= " AND (p.name LIKE ? OR p.description LIKE ?)";
            $searchTerm = "%{$search}%";
            $params[] = $searchTerm;
            $params[] = $searchTerm;
        }
        
        $sql .= " ORDER BY p.created_at DESC LIMIT ? OFFSET ?";
        $params[] = $limit;
        $params[] = $offset;
        
        $products = $db->fetchAll($sql, $params);
        
        // Get total count for pagination
        $countSql = "SELECT COUNT(*) as total FROM products p 
                     LEFT JOIN categories c ON p.category_id = c.id 
                     WHERE p.is_active = 1";
        $countParams = [];
        
        if ($category) {
            $countSql .= " AND c.slug = ?";
            $countParams[] = $category;
        }
        
        if ($search) {
            $countSql .= " AND (p.name LIKE ? OR p.description LIKE ?)";
            $countParams[] = $searchTerm;
            $countParams[] = $searchTerm;
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
    
    // Get single product by ID or slug
    elseif ($method === 'GET' && isset($_GET['id'])) {
        $identifier = sanitizeInput($_GET['id']);
        
        // Check if it's numeric (ID) or string (slug)
        if (is_numeric($identifier)) {
            $sql = "SELECT p.*, c.name as category_name, c.slug as category_slug 
                    FROM products p 
                    LEFT JOIN categories c ON p.category_id = c.id 
                    WHERE p.id = ? AND p.is_active = 1";
            $params = [intval($identifier)];
        } else {
            $sql = "SELECT p.*, c.name as category_name, c.slug as category_slug 
                    FROM products p 
                    LEFT JOIN categories c ON p.category_id = c.id 
                    WHERE p.slug = ? AND p.is_active = 1";
            $params = [$identifier];
        }
        
        $product = $db->fetchOne($sql, $params);
        
        if (!$product) {
            sendError('Product not found', 404);
        }
        
        // Get product variants
        $variants = $db->fetchAll(
            "SELECT id, label, price_adjustment, stock_quantity, sku_suffix 
             FROM product_variants 
             WHERE product_id = ? AND is_active = 1 
             ORDER BY price_adjustment ASC",
            [$product['id']]
        );
        
        $product['variants'] = $variants;
        
        // Get product reviews
        $reviews = $db->fetchAll(
            "SELECT r.*, u.first_name, u.last_name 
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
    
    // Get categories
    elseif ($method === 'GET' && isset($_GET['action']) && $_GET['action'] === 'categories') {
        $categories = $db->fetchAll(
            "SELECT id, name, slug, description 
             FROM categories 
             WHERE is_active = 1 
             ORDER BY name ASC"
        );
        
        sendSuccess(['categories' => $categories]);
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
