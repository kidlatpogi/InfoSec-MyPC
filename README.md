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

- Run git bash:

  git clone https://github.com/kidlatpogi/InfoSec-MyPC.git
  cd InfoSec-MyPC
  code .

### 4. Create Database
- Open **MySQL Workbench**
- Connect to local MySQL server (root user, no password)
- Create new schema: `mypc_db`
- Collation: `utf8mb4_unicode_ci`

### 5. Import Database Files
- In MySQL Workbench, select `mypc_db` schema
- Go to **File** → **Open SQL Script**
- Import these files **in order**:
  1. `db/1 mypc_complete.sql` → Execute (⚡)
  2. `db/2 products_inserts.sql` → Execute (⚡)
  3. `db/3 users_insert.sql` → Execute (⚡)
  4. `db/4 sales_insert.sql` → Execute (⚡)
  5. `db/5 security_updates.sql` → Execute (⚡)
  6. `db/6 security_logs.sql` → Execute (⚡)

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

