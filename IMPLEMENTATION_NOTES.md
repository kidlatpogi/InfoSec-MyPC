# Management & Address API Implementation

## Summary of Changes

This implementation completes the following features:

### 1. **Backend Management API** (`management.php`)
- **Admin Management**: Superadmin can create, read, update, and delete admins
- **User Management**: Admin/Superadmin can create, read, update, and delete users
- **Employee Management**: Admin/Superadmin can create, read, update, and delete employees
- **Address Management**: All users can manage their addresses (create, read, update, delete)

**Key Features**:
- Role-based access control (superadmin only for admin operations, admin+ for user/employee ops)
- Address ownership validation (users can only manage their own addresses)
- Default address support (only one default per user)
- Status tracking (active/suspended) for user accounts

### 2. **Frontend API Integration** (`api.js`)

Added three new API object namespaces:

#### ManagementAPI
```javascript
// Admin operations (superadmin only)
ManagementAPI.getAdmins()
ManagementAPI.createAdmin(email, password, firstName, lastName, phone)
ManagementAPI.updateAdmin(adminId, updates)
ManagementAPI.deleteAdmin(adminId)

// User operations (admin+)
ManagementAPI.getUsers()
ManagementAPI.createUser(email, password, firstName, lastName, phone)
ManagementAPI.updateUser(userId, updates)
ManagementAPI.deleteUser(userId)

// Employee operations (admin+)
ManagementAPI.getEmployees()
ManagementAPI.createEmployee(email, password, firstName, lastName, phone)
ManagementAPI.updateEmployee(employeeId, updates)
ManagementAPI.deleteEmployee(employeeId)
```

#### AddressesAPI
```javascript
AddressesAPI.getAddresses(userId)  // omit userId for current user
AddressesAPI.addAddress(recipientName, phone, addressLine1, city, postalCode, addressLine2, label, isDefault)
AddressesAPI.updateAddress(addressId, updates)
AddressesAPI.deleteAddress(addressId)
```

### 3. **Superadmin Dashboard** (`superadmin.js`)

**Implemented Features**:
- ✅ Fetch and display admins in real-time
- ✅ Fetch and display users in real-time
- ✅ Fetch and display employees in real-time
- ✅ Fetch and display products (already existed)
- ✅ Fetch and display orders in real-time
- ✅ Create new admins/users/employees via prompts
- ✅ Edit admins/users/employees (name, status)
- ✅ Delete admins/users/employees
- ✅ View orders
- ✅ **Removed hardcoded placeholder messages** - all data now fetched from API

**UI Enhancements**:
- Status badges (green for active, red for suspended)
- Creation dates displayed in local format
- Inline action buttons for edit/delete

### 4. **Admin Dashboard** (`admin.js`)

**Implemented Features**:
- ✅ Fetch and display users
- ✅ Fetch and display employees
- ✅ Fetch and display products
- ✅ Fetch and display orders
- ✅ Create, edit, delete users and employees
- ✅ **Removed all placeholder messages**

### 5. **Employee Dashboard** (`employee.js`)

**Implemented Features**:
- ✅ Fetch and display products
- ✅ Fetch and display orders
- ✅ **Removed placeholder loading messages**

### 6. **User Profile Page** (`profile.js`)

**Address Management Implementation**:
- ✅ Load and display all user addresses
- ✅ Add new address (via prompts or forms)
- ✅ Edit existing addresses
- ✅ Delete addresses
- ✅ Set default address
- ✅ Display recipient name, phone, full address, and default status

**Features**:
- Address labels (Home, Office, etc.)
- Default address indicator
- Full address display with optional address line 2
- Phone number display

## API Endpoints

### Management API (`/HTML_PHP/management.php`)

All endpoints require authentication (must be logged in).

#### Admins (Superadmin Only)
```
GET  management.php?action=getAdmins
POST management.php
  action: createAdmin
  email: string
  password: string
  first_name: string
  last_name: string
  phone: string (optional)

POST management.php
  action: updateAdmin
  admin_id: int
  first_name: string (optional)
  last_name: string (optional)
  phone: string (optional)
  status: 'active' | 'suspended' (optional)

POST management.php
  action: deleteAdmin
  admin_id: int
```

#### Users (Admin+)
```
GET  management.php?action=getUsers
POST management.php (action: createUser, same as createAdmin)
POST management.php (action: updateUser, same pattern)
POST management.php (action: deleteUser, user_id: int)
```

#### Employees (Admin+)
```
GET  management.php?action=getEmployees
POST management.php (action: createEmployee, same as createAdmin)
POST management.php (action: updateEmployee, employee_id: int)
POST management.php (action: deleteEmployee, employee_id: int)
```

#### Addresses (All Users)
```
GET  management.php?action=getAddresses&user_id=INT (admin/superadmin only for other users)

POST management.php
  action: addAddress
  label: string (optional)
  recipient_name: string
  phone: string
  address_line1: string
  address_line2: string (optional)
  city: string
  postal_code: string
  is_default: 0 | 1 (optional)

POST management.php
  action: updateAddress
  address_id: int
  [any address fields to update]

POST management.php
  action: deleteAddress
  address_id: int
```

## Database Schema Requirements

The implementation assumes these tables exist (from `schema_optimized.sql`):

- `users` (with roles: customer, employee, admin, superadmin)
- `addresses` (with user_id foreign key)
- `orders`
- `order_items`

## Security Features

1. **Role-Based Access Control**:
   - Only superadmins can manage admins
   - Only admins/superadmins can manage users/employees
   - Users can only manage their own addresses unless admin/superadmin

2. **Input Validation**:
   - Email format validation
   - Password minimum length (6 characters)
   - Required field validation
   - Email uniqueness check

3. **Session-Based Authentication**:
   - All endpoints check for active session
   - User role verification on sensitive operations

## Usage Examples

### Frontend - JavaScript

**Create a new user** (Admin view):
```javascript
try {
  const result = await ManagementAPI.createUser(
    'newuser@example.com',
    'password123',
    'John',
    'Doe',
    '09123456789'
  );
  console.log('User created:', result.user_id);
} catch (error) {
  console.error('Error:', error.message);
}
```

**Add an address** (Profile page):
```javascript
try {
  const result = await AddressesAPI.addAddress(
    'John Doe',              // recipient_name
    '09123456789',           // phone
    '123 Main St',           // address_line1
    'Manila',                // city
    '1000',                  // postal_code
    'Apt 4',                 // address_line2
    'Home',                  // label
    true                     // is_default
  );
  console.log('Address added:', result.address_id);
} catch (error) {
  console.error('Error:', error.message);
}
```

**Fetch and display employees** (Admin view):
```javascript
try {
  const data = await ManagementAPI.getEmployees();
  data.employees.forEach(emp => {
    console.log(`${emp.first_name} ${emp.last_name} (${emp.email})`);
  });
} catch (error) {
  console.error('Error:', error.message);
}
```

## What Was Removed

1. **Hardcoded placeholder messages**: Removed all "API not yet implemented" messages
2. **Loading states**: Replaced with actual API calls that handle loading states properly
3. **TODO comments**: Removed TODO comments for implemented features
4. **Dummy data**: Removed all dummy/sample data displays

## Testing Checklist

- [ ] Superadmin can create/edit/delete admins
- [ ] Admins can create/edit/delete users and employees
- [ ] Employees can view products and orders
- [ ] Users can add/edit/delete addresses
- [ ] Default address logic works (only one per user)
- [ ] All dashboards load real data without flash of placeholder messages
- [ ] Role-based access control prevents unauthorized operations
- [ ] Error messages display properly

## Future Enhancements

1. Implement modal forms instead of prompts for better UX
2. Add pagination for large lists
3. Implement search/filter functionality
4. Add bulk operations (import/export users)
5. Add audit logging for sensitive operations
6. Implement address validation with postal code lookup
