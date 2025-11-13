# 🛡️ Admin Dashboard - MyPC E-Commerce

## Test Credentials

### Superadmin Account
**Email:** `superadmin@mypc.com`  
**Password:** `superadmin123`

### Admin Account
**Email:** `admin@mypc.com`  
**Password:** `admin123`

### Employee Accounts
**Email:** `employee@mypc.com`  
**Password:** `emp123`

**Email:** `staff@mypc.com`  
**Password:** `staff123`

### Test Customer Account (for reference)
**Email:** `test@example.com`  
**Password:** `test123`

---

## How to Access the Dashboards

### Superadmin Dashboard

1. **Login First:**
   - Go to http://localhost:8000/login
   - Enter superadmin credentials
   - Click Login

2. **Navigate to Superadmin Dashboard:**
   - After login, you'll see a **👑 Superadmin** link (amber) in the top navbar
   - Click it to access the superadmin dashboard
   - URL: http://localhost:8000/superadmin

### Admin Dashboard

1. **Login First:**
   - Go to http://localhost:8000/login
   - Enter admin credentials
   - Click Login

2. **Navigate to Admin Dashboard:**
   - After login, you'll see an **⚙️ Admin** link (red) in the top navbar
   - Click it to access the admin dashboard
   - URL: http://localhost:8000/admin

### Employee Dashboard

1. **Login First:**
   - Go to http://localhost:8000/login
   - Enter employee credentials (employee@mypc.com or staff@mypc.com)
   - Click Login

2. **Navigate to Employee Dashboard:**
   - After login, you'll see a **📦 Dashboard** link (blue) in the top navbar
   - Click it to access the employee dashboard
   - URL: http://localhost:8000/employee

---

## Superadmin Dashboard Features

Superadmins have **full system control** and can manage everything: users, admins, employees, products, and orders.

### 1. 👑 Manage Admins

#### View All Admins
- Table showing all admin accounts (excluding superadmins)
- Displays: ID, Email, Name, Status, Created Date
- Search bar to filter admins by email or name

#### Create New Admin
- Click **+ Add New Admin** button
- Fill in:
  - Email address
  - Full name
  - Password (auto-generated as "admin123" if empty)
- Click Save
- New admin can login and access the Admin Dashboard

#### Edit Admin
- Click **Edit** button on any admin row
- Modify email, name, or password
- Leave password empty to keep current password
- Click Save

#### Delete Admin
- Click **Delete** button on any admin row
- Confirm deletion
- Admin account removed permanently

### 2. 👥 Manage Users

#### View All Users
- Table showing all registered users
- Displays: ID, Email, Name, Status, Created Date
- Search bar to filter users by email or name

#### Create New User
- Click **+ Add New User** button
- Fill in:
  - Email address
  - Full name
  - Password (auto-generated as "user123" if empty)
- Click Save

#### Edit User
- Click **Edit** button on any user row
- Modify email, name
- Leave password empty to keep current password
- Click Save

#### Delete User
- Click **Delete** button on any user row
- Confirm deletion
- User removed permanently

### 3. 👔 Manage Employees

#### View All Employees
- Table showing all employee accounts
- Displays: ID, Email, Name, Status, Created Date
- Search bar to filter employees by email or name

#### Create New Employee
- Click **+ Add New Employee** button
- Fill in:
  - Email address
  - Full name
  - Password (auto-generated as "emp123" if empty)
- Click Save
- New employee can login and access the Employee Dashboard

#### Edit Employee
- Click **Edit** button on any employee row
- Modify email, name, or password
- Leave password empty to keep current password
- Click Save

#### Delete Employee
- Click **Delete** button on any employee row
- Confirm deletion
- Employee account removed permanently

### 4. 📦 Manage Products

#### View All Products
- Table showing all products (8 built-in + any custom)
- Displays: ID, Title, Category, Price, Number of Variants
- Search bar to filter by name or category

#### View Product Details
- Click **View** button to see full product JSON
- Includes all variants and pricing info

#### Create New Product
- Click **+ Add New Product** button
- Fill in:
  - **Product Title:** e.g., "RTX 4080 GPU"
  - **Category:** e.g., "GPU", "CPU", "RAM", etc.
  - **Price:** In Philippine Pesos (₱)
  - **Variants:** JSON array of variants
    ```json
    [
      {"label":"Standard","priceDelta":0},
      {"label":"Premium","priceDelta":2000}
    ]
    ```
- Click Save
- Product appears in shop immediately (requires page refresh to see)

#### Edit Product
- Click **Edit** button on any product row
- Modify any field (title, category, price, variants)
- Variants must be valid JSON
- Click Save

#### Delete Product
- Click **Delete** button on any product row
- Confirm deletion
- Product removed permanently from shop

### 5. 📋 Manage Orders

#### View All Orders
- Table showing all customer orders
- Displays: Order ID, Customer Email, Total, Status, Date
- Search bar to filter orders by order ID or customer email

#### View Order Details
- Click **View** button on any order row
- Modal shows:
  - Order ID
  - Customer email
  - Order date
  - Item list with quantities and prices
  - Total amount

#### Update Order Status
- Click **Update** button on any order row
- Change status in the dropdown:
  - Pending
  - Shipped
  - Delivered
  - Cancelled
- Click "Update Status" button to save

---

## Admin Dashboard Features

Admins can manage **user and employee accounts** only, and can view orders (but cannot manage products).

### 1. 👥 Manage Users

#### View All Users
- Table showing all registered users
- Displays: ID, Email, Name, Status, Created Date
- Search bar to filter users by email or name

#### Create New User
- Click **+ Add New User** button
- Fill in:
  - Email address
  - Full name
  - Password (auto-generated as "user123" if empty)
- Click Save

#### Edit User
- Click **Edit** button on any user row
- Modify email, name
- Leave password empty to keep current password
- Click Save

#### Delete User
- Click **Delete** button on any user row
- Confirm deletion
- User removed permanently

### 2. 👔 Manage Employees

#### View All Employees
- Table showing all employee accounts
- Displays: ID, Email, Name, Status, Created Date
- Search bar to filter employees by email or name

#### Create New Employee
- Click **+ Add New Employee** button
- Fill in:
  - Email address
  - Full name
  - Password (auto-generated as "emp123" if empty)
- Click Save
- New employee can login and access the Employee Dashboard

#### Edit Employee
- Click **Edit** button on any employee row
- Modify email, name, or password
- Leave password empty to keep current password
- Click Save

#### Delete Employee
- Click **Delete** button on any employee row
- Confirm deletion
- Employee account removed permanently

---

## Employee Dashboard Features

Employees have access to manage products and view orders, but **cannot** manage users or other employees.

### 1. 📦 Manage Products

#### View All Products
- Table showing all products (8 built-in + any custom)
- Displays: ID, Title, Category, Price, Number of Variants
- Search bar to filter by name or category

#### View Product Details
- Click **View** button to see full product JSON
- Includes all variants and pricing info

#### Create New Product
- Click **+ Add New Product** button
- Fill in:
  - **Product Title:** e.g., "RTX 4080 GPU"
  - **Category:** e.g., "GPU", "CPU", "RAM", etc.
  - **Price:** In Philippine Pesos (₱)
  - **Variants:** JSON array of variants
    ```json
    [
      {"label":"Standard","priceDelta":0},
      {"label":"Premium","priceDelta":2000}
    ]
    ```
- Click Save
- Product appears in shop immediately (requires page refresh to see)

#### Edit Product
- Click **Edit** button on any product row
- Modify any field (title, category, price, variants)
- Variants must be valid JSON
- Click Save

#### Delete Product
- Click **Delete** button on any product row
- Confirm deletion
- Product removed permanently from shop

### 2. 📋 Manage Orders

#### View All Orders
- Same as Admin Dashboard
- Employees can view and update order status

#### View Order Details
- Click **View** button on any order row
- See order information and items

#### Update Order Status
- Click **Update** button on any order row
- Change status as needed

---

## Access Control & Role Hierarchy

- **Superadmin (isSuperAdmin: true)** → `/superadmin` → Manage Everything (Users, Admins, Employees, Products, Orders)
- **Admin (isAdmin: true)** → `/admin` → Manage Users & Employees only
- **Employee (isEmployee: true)** → `/employee` → Manage Products & Orders only
- **Regular User** → `/profile` → View profile, cart, orders only

---

## Data Storage

All data is stored in **browser localStorage**:

- **Users:** `localStorage['mypc_admin_users']` - JSON array
- **Employees:** `localStorage['mypc_admin_employees']` - JSON array
- **Products:** `localStorage['mypc_admin_products']` - JSON array
- **Orders:** `localStorage['mypc_admin_orders']` - JSON array

**Note:** This is a demo implementation. In production, you would:
- Use a backend database (MongoDB, PostgreSQL, etc.)
- Implement proper authentication & authorization
- Add data validation and error handling
- Implement proper access control (RBAC)

---

## User Types & Roles

### 1. Regular User (Customer)
- Can browse products
- Can add items to cart
- Can checkout
- Can view profile and order history
- Cannot access admin/employee/superadmin features

### 2. Employee
- Can login to Employee Dashboard
- Can create, edit, delete products
- Can view and update order status
- Cannot manage users or employees

### 3. Admin
- Can login to Admin Dashboard
- Can manage user accounts (create, edit, delete)
- Can manage employee accounts (create, edit, delete)
- Can view and update order status
- Cannot create new admins or manage products

### 4. Superadmin
- Can login to Superadmin Dashboard
- Full system control
- Can create, edit, delete admins
- Can manage user accounts
- Can manage employee accounts
- Can manage products
- Can view and update order status

---

## Default Accounts (Auto-created on First Visit)

### Users:
1. **superadmin@mypc.com** / `superadmin123` → Superadmin
2. **admin@mypc.com** / `admin123` → Admin
3. **test@example.com** / `test123` → Regular User

### Employees:
1. **employee@mypc.com** / `emp123` → Employee
2. **staff@mypc.com** / `staff123` → Employee

---

## Example Workflows

### Creating an Admin Account (Superadmin Only)
1. Login as superadmin@mypc.com
2. Go to Superadmin Dashboard
3. Click **Manage Admins** tab
4. Click "+ Add New Admin"
5. Enter:
   - Email: `newadmin@mypc.com`
   - Name: `New Admin`
   - Password: `secure123` (optional, defaults to `admin123`)
6. Click Save
7. New admin can now login with their credentials and access Admin Dashboard

### Creating an Employee Account (Admin or Superadmin)
1. Login as admin@mypc.com or superadmin@mypc.com
2. Go to Admin or Superadmin Dashboard
3. Click **Manage Employees** tab
4. Click "+ Add New Employee"
5. Enter:
   - Email: `newemployee@mypc.com`
   - Name: `New Staff Member`
   - Password: `secure123` (optional, defaults to `emp123`)
6. Click Save
7. New employee can now login and access Employee Dashboard

### Managing Products as Employee
1. Login as employee@mypc.com
2. Go to Employee Dashboard (📦 Dashboard link)
3. Click "+ Add New Product"
4. Fill in product details with JSON variants
5. Product immediately available in shop for customers

### Full System Management (Superadmin)
1. Login as superadmin@mypc.com
2. Access Superadmin Dashboard
3. Switch between tabs to:
   - Manage all Admins
   - Manage all Users
   - Manage all Employees
   - Manage all Products
   - Manage all Orders
4. Have complete control over the entire system

---

## Admin Dashboard Interface

### Tabs

**Superadmin:**
- **👑 Manage Admins** - Admin account management
- **👥 Manage Users** - User account management
- **👔 Manage Employees** - Employee account management
- **📦 Manage Products** - Product management
- **📋 Manage Orders** - Order management

**Admin:**
- **👥 Manage Users** - User account management
- **👔 Manage Employees** - Employee account management

**Employee:**
- **📦 Manage Products** - Product management
- **📋 Manage Orders** - Order management

### Action Buttons
- **✏️ Edit** (Blue) - Modify existing item
- **🗑️ Delete** (Red) - Remove item
- **👁️ View** (Green) - View details (orders/products)
- **📊 Update** (Green) - Update status (orders only)

### Modals
- **Add/Edit Admin Modal** (Superadmin only)
- **Add/Edit User Modal** - User account form
- **Add/Edit Employee Modal** - Employee account form
- **Add/Edit Product Modal** - Product form with JSON variant field
- **Order Details Modal** - Order information and status update
- **Confirm Delete Modal** - Safety confirmation before deletion

### Search & Filter
- Real-time search on all tabs
- Filter by email, name, order ID as appropriate
- Instant results as you type

---

## Features & Capabilities

### Superadmin Management
✅ Create/edit/delete admins  
✅ Create/edit/delete users  
✅ Create/edit/delete employees  
✅ Full product management  
✅ Full order management  
✅ Complete system control  

### Admin Management
✅ Create/edit/delete users  
✅ Create/edit/delete employees  
✅ View and update order status  
✅ Cannot manage other admins or products  

### Employee Management
✅ Create/edit/delete products  
✅ View and update order status  
✅ Cannot manage users or other employees  

### Product Management
✅ Create products with multiple variants  
✅ Edit all product details  
✅ Delete products  
✅ Search products  
✅ View product details  
✅ Auto-assign placeholder SVG images  
✅ Support for price variants  

### Order Management
✅ View all customer orders  
✅ Search orders by ID or customer  
✅ View detailed order information  
✅ Update order status (Pending → Shipped → Delivered)  
✅ Track order dates  

### UI/UX
✅ Clean, professional dashboard design  
✅ Responsive on desktop, tablet, mobile  
✅ Tab-based navigation  
✅ Modal dialogs for add/edit/delete  
✅ Real-time search filtering  
✅ Confirmation dialogs for destructive actions  
✅ Success/error alerts  
✅ Color-coded action buttons  
✅ Status badges  

---

## Security Notes

⚠️ **Demo Implementation** - Not production-ready!

**Security Considerations:**
- Passwords stored in plain text (localStorage) - use hashing in production
- No session expiration - implement timeouts
- No role-based access control (RBAC) - implement proper authorization
- No audit logs - track all admin/employee actions
- No data encryption - encrypt sensitive data
- Browser-based storage - use secure backend database
- No HTTPS/SSL - always use HTTPS in production
- Anyone with browser access can access localStorage - implement session management

For production, integrate with:
- Backend API (Node.js, Python, etc.)
- Database (MongoDB, PostgreSQL, etc.)
- Authentication service (JWT, OAuth, etc.)
- Admin verification/2FA

---

## Customization

### Change Dashboard Colors
In `CSS/admin.css`, search for:
```css
.admin-header h1 {
    color: var(--accent);
}
```

### Change Table Styling
Modify in `CSS/admin.css`:
```css
.admin-table thead {
    background: var(--surface);
}
```

### Add More Dashboard Functions
Add new functions to `JS/script.js` in the "ADMIN FUNCTIONS" section

### Extend User Fields
Modify `getAdminUsers()`, `saveUser()`, and related functions to include additional fields

---

## Troubleshooting

**Q: Superadmin link not showing after login?**  
A: Make sure you're logged in with superadmin@mypc.com (not a regular user or admin)

**Q: Admin link not showing after login?**  
A: Make sure you're logged in with admin@mypc.com (not a regular user)

**Q: Employee link not showing after login?**  
A: Make sure you're logged in with an employee account (employee@mypc.com or staff@mypc.com)

**Q: Can't add products with JSON?**  
A: Ensure variants JSON is valid. Copy example format exactly.

**Q: Changes not persisting?**  
A: Check browser's Developer Tools → Application → localStorage

**Q: Dashboard shows "Access denied"?**  
A: You must be logged in with the correct account type

**Q: Can't find Manage Employees tab?**  
A: This tab is available in Admin and Superadmin dashboards only

---

## Browser Support

✅ Chrome/Chromium (recommended)  
✅ Firefox  
✅ Safari  
✅ Edge  

LocalStorage support required (all modern browsers)

---

**Happy administrating! 🎉**

---

## How to Access the Dashboards

### Admin Dashboard

1. **Login First:**
   - Go to http://localhost:8000/login
   - Enter admin credentials
   - Click Login

2. **Navigate to Admin Dashboard:**
   - After login, you'll see an **⚙️ Admin** link (red) in the top navbar
   - Click it to access the admin dashboard
   - URL: http://localhost:8000/admin

### Employee Dashboard

1. **Login First:**
   - Go to http://localhost:8000/login
   - Enter employee credentials (employee@mypc.com or staff@mypc.com)
   - Click Login

2. **Navigate to Employee Dashboard:**
   - After login, you'll see a **📦 Dashboard** link (blue) in the top navbar
   - Click it to access the employee dashboard
   - URL: http://localhost:8000/employee

---

## Admin Dashboard Features

### 1. 👥 Manage Users

#### View All Users
- Table showing all registered users
- Displays: ID, Email, Name, Status, Created Date
- Search bar to filter users by email or name

#### Create New User
- Click **+ Add New User** button
- Fill in:
  - Email address
  - Full name
  - Password (auto-generated as "user123" if empty)
  - Check "Admin User" box to grant admin privileges
- Click Save

#### Edit User
- Click **Edit** button on any user row
- Modify email, name, admin status
- Leave password empty to keep current password
- Click Save

#### Delete User
- Click **Delete** button on any user row
- Confirm deletion
- User removed permanently

---

### 2. 👔 Manage Employees

#### View All Employees
- Table showing all employee accounts
- Displays: ID, Email, Name, Status, Created Date
- Search bar to filter employees by email or name

#### Create New Employee
- Click **+ Add New Employee** button
- Fill in:
  - Email address
  - Full name
  - Password (auto-generated as "emp123" if empty)
- Click Save
- New employee can login and access the Employee Dashboard

#### Edit Employee
- Click **Edit** button on any employee row
- Modify email, name, or password
- Leave password empty to keep current password
- Click Save

#### Delete Employee
- Click **Delete** button on any employee row
- Confirm deletion
- Employee account removed permanently

---

### 3. 📋 Manage Orders

#### View All Orders
- Table showing all customer orders
- Displays: Order ID, Customer Email, Total, Status, Date
- Search bar to filter orders by order ID or customer email

#### View Order Details
- Click **View** button on any order row
- Modal shows:
  - Order ID
  - Customer email
  - Order date
  - Item list with quantities and prices
  - Total amount

#### Update Order Status
- Click **Update** button on any order row
- Change status in the dropdown:
  - Pending
  - Shipped
  - Delivered
  - Cancelled
- Click "Update Status" button to save

---

## Employee Dashboard Features

Employees have access to manage products and view orders, but **cannot** manage users or other employees.

### 1. 📦 Manage Products

#### View All Products
- Table showing all products (8 built-in + any custom)
- Displays: ID, Title, Category, Price, Number of Variants
- Search bar to filter by name or category

#### View Product Details
- Click **View** button to see full product JSON
- Includes all variants and pricing info

#### Create New Product
- Click **+ Add New Product** button
- Fill in:
  - **Product Title:** e.g., "RTX 4080 GPU"
  - **Category:** e.g., "GPU", "CPU", "RAM", etc.
  - **Price:** In Philippine Pesos (₱)
  - **Variants:** JSON array of variants
    ```json
    [
      {"label":"Standard","priceDelta":0},
      {"label":"Premium","priceDelta":2000}
    ]
    ```
- Click Save
- Product appears in shop immediately (requires page refresh to see)

#### Edit Product
- Click **Edit** button on any product row
- Modify any field (title, category, price, variants)
- Variants must be valid JSON
- Click Save

#### Delete Product
- Click **Delete** button on any product row
- Confirm deletion
- Product removed permanently from shop

### 2. 📋 Manage Orders

#### View All Orders
- Same as Admin Dashboard
- Employees can view and update order status

#### View Order Details
- Click **View** button on any order row
- See order information and items

#### Update Order Status
- Click **Update** button on any order row
- Change status as needed

---

## Access Control

- **Admin (isAdmin: true)** → Access to `/admin` route → Manage Users & Employees, View Orders
- **Employee (isEmployee: true)** → Access to `/employee` route → Manage Products, View Orders
- **Regular User** → Access to `/profile` → View profile, cart, orders (no admin/employee features)

---

## Data Storage

All data is stored in **browser localStorage**:

- **Users:** `localStorage['mypc_admin_users']` - JSON array
- **Employees:** `localStorage['mypc_admin_employees']` - JSON array
- **Products:** `localStorage['mypc_admin_products']` - JSON array
- **Orders:** `localStorage['mypc_admin_orders']` - JSON array

**Note:** This is a demo implementation. In production, you would:
- Use a backend database (MongoDB, PostgreSQL, etc.)
- Implement proper authentication & authorization
- Add data validation and error handling
- Implement proper access control (RBAC)

---

## User Types & Roles

### 1. Regular User (Customer)
- Can browse products
- Can add items to cart
- Can checkout
- Can view profile and order history
- Cannot access admin or employee features

### 2. Employee
- Can login to Employee Dashboard
- Can create, edit, delete products
- Can view and update order status
- Cannot manage users or other employees

### 3. Admin
- Can login to Admin Dashboard
- Can manage user accounts (create, edit, delete)
- Can manage employee accounts (create, edit, delete)
- Can view and update order status
- Full system control

---

## Default Accounts (Auto-created on First Visit)

### Users:
1. **admin@mypc.com** / `admin123` → Admin
2. **test@example.com** / `test123` → Regular User

### Employees:
1. **employee@mypc.com** / `emp123` → Employee
2. **staff@mypc.com** / `staff123` → Employee

---

## Example Workflows

### Creating an Employee Account
1. Login as admin@mypc.com
2. Go to Admin Dashboard
3. Click **Manage Employees** tab
4. Click "+ Add New Employee"
5. Enter:
   - Email: `newemployee@mypc.com`
   - Name: `New Staff Member`
   - Password: `secure123` (optional, defaults to `emp123`)
6. Click Save
7. New employee can now login with their credentials and access Employee Dashboard

### Promoting a User to Admin
1. Login as admin@mypc.com
2. Go to Admin Dashboard
3. Click **Manage Users** tab
4. Click **Edit** on the user you want to promote
5. Check "Admin User" checkbox
6. Click Save
7. User now has admin access and will see the ⚙️ Admin link in navbar

### Creating and Managing Products as Employee
1. Login as employee@mypc.com
2. Go to Employee Dashboard (📦 Dashboard link)
3. Click "+ Add New Product"
4. Fill in product details with JSON variants
5. Product immediately available in shop for customers

---

## Admin Dashboard Interface

### Tabs
- **👥 Manage Users** - User account management (CRUD)
- **👔 Manage Employees** - Employee account management (CRUD)
- **📋 Manage Orders** - View and update order status

### Action Buttons
- **✏️ Edit** (Blue) - Modify existing item
- **🗑️ Delete** (Red) - Remove item
- **👁️ View** (Green) - View details (orders/products)
- **📊 Update** (Green) - Update status (orders only)

### Modals
- **Add/Edit User Modal** - User account form
- **Add/Edit Employee Modal** - Employee account form
- **Order Details Modal** - Order information and status update
- **Confirm Delete Modal** - Safety confirmation before deletion

### Search & Filter
- Real-time search on all tabs
- Filter users by email or name
- Filter employees by email or name
- Filter orders by order ID or customer email

---

## Features & Capabilities

### User Management
✅ Create users with or without admin privileges  
✅ Edit user details and permissions  
✅ Delete users  
✅ Search users  
✅ View user status (Active/Inactive)  
✅ See user creation date  

### Employee Management
✅ Create employee accounts  
✅ Edit employee details  
✅ Delete employees  
✅ Search employees  
✅ View employee status  

### Product Management
✅ Create products with multiple variants  
✅ Edit all product details  
✅ Delete products  
✅ Search products  
✅ View product details  
✅ Auto-assign placeholder SVG images  
✅ Support for price variants  

### Order Management
✅ View all customer orders  
✅ Search orders by ID or customer  
✅ View detailed order information  
✅ Update order status (Pending → Shipped → Delivered)  
✅ Track order dates  

### UI/UX
✅ Clean, professional dashboard design  
✅ Responsive on desktop, tablet, mobile  
✅ Tab-based navigation  
✅ Modal dialogs for add/edit/delete  
✅ Real-time search filtering  
✅ Confirmation dialogs for destructive actions  
✅ Success/error alerts  
✅ Color-coded action buttons  
✅ Status badges  

---

## Security Notes

⚠️ **Demo Implementation** - Not production-ready!

**Security Considerations:**
- Passwords stored in plain text (localStorage) - use hashing in production
- No session expiration - implement timeouts
- No role-based access control (RBAC) - implement proper authorization
- No audit logs - track all admin/employee actions
- No data encryption - encrypt sensitive data
- Browser-based storage - use secure backend database
- No HTTPS/SSL - always use HTTPS in production
- Anyone with browser access can access localStorage - implement session management

For production, integrate with:
- Backend API (Node.js, Python, etc.)
- Database (MongoDB, PostgreSQL, etc.)
- Authentication service (JWT, OAuth, etc.)
- Admin verification/2FA

---

## Customization

### Change Dashboard Colors
In `CSS/admin.css`, search for:
```css
.admin-header h1 {
    color: var(--accent);
}
```

### Change Table Styling
Modify in `CSS/admin.css`:
```css
.admin-table thead {
    background: var(--surface);
}
```

### Add More Dashboard Functions
Add new functions to `JS/script.js` in the "ADMIN FUNCTIONS" section

### Extend User Fields
Modify `getAdminUsers()`, `saveUser()`, and related functions to include additional fields

---

## Troubleshooting

**Q: Admin link not showing after login?**  
A: Make sure you're logged in with admin@mypc.com (not a regular user)

**Q: Employee link not showing after login?**  
A: Make sure you're logged in with an employee account (employee@mypc.com or staff@mypc.com)

**Q: Can't add products with JSON?**  
A: Ensure variants JSON is valid. Copy example format exactly.

**Q: Changes not persisting?**  
A: Check browser's Developer Tools → Application → localStorage

**Q: Dashboard shows "Access denied"?**  
A: You must be logged in with the correct account type (admin for /admin, employee for /employee)

**Q: Can't find Manage Employees tab?**  
A: Make sure you're logged in as admin@mypc.com. Manage Employees is only available in Admin Dashboard.

---

## Browser Support

✅ Chrome/Chromium (recommended)  
✅ Firefox  
✅ Safari  
✅ Edge  

LocalStorage support required (all modern browsers)

---

**Happy administrating and managing! 🎉**
