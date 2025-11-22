<?php
require_once 'db_config.php';
session_start();

$conn = getDBConnection();
$method = $_SERVER['REQUEST_METHOD'];

// Register new user
if ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'register') {
    $email = $conn->real_escape_string($_POST['email']);
    $password = $_POST['password'];
    $first_name = $conn->real_escape_string($_POST['first_name']);
    $last_name = $conn->real_escape_string($_POST['last_name']);
    $phone = $conn->real_escape_string($_POST['phone'] ?? '');
    
    // Check if email already exists
    $check = $conn->query("SELECT id FROM users WHERE email = '$email'");
    if ($check->num_rows > 0) {
        echo json_encode(['success' => false, 'error' => 'Email already registered']);
        exit();
    }
    
    $password_hash = password_hash($password, PASSWORD_BCRYPT);
    
    $sql = "INSERT INTO users (email, password_hash, first_name, last_name, phone, role, created_at) 
            VALUES ('$email', '$password_hash', '$first_name', '$last_name', '$phone', 'customer', NOW())";
    
    if ($conn->query($sql)) {
        $user_id = $conn->insert_id;
        
        // Create default addresses entry
        $conn->query("INSERT INTO addresses (user_id, is_default) VALUES ($user_id, 1)");
        
        $_SESSION['user_id'] = $user_id;
        $_SESSION['user_email'] = $email;
        $_SESSION['user_role'] = 'customer';
        
        echo json_encode([
            'success' => true, 
            'user' => [
                'id' => $user_id,
                'email' => $email,
                'first_name' => $first_name,
                'last_name' => $last_name,
                'role' => 'customer'
            ]
        ]);
    } else {
        echo json_encode(['success' => false, 'error' => 'Registration failed']);
    }
}

// Login user
elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'login') {
    $email = $conn->real_escape_string($_POST['email']);
    $password = $_POST['password'];
    
    $result = $conn->query("SELECT id, email, password_hash, first_name, last_name, role FROM users WHERE email = '$email'");
    
    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        
        if (password_verify($password, $user['password_hash'])) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_email'] = $user['email'];
            $_SESSION['user_role'] = $user['role'];
            
            echo json_encode([
                'success' => true,
                'user' => [
                    'id' => $user['id'],
                    'email' => $user['email'],
                    'first_name' => $user['first_name'],
                    'last_name' => $user['last_name'],
                    'role' => $user['role']
                ]
            ]);
        } else {
            echo json_encode(['success' => false, 'error' => 'Invalid password']);
        }
    } else {
        echo json_encode(['success' => false, 'error' => 'User not found']);
    }
}

// Logout user
elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'logout') {
    session_destroy();
    echo json_encode(['success' => true]);
}

// Get current user
elseif ($method === 'GET' && isset($_GET['action']) && $_GET['action'] === 'current') {
    if (isset($_SESSION['user_id'])) {
        $user_id = $_SESSION['user_id'];
        $result = $conn->query("SELECT id, email, first_name, last_name, role, phone FROM users WHERE id = $user_id");
        
        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            echo json_encode(['success' => true, 'user' => $user]);
        } else {
            echo json_encode(['success' => false, 'error' => 'User not found']);
        }
    } else {
        echo json_encode(['success' => false, 'error' => 'Not logged in']);
    }
}

$conn->close();
?>
