<?php
try {
    $db = new PDO('mysql:host=localhost;dbname=mypc_db', 'root', '');
    $result = $db->query('SHOW TABLES LIKE "audit_logs"');
    $table = $result->fetch();
    
    if ($table) {
        echo "✓ audit_logs table exists\n\n";
        
        // Show table structure
        $result = $db->query('DESCRIBE audit_logs');
        echo "Table Structure:\n";
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            echo "  " . $row['Field'] . " (" . $row['Type'] . ")\n";
        }
    } else {
        echo "✗ audit_logs table NOT found\n";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
