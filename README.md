# MyPC - E-Commerce Platform

A simple and user-friendly e-commerce website for purchasing PC parts.

## 📋 Project Overview

**MyPC** is a web-based e-commerce platform developed for the **Information Assurance and Security** course. The system allows users to browse, search, and purchase PC components online through a secure and intuitive interface.

**Status:** ✅ Production Ready (Educational Use)  
**Version:** 6.1.0  
**Purpose:** Educational/Study Project

## 🌟 Features

✅ User authentication and role-based access control  
✅ Product catalog with 800+ categorized PC parts  
✅ Real-time search and advanced filtering  
✅ Shopping cart and checkout process  
✅ Order management with status tracking (7 statuses)  
✅ Admin/Superadmin/Employee dashboards  
✅ Secure user profiles and address management  
✅ Stock management system  
✅ Educational-friendly architecture  
✅ Copyright-safe product dataset  

## 👥 Team Members

- Arias, Michael
- Mateo, Rex Samuel
- Nachor, Jesenhower

## 🛠️ Technologies Used

- **Frontend:** HTML, CSS, Vanilla JavaScript
- **Backend:** PHP 7.4+
- **Database:** MySQL 5.7+ with InnoDB
- **Server:** XAMPP (Apache + PHP)
- **Version Control:** Git

## 🚀 Quick Start

### 1. Setup Database
```bash
# Create database
mysql -u root -p
CREATE DATABASE mypc_db;
USE mypc_db;
SOURCE db/mypc.sql;
```

### 2. Import Products
```bash
# Option A: Browser (EASIEST)
Visit: http://localhost/InfoSec-MyPC-main/import_products.php

# Option B: MySQL Command Line
mysql -u root -p mypc_db < generated_products.sql

# Option C: phpMyAdmin
- Select mypc_db database
- Click Import tab
- Choose generated_products.sql
```

### 3. Test Login
```
Superadmin: superadmin@test.com / password123
Admin: admin@test.com / password123
Employee: employee@test.com / password123
Customer: customer@test.com / password123
```

### 4. Browse Shop
Visit: http://localhost/InfoSec-MyPC-main/

## 📊 Project Statistics

- **Products:** 800+ items (copyright-safe, algorithmically generated)
- **Variants:** 1,600-2,400 (2-3 per product)
- **Categories:** 8 (Processors, Graphics Cards, Memory, Storage, Motherboards, PSU, Cases, Cooling)
- **Users:** 150 test accounts
- **Orders:** 500 test orders with full status tracking
- **Images:** Royalty-free sources (Unsplash, Pexels, Pixabay)

## 📁 Project Structure

```
InfoSec-MyPC-main/
├── index.html                     # Shop homepage
├── HTML_PHP/                      # Backend API files
│   ├── Database.php              # Database connection
│   ├── auth.php                  # Authentication
│   ├── products.php              # Products API
│   ├── orders.php                # Orders API
│   ├── management.php            # Admin API
│   ├── copyright.html            # Copyright policy ✨ NEW
│   ├── serve-image.php           # Image serving ✨ NEW
│   ├── adminPage.html            # Admin dashboard
│   ├── superadminPage.html       # Superadmin dashboard
│   └── [other pages...]
├── CSS/                          # Stylesheets
├── JS/                           # JavaScript files
├── assets/                       # Product images
├── db/                           # Database schema
├── generated_products.sql        # 800 products ✨ NEW
├── generate_products.py          # Product generator
├── generate_images.py            # Image generator ✨ NEW
├── import_products.php           # Import script ✨ NEW
├── PRODUCT_IMPORT_GUIDE.md       # Import guide ✨ NEW
└── README.md                     # This file
```

## 🔒 Security Features

✅ **Authentication**
- Secure session-based login
- Password hashing
- Role-based access control

✅ **Data Protection**
- Prepared statements (SQL injection prevention)
- Input validation and sanitization
- XSS protection

✅ **Image Security**
- Directory traversal prevention
- MIME type validation
- File access controls

## 📄 Copyright & Attribution

This project is **100% copyright-safe** for educational use:

✅ **Product Data**
- Algorithmically generated (100% fictional)
- Not copied from any manufacturer
- Realistic but original specifications

✅ **Images**
- Royalty-free sources (Unsplash, Pexels, Pixabay)
- Free for commercial and non-commercial use
- No special licensing required

✅ **Code**
- Original implementation
- Educational best practices
- Open for learning and modification

📄 **Full Policy:** See [HTML_PHP/copyright.html](HTML_PHP/copyright.html)

## 📖 Documentation

- [PRODUCT_IMPORT_GUIDE.md](PRODUCT_IMPORT_GUIDE.md) - Complete import instructions
- [HTML_PHP/copyright.html](HTML_PHP/copyright.html) - Copyright & Attribution policy
- [db/mypc.sql](db/mypc.sql) - Database schema
- [generate_products.py](generate_products.py) - Product dataset generator

## 🎯 Purpose

This project demonstrates the application of **information assurance principles** in e-commerce systems, focusing on:

- Data privacy and protection
- Secure authentication and authorization
- System reliability and resilience
- Secure e-commerce workflows
- Database security best practices
- Full-stack web development

## 📈 Recent Updates (Version 6.1.0)

✅ Fixed Order Status Summary display bug  
✅ Refactored search to work across full dataset  
✅ Resolved UI/layout inconsistencies  
✅ Created serve-image.php for secure image serving  
✅ Generated 800-product copyright-safe dataset  
✅ Created automated product import script  
✅ Added comprehensive documentation  
✅ Added copyright compliance policy  

See git log for full changelog.

## ✉️ Questions & Support

**Q: Is this for commercial use?**
A: No. This is for educational purposes only. For commercial use, source real products with proper licensing.

**Q: Can I use the product images?**
A: Yes, they're from royalty-free sources (Unsplash, Pexels, Pixabay). See copyright.html for details.

**Q: How do I add real products?**
A: Create new INSERT statements for the products/product_variants tables, or use the product generator script as a template.

**Q: How do I deploy to production?**
A: Update Database.php with production credentials, source real product data, configure SSL/HTTPS, and set up proper backups.

---

**Last Updated:** January 2024  
**Version:** 6.1.0  
**Status:** ✅ Production Ready (Educational Use)

---

Product images used are royalty-free and sourced from Unsplash, Pexels, and Pixabay.  
No copyright infringement is intended. This project is for educational purposes only.
