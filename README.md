# InfoSec MyPC - PC Component Store 🖥️

A comprehensive e-commerce platform for PC components with advanced user management and security features.

## 🚀 Version 5.1.0

### Features

#### 🔐 Authentication System
- **Multi-role support**: Customer, Employee, Admin, Superadmin
- **Cross-tab logout synchronization** - Logout in one tab = logout in all tabs
- **Session verification** - Prevents cached dashboard access after logout
- **Auto-redirect** - Logged-in users automatically redirected to their dashboard
- **Secure password handling** with PHP password_hash

#### 🛒 E-Commerce Features
- **Product browsing** with search and filters
- **Shopping cart** with real-time updates
- **Checkout system** with order placement
- **Order management** and history
- **Stock tracking** and inventory management

#### 👥 User Management
- **Superadmin Dashboard**: Manage admins, users, employees, products, orders
- **Admin Dashboard**: Manage users, employees, products, orders
- **Employee Dashboard**: Manage products and orders
- **Customer Dashboard**: Browse products, manage cart, place orders

#### 🎨 Modern UI/UX
- **No-flicker navigation** - Smooth transitions between pages
- **Tab persistence** - Remember active tab after refresh
- **Responsive design** - Works on all devices
- **Clean animations** - Smooth fade-ins and transitions

#### 🔒 Security Features
- **SQL injection prevention** with prepared statements
- **XSS protection** with input sanitization
- **Session management** with secure cookies
- **Back button prevention** on dashboards
- **Audit logs** for tracking admin actions
- **Password verification** for sensitive operations

## 📁 Project Structure

```
InfoSec-MyPC-4.5.6/
├── CSS/                    # Stylesheets
│   ├── admin.css
│   ├── navbar.css
│   └── style.css
├── HTML_PHP/              # Pages and API endpoints
│   ├── index.html
│   ├── loginPage.html
│   ├── superadminPage.html
│   ├── adminPage.html
│   ├── employeePage.html
│   ├── management.php
│   ├── orders.php
│   └── db_config.php
├── JS/                    # JavaScript modules
│   ├── script.js          # Core utilities
│   ├── auth.js            # Authentication
│   ├── router.js          # Client-side routing
│   ├── api.js             # API client
│   ├── superadmin.js
│   ├── admin.js
│   ├── employee.js
│   └── checkout.js
└── Database/              # Database schema
    └── database.sql
```

## 🛠️ Installation

### Prerequisites
- PHP 7.4 or higher
- MySQL 5.7 or higher
- Web server (Apache/Nginx) or PHP built-in server

### Setup Steps

1. **Clone the repository**
```bash
git clone https://github.com/kidlatpogi/InfoSec-MyPC.git
cd InfoSec-MyPC
```

2. **Database Setup**
```bash
# Import the database
mysql -u root -p < Database/database.sql
```

3. **Configure Database**
Edit `HTML_PHP/db_config.php`:
```php
define('DB_HOST', 'localhost');
define('DB_NAME', 'mypc_db');
define('DB_USER', 'root');
define('DB_PASS', '');
```

4. **Start the Server**
```bash
# Using PHP built-in server
php -S localhost:8080
```

5. **Access the Application**
Open browser: `http://localhost:8080`

### Default Credentials

**Superadmin:**
- Email: `superadmin@mypc.com`
- Password: `superadmin123`

**Admin:**
- Email: `admin@mypc.com`
- Password: `admin123`

**Employee:**
- Email: `employee@mypc.com`
- Password: `employee123`

## 🎯 Key Features Implemented in v5.1.0

### ✅ Cross-Tab Synchronization
When you logout in one browser tab, all other tabs automatically logout. This prevents session confusion and improves security.

### ✅ Cart Clearing After Checkout
After placing an order, the shopping cart is automatically cleared both in frontend and backend.

### ✅ Back Button Prevention
- Dashboards use `history.pushState` to prevent back button navigation
- After logout, pressing back redirects to landing page instead of showing cached dashboard

### ✅ Session Verification
All dashboard pages verify session on:
- Page load
- Tab visibility change (preventing back button cache)
- Window focus

### ✅ Flicker-Free Experience
- Tabs load without visual flicker
- Dashboard content hidden until session verified
- Smooth fade-in animations (0.15s)

## 🔧 Configuration

### Database Settings
Located in `HTML_PHP/db_config.php`

### Session Settings
- Session timeout: Browser close
- Storage: `localStorage` for client-side, `$_SESSION` for server-side

## 📚 API Endpoints

### Authentication
- `POST /HTML_PHP/management.php?action=login`
- `POST /HTML_PHP/management.php?action=register`
- `POST /HTML_PHP/management.php?action=logout`

### Products
- `GET /HTML_PHP/management.php?action=getProducts`
- `POST /HTML_PHP/management.php?action=createProduct`
- `POST /HTML_PHP/management.php?action=updateProduct`

### Cart
- `GET /HTML_PHP/cart.php`
- `POST /HTML_PHP/cart.php?action=add`
- `POST /HTML_PHP/cart.php?action=update`

### Orders
- `POST /HTML_PHP/orders.php?action=create`
- `GET /HTML_PHP/orders.php`

## 🐛 Known Issues
None at the moment! 🎉

## 📝 Changelog

### Version 5.1.0 (2025-12-09)
- ✅ Added cross-tab logout synchronization
- ✅ Implemented cart clearing after checkout
- ✅ Fixed back button behavior after logout
- ✅ Eliminated tab and dashboard flicker
- ✅ Added session verification on all dashboards
- ✅ Auto-redirect logged-in users to dashboard
- ✅ Improved security with session checks

### Version 5.0.0
- Initial release with multi-role system
- Product management
- Order processing
- User management

## 🤝 Contributing
Pull requests are welcome! For major changes, please open an issue first.

## 📄 License
This project is for educational purposes (InfoSec coursework).

## 👨‍💻 Developer
**kidlatpogi**

## 🙏 Acknowledgments
- PHP for backend
- Vanilla JavaScript for frontend
- MySQL for database

---

**Built with ❤️ for InfoSec Course**
