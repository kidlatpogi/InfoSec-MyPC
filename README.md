# MyPC Components Store v4.7.8

A full-featured e-commerce platform for PC components built with PHP, MySQL, and vanilla JavaScript.

## 🚀 Quick Start

1. Ensure you have PHP and MySQL installed
2. Start the PHP server:
   ```powershell
   php -S localhost:8080
   ```
3. Open browser: `http://localhost:8080`

## 📁 Project Structure

```
InfoSec-MyPC-4.7.8/
├── serve-image.php          # Image server endpoint (REQUIRED)
├── index.html               # Main entry point
├── HTML_PHP/                # Backend PHP files
│   ├── Database.php         # Database connection class
│   ├── db_config.php        # Database configuration
│   ├── products.php         # Products API
│   ├── login.php            # Authentication
│   └── ...
├── JS/                      # Frontend JavaScript
│   ├── router.js            # Client-side routing
│   ├── script.js            # Main application logic
│   └── api.js               # API helpers
├── CSS/                     # Stylesheets
│   └── styles.css           # Main stylesheet
├── assets/                  # Product images (REQUIRED)
│   ├── AMD CPU/
│   ├── AMD GPU/
│   ├── AMD Motherboard/
│   ├── CASE/
│   ├── CPU Coolers/
│   ├── DDR4/
│   ├── DDR5/
│   ├── HDD/
│   ├── NVME/              # NVMe SSD images
│   ├── PSU/
│   └── SATA SSD/          # SATA SSD images
└── db/                      # Database files (REQUIRED)
    ├── mypc.sql             # Database structure
    ├── inserts.sql          # Initial products
    └── add_storage_products.sql  # NVMe & SATA SSDs
```

## 📦 What's Included

### Products (115 Total)
- **Processors**: 10 AMD CPUs (Ryzen 5/7/9)
- **Graphics Cards**: 10 AMD GPUs (RX 6000/7000/9000 series)
- **Motherboards**: 10 AM4/AM5 boards
- **Cases**: 15 ATX/mATX/ITX cases
- **CPU Coolers**: 10 air & AIO coolers
- **Memory**: 
  - 10 DDR4 kits
  - 10 DDR5 kits
- **Storage**:
  - 10 HDDs (enterprise & consumer)
  - **10 NVMe SSDs** (PCIe 3.0/4.0/5.0)
  - **10 SATA SSDs** (2.5" SATA III)
- **Power Supplies**: 10 PSUs (750W-1000W)

### Features
- ✅ Product browsing with categories
- ✅ Search and filtering
- ✅ Shopping cart
- ✅ User authentication (Login/Register)
- ✅ Admin dashboard
- ✅ Product management
- ✅ Secure image serving
- ✅ Responsive design

## 🔒 Security Features
- PDO prepared statements (SQL injection protection)
- Input sanitization (XSS protection)
- Secure password hashing (bcrypt)
- Path traversal protection in image server
- Content Security Policy headers

## 💾 Database
- **Name**: `mypc_db`
- **Tables**: 13 (categories, products, product_variants, product_images, users, etc.)
- **Default Credentials**:
  - Admin: `superadmin@mypc.com` / `password123`

## ⚙️ Requirements
- PHP 7.4 or higher
- MySQL 5.7 or higher
- Modern web browser

## 🛠️ Development
```powershell
# Start development server
php -S localhost:8080

# Access application
http://localhost:8080
```

## 📝 Important Files

### Must Have on Every Computer
1. **serve-image.php** - Without this, images won't load!
2. **assets/** folder - All product images
3. **db/** folder - All SQL files for setup

### Database Import Order
1. `db/mypc.sql` - Creates tables
2. `db/inserts.sql` - Adds 95 products
3. `db/add_storage_products.sql` - Adds 20 storage products

## 🐛 Troubleshooting

### Images Not Loading?
- Check if `serve-image.php` exists in root directory
- Verify `assets/` folder is present with all subfolders
- Check browser console for 404 errors

### Database Issues?
- Ensure all 3 SQL files were imported in order
- Check credentials in `HTML_PHP/Database.php`
- Verify MySQL service is running

### Product Count Wrong?
Should be **115 products** total. If less:
```sql
-- Check current count
SELECT COUNT(*) FROM products;

-- If missing storage products, run:
SOURCE ./db/add_storage_products.sql;
```

## 📚 Documentation
- [PRODUCT_IMAGES_FIX.md](./PRODUCT_IMAGES_FIX.md) - Image fix documentation

## 📄 License
Educational project for Information Security course.

## 🙋 Support
For setup issues, check:
- Browser console (F12) for frontend errors
- PHP error logs for backend issues
- MySQL logs for database problems

---

**Version**: 4.7.8  
**Last Updated**: 2025-12-10  
**Status**: ✅ Production Ready
