// Test script to verify superadmin navbar logic
// Copy and paste this into browser console to test

(function testSuperadminLogic() {
  console.log('=== Testing Superadmin Navbar Logic ===\n');
  
  // Simulate initialization
  console.log('1. Checking localStorage for admin users...');
  let adminUsers = localStorage.getItem('mypc_admin_users');
  if (!adminUsers) {
    console.log('   Not found. Running initialization...');
    const initialUsers = [
      {id:1, email:'superadmin@mypc.com', name:'Superadmin User', password:'superadmin123', isAdmin:false, isSuperAdmin:true, status:'active', created:new Date().toISOString()},
      {id:2, email:'admin@mypc.com', name:'Admin User', password:'admin123', isAdmin:true, isSuperAdmin:false, status:'active', created:new Date().toISOString()},
      {id:3, email:'test@example.com', name:'Test User', password:'test123', isAdmin:false, isSuperAdmin:false, status:'active', created:new Date().toISOString()}
    ];
    localStorage.setItem('mypc_admin_users', JSON.stringify(initialUsers));
    adminUsers = JSON.stringify(initialUsers);
  }
  
  console.log('2. Admin users in localStorage:');
  const users = JSON.parse(adminUsers);
  users.forEach((u, i) => {
    console.log(`   [${i}] ${u.email} - isSuperAdmin: ${u.isSuperAdmin}, isAdmin: ${u.isAdmin}`);
  });
  
  console.log('\n3. Simulating user login as superadmin@mypc.com...');
  localStorage.setItem('mypc_user', 'superadmin@mypc.com');
  const currentUserEmail = localStorage.getItem('mypc_user');
  console.log(`   mypc_user set to: ${currentUserEmail}`);
  
  console.log('\n4. Running updateAuthNav() logic...');
  const user = currentUserEmail;
  const foundUser = users.find(u => u.email === user);
  console.log(`   Looking for user with email: ${user}`);
  console.log(`   Found user:`, foundUser);
  
  if (foundUser) {
    console.log(`   isSuperAdmin flag: ${foundUser.isSuperAdmin}`);
    console.log(`   isAdmin flag: ${foundUser.isAdmin}`);
    
    if (foundUser.isSuperAdmin) {
      console.log('\n✅ SUCCESS: Should render "👑 Superadmin" navbar link!');
      console.log('   Expected: <a href="/superadmin" ...>👑 Superadmin</a>');
    } else if (foundUser.isAdmin) {
      console.log('\n⚠️ ADMIN: Would render "⚙️ Admin" navbar link instead');
    } else {
      console.log('\n⚠️ REGULAR USER: No dashboard link');
    }
  } else {
    console.log('\n❌ ERROR: User not found in admin users array!');
    console.log('   This is why the navbar link doesn\'t appear.');
  }
  
  console.log('\n5. Checking if #auth-nav element exists on page...');
  const authNavElement = document.getElementById('auth-nav');
  if (authNavElement) {
    console.log(`   ✅ Found #auth-nav element`);
    console.log(`   Current HTML: ${authNavElement.innerHTML || '(empty)'}`);
  } else {
    console.log(`   ❌ #auth-nav element not found on page!`);
  }
  
  console.log('\n6. Calling updateAuthNav() manually...');
  if (window.updateAuthNav) {
    window.updateAuthNav();
    console.log(`   ✅ updateAuthNav() executed`);
    console.log(`   Result in #auth-nav: ${authNavElement?.innerHTML}`);
  } else {
    console.log(`   ❌ updateAuthNav() function not found!`);
  }
  
  console.log('\n=== Test Complete ===');
})();
