<?php
/**
 * Sales Analytics API
 * Separate endpoint for sales analytics that handles authentication gracefully
 */

// CORS headers for same-origin requests
header('Access-Control-Allow-Credentials: true');

require_once 'db_config.php';

// Secure session configuration (must match auth.php)
ini_set('session.cookie_httponly', 1);
ini_set('session.cookie_secure', 0); // Set to 1 if using HTTPS
ini_set('session.cookie_samesite', 'Strict');
ini_set('session.use_only_cookies', 1);

session_start();

$db = getDB();
$method = $_SERVER['REQUEST_METHOD'];

// Debug: Log session info
error_log("Sales Analytics - Session ID: " . session_id());
error_log("Sales Analytics - User ID: " . ($_SESSION['user_id'] ?? 'NOT SET'));
error_log("Sales Analytics - Cookies received: " . print_r($_COOKIE, true));

// Check authentication
if (!isset($_SESSION['user_id'])) {
    error_log("Sales Analytics - Auth failed: user_id not in session");
    sendError('Not authenticated. Please log in again. Session ID: ' . session_id(), 401);
    exit;
}

$user_id = $_SESSION['user_id'];

try {
    // Check if user is admin/superadmin
    $user = $db->fetchOne("SELECT role FROM users WHERE id = ?", [$user_id]);
    $role = $user['role'] ?? 'user';
    
    if (!in_array($role, ['admin', 'superadmin'])) {
        sendError('Unauthorized - Admin access required', 403);
    }
    
    $year = isset($_GET['year']) ? intval($_GET['year']) : date('Y');
    $month = isset($_GET['month']) ? intval($_GET['month']) : date('n');
    $action = isset($_GET['action']) ? $_GET['action'] : '';
    
    // Handle specific action: get orders by status for a year (or all years)
    if ($action === 'ordersByStatus') {
        if (isset($_GET['year'])) {
            // Specific year
            $salesByStatus = $db->fetchAll(
                "SELECT 
                    status,
                    COUNT(*) as order_count,
                    COALESCE(SUM(total), 0) as total_sales
                 FROM orders 
                 WHERE YEAR(placed_at) = ?
                 GROUP BY status
                 ORDER BY order_count DESC",
                [$year]
            );
        } else {
            // All years
            $salesByStatus = $db->fetchAll(
                "SELECT 
                    status,
                    COUNT(*) as order_count,
                    COALESCE(SUM(total), 0) as total_sales
                 FROM orders 
                 GROUP BY status
                 ORDER BY order_count DESC"
            );
        }
        
        sendSuccess(['sales_by_status' => $salesByStatus]);
    }
    
    // Handle specific action: get top selling products for a year (or all years)
    if ($action === 'topProducts') {
        if (isset($_GET['year'])) {
            // Specific year
            $topProductsData = $db->fetchAll(
                "SELECT 
                    oi.product_name,
                    SUM(oi.quantity) as total_quantity,
                    SUM(oi.line_total) as total_revenue,
                    COUNT(DISTINCT oi.order_id) as order_count
                 FROM order_items oi
                 JOIN orders o ON oi.order_id = o.id
                 WHERE YEAR(o.placed_at) = ? AND o.status NOT IN ('cancelled', 'refunded')
                 GROUP BY oi.product_name
                 ORDER BY total_quantity DESC
                 LIMIT 10",
                [$year]
            );
        } else {
            // All years
            $topProductsData = $db->fetchAll(
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
        }
        
        sendSuccess(['top_products' => $topProductsData]);
    }
    
    // Get daily sales for the specified month/year (last 30 days if current month)
    $dailySales = $db->fetchAll(
        "SELECT 
            DAY(placed_at) as day,
            DATE(placed_at) as date,
            COUNT(*) as order_count,
            SUM(total) as total_sales
         FROM orders 
         WHERE YEAR(placed_at) = ? 
           AND MONTH(placed_at) = ?
           AND status NOT IN ('cancelled')
         GROUP BY DATE(placed_at)
         ORDER BY DATE(placed_at)",
        [$year, $month]
    );
    
    // Get weekly sales for the specified year (by week number)
    $weeklySales = $db->fetchAll(
        "SELECT 
            WEEK(placed_at, 1) as week,
            MIN(DATE(placed_at)) as week_start,
            COUNT(*) as order_count,
            SUM(total) as total_sales
         FROM orders 
         WHERE YEAR(placed_at) = ? 
           AND status NOT IN ('cancelled')
         GROUP BY WEEK(placed_at, 1)
         ORDER BY WEEK(placed_at, 1)",
        [$year]
    );
    
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
    
    // Get this week's sales
    $thisWeekSales = $db->fetchOne(
        "SELECT 
            COUNT(*) as order_count,
            COALESCE(SUM(total), 0) as total_sales
         FROM orders 
         WHERE YEARWEEK(placed_at, 1) = YEARWEEK(CURDATE(), 1)
           AND status NOT IN ('cancelled')"
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
    
    // Fill in daily data for the month
    $daysInMonth = cal_days_in_month(CAL_GREGORIAN, $month, $year);
    $dailyData = [];
    for ($d = 1; $d <= $daysInMonth; $d++) {
        $dailyData[$d] = [
            'day' => $d,
            'date' => sprintf('%04d-%02d-%02d', $year, $month, $d),
            'order_count' => 0,
            'total_sales' => 0
        ];
    }
    foreach ($dailySales as $row) {
        $dailyData[$row['day']] = $row;
    }
    
    // Fill in weekly data (52 weeks)
    $weeklyData = [];
    for ($w = 1; $w <= 52; $w++) {
        $weeklyData[$w] = [
            'week' => $w,
            'order_count' => 0,
            'total_sales' => 0
        ];
    }
    foreach ($weeklySales as $row) {
        $weeklyData[$row['week']] = $row;
    }
    
    sendSuccess([
        'daily' => array_values($dailyData),
        'weekly' => array_values($weeklyData),
        'monthly' => array_values($monthlyData),
        'yearly' => $yearlySales,
        'today' => $todaySales,
        'this_week' => $thisWeekSales,
        'this_month' => $thisMonthSales,
        'this_year' => $thisYearSales,
        'selected_year' => $year,
        'selected_month' => $month,
        'top_products' => $topProducts,
        'sales_by_status' => $salesByStatus,
        'completed_orders' => $completedOrders
    ]);

} catch (Exception $e) {
    error_log("Sales Analytics API Error: " . $e->getMessage());
    sendError('An error occurred: ' . $e->getMessage(), 500);
}
?>
