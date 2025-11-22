<?php
require_once 'db_config.php';

$conn = getDBConnection();
$method = $_SERVER['REQUEST_METHOD'];

// Get all products or filter by category
if ($method === 'GET' && !isset($_GET['id'])) {
    $category = isset($_GET['category']) ? $conn->real_escape_string($_GET['category']) : '';
    $search = isset($_GET['search']) ? $conn->real_escape_string($_GET['search']) : '';
    
    $sql = "SELECT p.*, c.name as category_name, b.name as brand_name 
            FROM products p 
            LEFT JOIN categories c ON p.category_id = c.id 
            LEFT JOIN brands b ON p.brand_id = b.id 
            WHERE p.is_active = 1";
    
    if ($category) {
        $sql .= " AND c.slug = '$category'";
    }
    
    if ($search) {
        $sql .= " AND (p.name LIKE '%$search%' OR p.description LIKE '%$search%')";
    }
    
    $sql .= " ORDER BY p.created_at DESC";
    
    $result = $conn->query($sql);
    $products = [];
    
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
    
    echo json_encode(['success' => true, 'products' => $products]);
}

// Get single product by ID
elseif ($method === 'GET' && isset($_GET['id'])) {
    $id = (int)$_GET['id'];
    
    $sql = "SELECT p.*, c.name as category_name, b.name as brand_name 
            FROM products p 
            LEFT JOIN categories c ON p.category_id = c.id 
            LEFT JOIN brands b ON p.brand_id = b.id 
            WHERE p.id = $id";
    
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $product = $result->fetch_assoc();
        
        // Get product images
        $images = $conn->query("SELECT image_url, is_primary FROM product_images WHERE product_id = $id ORDER BY is_primary DESC");
        $product['images'] = [];
        while ($img = $images->fetch_assoc()) {
            $product['images'][] = $img;
        }
        
        echo json_encode(['success' => true, 'product' => $product]);
    } else {
        echo json_encode(['success' => false, 'error' => 'Product not found']);
    }
}

// Get categories
elseif ($method === 'GET' && isset($_GET['action']) && $_GET['action'] === 'categories') {
    $result = $conn->query("SELECT * FROM categories ORDER BY name");
    $categories = [];
    
    while ($row = $result->fetch_assoc()) {
        $categories[] = $row;
    }
    
    echo json_encode(['success' => true, 'categories' => $categories]);
}

// Get brands
elseif ($method === 'GET' && isset($_GET['action']) && $_GET['action'] === 'brands') {
    $result = $conn->query("SELECT * FROM brands ORDER BY name");
    $brands = [];
    
    while ($row = $result->fetch_assoc()) {
        $brands[] = $row;
    }
    
    echo json_encode(['success' => true, 'brands' => $brands]);
}

$conn->close();
?>
