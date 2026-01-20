<?php
$_POST = array('action' => 'adminLogin', 'email' => 'superadmin@mypc.com', 'password' => '@dmin123');
$_SERVER['REQUEST_METHOD'] = 'POST';
$_SERVER['HTTP_ORIGIN'] = 'http://localhost';
$_SERVER['REQUEST_URI'] = '/HTML_PHP/admin_auth.php';
$_SERVER['REMOTE_ADDR'] = '127.0.0.1';
include 'HTML_PHP/admin_auth.php';
?>
