# MyPC Store - Backend Setup Guide

## Prerequisites Installation

### 1. Install XAMPP
1. Download XAMPP from: https://www.apachefriends.org/download.html
2. Install XAMPP (default location: C:\xampp)
3. Open XAMPP Control Panel
4. Start Apache and MySQL services

### 2. Setup Database

1. Open phpMyAdmin: http://localhost/phpmyadmin
2. Click "Import" tab
3. Choose file: `db/schema_3nf_mysql.sql`
4. Click "Go" to import the database

The database `mypc_store` will be created with all necessary tables.

### 3. Configure Project

1. Copy your project to: `C:\xampp\htdocs\mypc`
2. Or update the `DocumentRoot` in Apache config to point to your project folder

### 4. Database Configuration

The database connection is already configured in `api/db_config.php`:
- Host: localhost
- Username: root
- Password: (empty by default)
- Database: mypc_store

**If your MySQL has a password**, edit `api/db_config.php` and update:
```php
define('DB_PASS', 'your_password_here');
```

### 5. Access the Application

**Option A: Using XAMPP (Recommended)**
1. Move/Copy project to `C:\xampp\htdocs\mypc`
2. Access: http://localhost/mypc

**Option B: Using PHP Built-in Server**
```bash
cd F:\InfoSec-MyPC-main\InfoSec-MyPC-main
php -S localhost:8000
```
Then access: http://localhost:8000

## API Endpoints Created

### Authentication (`api/auth.php`)
- POST /api/auth.php?action=register - Register new user
- POST /api/auth.php?action=login - Login user
- POST /api/auth.php?action=logout - Logout user
- GET /api/auth.php?action=current - Get current logged-in user

### Products (`api/products.php`)
- GET /api/products.php - Get all products
- GET /api/products.php?id={id} - Get single product
- GET /api/products.php?category={slug} - Filter by category
- GET /api/products.php?search={query} - Search products
- GET /api/products.php?action=categories - Get all categories
- GET /api/products.php?action=brands - Get all brands

### Cart (`api/cart.php`)
- GET /api/cart.php - Get user's cart items
- POST /api/cart.php?action=add - Add item to cart
- POST /api/cart.php?action=update - Update cart item quantity
- POST /api/cart.php?action=remove - Remove item from cart
- POST /api/cart.php?action=clear - Clear entire cart

### Orders (`api/orders.php`)
- POST /api/orders.php?action=create - Create new order
- GET /api/orders.php - Get user's order history

## Testing the Backend

1. After setting up, test the connection:
   - Visit: http://localhost/mypc/api/products.php?action=categories
   - You should see JSON response with categories

2. Test authentication:
   - Use the signup form on the website
   - Or test directly with Postman/curl

## Troubleshooting

### Apache won't start
- Port 80 might be in use
- Check if IIS or another web server is running
- Change Apache port in XAMPP config

### MySQL won't start
- Port 3306 might be in use
- Check if another MySQL instance is running
- Change MySQL port in XAMPP config

### 404 errors on API calls
- Make sure Apache mod_rewrite is enabled
- Check .htaccess file is present
- Verify file paths in JavaScript

### Database connection errors
- Verify MySQL is running in XAMPP
- Check database credentials in `api/db_config.php`
- Ensure database `mypc_store` exists

## Next Steps

After XAMPP is installed and database is imported:
1. You can start adding products through the admin panel
2. Test user registration and login
3. Add items to cart and checkout
4. View order history in profile

## Default Admin Account (After importing sample data)

If sample data is included:
- Email: admin@mypc.com
- Password: admin123

## Security Notes

For production deployment:
1. Change database password
2. Update `DB_PASS` in `db_config.php`
3. Enable HTTPS
4. Add CSRF protection
5. Implement rate limiting
6. Use prepared statements (already implemented)
