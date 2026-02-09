# InfoSec-MyPC Setup Guide

## How to Run This Project

### 1. Install XAMPP
- Download XAMPP from https://www.apachefriends.org/
- Install to `C:\xampp`

### 2. Start XAMPP
- Open **XAMPP Control Panel**
- Click **Start** for **Apache**
- Click **Start** for **MySQL**

### 3. Clone the Repository
- Open File Explorer and go to `C:\xampp\htdocs`
- Right-click → **Open in Terminal**
- Run:
  ```bash
  git clone https://github.com/kidlatpogi/InfoSec-MyPC.git
  cd InfoSec-MyPC
  ```

### 4. Create Database
- Open browser and go to: `http://localhost/phpmyadmin`
- Click **New** → Create database named `mypc_db`
- Collation: `utf8mb4_unicode_ci`

### 5. Import Database Files
- In phpMyAdmin, select `mypc_db` database
- Click **Import** tab
- Import these files **in order**:
  1. `db/1 mypc_complete.sql`
  2. `db/2 products_inserts.sql`
  3. `db/3 users_insert.sql`
  4. `db/4 sales_insert.sql`
  5. `db/5 security_updates.sql`
  6. `db/6 security_logs.sql`

### 6. Access the Website
- Open browser
- Go to: `http://localhost/InfoSec-MyPC/`

---

## Default Login Accounts

| Role | Email | Password |
|------|-------|----------|
| Customer | `customer@mypc.com` | `@dmin123` |
| Employee | `employee@mypc.com` | `@dmin123` |
| Admin | `admin@mypc.com` | `@dmin123` |
| Superadmin | `superadmin@mypc.com` | `@dmin123` |

