# InfoSec-MyPC - E-Commerce Platform

A secure PHP-based e-commerce platform for PC components with comprehensive security implementations following industry best practices.

## 🔒 Security Features

This project implements the **5 Security Pillars** from Secure Coding Practices:

1. **Input Validation & Sanitization** - Strict XSS prevention using `htmlspecialchars()` and `filter_input()`
2. **SQL Injection Prevention** - 100% prepared statements with parameterized queries
3. **Secure Password Storage** - ARGON2ID hashing (fallback: BCRYPT cost 12)
4. **Secure Session Management** - HTTPS-only cookies with SameSite=Strict
5. **Comprehensive Logging** - Centralized audit trail for all critical actions

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **XAMPP** (v8.0 or higher) - Includes Apache, MySQL, and PHP
- **Git** - For cloning the repository
- **Modern Web Browser** - Chrome, Firefox, or Edge

## 🚀 Installation & Setup Guide

### Step 1: Install XAMPP

1. Download XAMPP from [https://www.apachefriends.org/](https://www.apachefriends.org/)
2. Run the installer and install XAMPP to `C:\xampp` (default location)
3. During installation, ensure **Apache** and **MySQL** are selected

### Step 2: Start XAMPP Services

1. Open **XAMPP Control Panel** from Start Menu or Desktop
2. Click **Start** button next to **Apache**
3. Click **Start** button next to **MySQL**
4. Wait until both status indicators show **green** and display the port numbers (Apache: 80, MySQL: 3306)

### Step 3: Clone the Repository

1. Open **File Explorer** and navigate to:
   ```
   C:\xampp\htdocs
   ```

2. Open **PowerShell** or **Command Prompt** in this location:
   - Right-click in the folder → **Open in Terminal** (Windows 11)
   - Or press `Shift + Right-Click` → **Open PowerShell window here** (Windows 10)

3. Clone the repository:
   ```bash
   git clone https://github.com/kidlatpogi/InfoSec-MyPC.git
   ```

4. Navigate into the project folder:
   ```bash
   cd InfoSec-MyPC
   ```

### Step 4: Create the Database

1. Open your web browser and go to:
   ```
   http://localhost/phpmyadmin
   ```

2. Click on **"New"** in the left sidebar to create a new database

3. Enter database name: `mypc_db`

4. Select **Collation**: `utf8mb4_unicode_ci`

5. Click **"Create"**

### Step 5: Import Database Tables & Data

Run the SQL files in the following order:

1. In **phpMyAdmin**, click on the `mypc_db` database you just created

2. Click the **"Import"** tab at the top

3. Import each SQL file in this **exact order**:

   **File 1: Core Schema & Sample Data**
   - Click **"Choose File"** button
   - Navigate to: `C:\xampp\htdocs\InfoSec-MyPC\db\`
   - Select: `1 mypc_complete.sql`
   - Click **"Import"** at the bottom
   - Wait for success message ✓

   **File 2: Product Catalog**
   - Click **"Import"** tab again
   - Select: `2 products_inserts.sql`
   - Click **"Import"**
   - Wait for success message ✓

   **File 3: User Accounts**
   - Click **"Import"** tab again
   - Select: `3 users_insert.sql`
   - Click **"Import"**
   - Wait for success message ✓

   **File 4: Sample Sales Data**
   - Click **"Import"** tab again
   - Select: `4 sales_insert.sql`
   - Click **"Import"**
   - Wait for success message ✓

   **File 5: Security Tables (Admin Accounts, Login Tracking, Audit Trail)**
   - Click **"Import"** tab again
   - Select: `5 security_updates.sql`
   - Click **"Import"**
   - Wait for success message ✓

   **File 6: Centralized Security Logs**
   - Click **"Import"** tab again
   - Select: `6 security_logs.sql`
   - Click **"Import"**
   - Wait for success message ✓

4. Verify the import:
   - Click on `mypc_db` in the left sidebar
   - You should see these tables:
     - `addresses`, `admin_accounts`, `audit_logs`, `audit_trail`
     - `cart_items`, `carts`, `categories`
     - `login_attempts`, `orders`, `order_items`
     - `payments`, `products`, `product_images`, `product_variants`
     - `reviews`, `security_logs`, `users`

### Step 6: Configure Database Connection (Optional)

The default configuration works with XAMPP's default settings. If you changed MySQL settings:

1. Open: `C:\xampp\htdocs\InfoSec-MyPC\HTML_PHP\Database.php`

2. Update these lines if needed (lines 11-15):
   ```php
   private $host = 'localhost';     // MySQL host
   private $dbname = 'mypc_db';     // Database name
   private $username = 'root';      // MySQL username
   private $password = '';          // MySQL password (empty by default)
   private $charset = 'utf8mb4';
   ```

### Step 7: Access the Application

1. Open your web browser

2. Navigate to:
   ```
   http://localhost/InfoSec-MyPC/
   ```

3. You should see the **MyPC Landing Page**

## 👤 Default User Accounts

### Customer Account
- **Email:** `customer@mypc.com`
- **Password:** `@dmin123`
- **Access:** Customer dashboard, shopping cart, orders

### Employee Account
- **Email:** `employee@mypc.com`
- **Password:** `@dmin123`
- **Access:** Order management, inventory viewing

### Admin Account
- **Email:** `admin@mypc.com`
- **Password:** `@dmin123`
- **Access:** User management, product management, order management

### Superadmin Account
- **Email:** `superadmin@mypc.com`
- **Password:** `@dmin123`
- **Access:** Full system access, admin management, security logs

**⚠️ IMPORTANT:** Change all default passwords after first login!

## 🗂️ Project Structure

```
InfoSec-MyPC/
├── assets/               # Product images organized by category
│   ├── AMD CPU/
│   ├── Intel CPU/
│   ├── NVIDIA GPU/
│   └── ...
├── CSS/                  # Stylesheets
│   ├── base.css
│   ├── navbar.css
│   ├── auth.css
│   └── ...
├── db/                   # Database SQL files
│   ├── 1 mypc_complete.sql
│   ├── 2 products_inserts.sql
│   ├── 3 users_insert.sql
│   ├── 4 sales_insert.sql
│   ├── 5 security_updates.sql
│   └── 6 security_logs.sql
├── HTML_PHP/             # Backend PHP files & HTML pages
│   ├── auth.php          # User authentication
│   ├── admin_auth.php    # Admin authentication
│   ├── products.php      # Product catalog API
│   ├── cart.php          # Shopping cart API
│   ├── orders.php        # Order management API
│   ├── management.php    # Admin management API
│   ├── Database.php      # PDO database wrapper
│   ├── db_config.php     # Database config & helpers
│   └── ...
├── JS/                   # Frontend JavaScript
│   ├── router.js         # Client-side routing
│   ├── auth.js           # Authentication handlers
│   ├── script.js         # Main application logic
│   └── ...
├── index.html            # Main entry point
└── README.md             # This file
```

## 🔧 Troubleshooting

### Apache Won't Start
- **Error:** "Port 80 is already in use"
- **Solution:** 
  1. Check if IIS or Skype is using port 80
  2. Stop IIS: Open Services → Stop "World Wide Web Publishing Service"
  3. Or change Apache port in XAMPP Config → Apache (httpd.conf) → Change `Listen 80` to `Listen 8080`

### MySQL Won't Start
- **Error:** "Port 3306 is already in use"
- **Solution:**
  1. Check if another MySQL service is running
  2. Open Services → Stop "MySQL" service
  3. Or change MySQL port in XAMPP Config

### Database Import Fails
- **Error:** "Table already exists"
- **Solution:**
  1. In phpMyAdmin, select `mypc_db`
  2. Click "Operations" tab
  3. Scroll down and click "Drop the database (DROP)"
  4. Recreate database and import again in order

### Images Not Loading
- **Error:** Product images show broken icon
- **Solution:**
  1. Verify folder exists: `C:\xampp\htdocs\InfoSec-MyPC\assets\`
  2. Check Apache is running
  3. Clear browser cache (Ctrl + Shift + Delete)
  4. Verify image paths in database match actual folder structure

### Can't Login / Session Issues
- **Error:** "Not authenticated" or logout immediately after login
- **Solution:**
  1. Clear browser cookies and cache
  2. Check if cookies are enabled in browser
  3. For local development, you may need to temporarily set `secure => false` in session config files if not using HTTPS

### "Maximum execution time exceeded" during import
- **Solution:**
  1. In phpMyAdmin, click "Import" tab
  2. Scroll down to "Other options"
  3. Increase "Maximum execution time" to 600 seconds
  4. Try importing again

## 📚 Key Features

### For Customers
- Browse products by category
- Search and filter products
- Add items to cart
- Manage multiple shipping addresses
- Place orders with various payment methods
- Track order status
- View order history

### For Employees
- View all customer orders
- Update order status (pending → processing → shipped → completed)
- Access inventory levels
- View sales analytics

### For Admins
- Manage users (create, update, archive, reactivate)
- Manage employees
- Manage products and inventory
- View comprehensive sales analytics
- Access audit logs
- Unlock locked accounts

### For Superadmins
- All admin capabilities
- Manage admin accounts
- View comprehensive security logs
- Access authentication activity reports
- System-level configurations

## 🔐 Security Implementation Details

### Password Hashing
```php
// Uses ARGON2ID (preferred) or BCRYPT cost 12
securePasswordHash($password)
```

### Session Security
```php
session_set_cookie_params([
    'secure' => true,        // HTTPS only
    'httponly' => true,      // No JavaScript access
    'samesite' => 'Strict'   // CSRF protection
]);
```

### SQL Injection Prevention
```php
// All queries use prepared statements
$db->query("SELECT * FROM users WHERE email = ?", [$email]);
```

### Input Sanitization
```php
// XSS prevention
$clean = htmlspecialchars($input, ENT_QUOTES, 'UTF-8');

// Email validation
$email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
```

### Centralized Logging
```php
// Audit trail for all critical actions
logAction($user_id, $role, 'LOGIN', 'User login successful');
```

## 🛡️ Security Best Practices

1. **Always use HTTPS in production** - Update all `secure => true` session parameters
2. **Change default passwords** - All default accounts use `@dmin123`
3. **Regular backups** - Export database regularly via phpMyAdmin
4. **Monitor audit logs** - Check `security_logs` and `audit_trail` tables regularly
5. **Update dependencies** - Keep XAMPP and PHP updated
6. **Enable error logging** - Don't display errors to users in production

## 📝 Development Notes

- PHP version: 8.0 or higher recommended
- Database: MySQL 5.7+ or MariaDB 10.2+
- Session storage: Server-side (PHP sessions)
- Password hashing: ARGON2ID (preferred) / BCRYPT (fallback)
- Character encoding: UTF-8 throughout

## 📞 Support & Contact

For issues, questions, or contributions:
- GitHub Issues: [https://github.com/kidlatpogi/InfoSec-MyPC/issues](https://github.com/kidlatpogi/InfoSec-MyPC/issues)
- Repository: [https://github.com/kidlatpogi/InfoSec-MyPC](https://github.com/kidlatpogi/InfoSec-MyPC)

## 📄 License

This project is developed for educational purposes as part of Information Security coursework.

---

**Built with security in mind** 🔒 | **Last updated:** February 9, 2026

