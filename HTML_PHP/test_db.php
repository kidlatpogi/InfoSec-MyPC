<?php
/**
 * Test Database Connection
 * Run this file directly to check if database is working
 */

// Suppress any output before headers
ob_start();

require_once 'Database.php';

header('Content-Type: application/json');

try {
    $db = Database::getInstance();
    $conn = $db->getConnection();
    
    // Test query
    $result = $db->fetchOne("SELECT COUNT(*) as count FROM users");
    
    echo json_encode([
        'success' => true,
        'message' => 'Database connection successful',
        'user_count' => $result['count']
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ]);
}

ob_end_flush();
?>
