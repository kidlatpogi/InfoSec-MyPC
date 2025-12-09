# Git Setup Guide - InfoSec MyPC v4.6.7

## 📋 Prerequisites

Before starting, you need to install Git:
1. Download Git from: **https://git-scm.com/download/win**
2. Install with default settings
3. Restart your terminal/PowerShell

## 🚀 Quick Setup (Copy & Paste These Commands)

Open PowerShell in your project directory and run these commands:

```powershell
# Navigate to project directory
cd c:\xampp\htdocs\InfoSec-MyPC-4.5.6\InfoSec-MyPC-4.5.6

# Initialize Git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit - InfoSec MyPC v4.6.7

Features:
- Cross-tab logout synchronization
- Cart clearing after checkout
- Back button prevention (redirects to landing page)
- Flicker-free navigation and dashboards
- Session verification on page load and visibility change
- Auto-redirect logged-in users to dashboard
- Multi-role user management (Customer, Employee, Admin, Superadmin)
- Complete e-commerce functionality
- Secure authentication and authorization"

# Create and switch to branch 4.6.7
git checkout -b 4.6.7

# Add remote repository
git remote add origin https://github.com/kidlatpogi/InfoSec-MyPC.git

# Push to GitHub
git push -u origin 4.6.7
```

## 🔐 GitHub Authentication

When Git asks for credentials:

### Option 1: Personal Access Token (Recommended)
1. Go to **GitHub.com** → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Give it a name (e.g., "InfoSec MyPC")
4. Select scopes: **`repo`** (full control of repositories)
5. Click "Generate token"
6. **Copy the token immediately** (you won't see it again!)
7. When Git asks for password, **paste the token** (not your GitHub password)

### Option 2: GitHub CLI (Easiest)
```powershell
# Install GitHub CLI
winget install --id GitHub.cli

# Authenticate
gh auth login

# Then run the git commands above
```

### Option 3: SSH Key
```powershell
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Start SSH agent
ssh-agent

# Add key
ssh-add ~/.ssh/id_ed25519

# Copy public key and add to GitHub
cat ~/.ssh/id_ed25519.pub
```

## 📝 After Initial Push

### To commit new changes:
```powershell
# Check what changed
git status

# Add all changes
git add .

# Commit with message
git commit -m "Your descriptive message here"

# Push to GitHub
git push
```

### To create a new version:
```powershell
# Create new branch
git checkout -b 4.6.8

# Push new branch
git push -u origin 4.6.8
```

### To view your repository:
After pushing, visit: **https://github.com/kidlatpogi/InfoSec-MyPC**

## 🎯 Branch Strategy

**Current Setup:**
- `4.6.7` - Current version with all latest features

**For Future Updates:**
1. Make changes to your code
2. Test thoroughly on localhost
3. Commit: `git add . && git commit -m "Description"`
4. Push: `git push`

## 📊 Useful Git Commands

```powershell
# View commit history
git log --oneline --graph

# View all branches
git branch -a

# Switch branch
git checkout branch-name

# Pull latest changes
git pull

# View remote URL
git remote -v

# Undo last commit (keep changes)
git reset --soft HEAD~1

# View file changes
git diff
```

## ⚠️ Important Notes

1. ✅ **`.gitignore` already created** - Excludes sensitive files
2. ✅ **`README.md` included** - Full documentation
3. ❌ **Never commit**:
   - Database credentials
   - `.env` files
   - User uploads
   - Sensitive data

## 🆘 Troubleshooting

### Problem: "git: command not found"
**Solution:** Git not installed. Download from https://git-scm.com/download/win

### Problem: "Permission denied (publickey)"
**Solution:** Use HTTPS instead of SSH, or set up SSH keys properly

### Problem: "Repository not found"
**Solution:** Make sure you created the repository on GitHub first:
1. Go to https://github.com/new
2. Repository name: `InfoSec-MyPC`
3. Keep it public or private
4. **Don't** initialize with README (we already have one)
5. Click "Create repository"

### Problem: "Updates were rejected"
**Solution:** 
```powershell
git pull --rebase origin 4.6.7
git push
```

### Problem: "fatal: refusing to merge unrelated histories"
**Solution:**
```powershell
git pull origin 4.6.7 --allow-unrelated-histories
git push
```

## ✅ Verification

After setup, verify:

```powershell
# Check Git is installed
git --version

# Check repository status
git status

# Check current branch
git branch

# Check remote connection
git remote -v
```

Expected output:
```
origin  https://github.com/kidlatpogi/InfoSec-MyPC.git (fetch)
origin  https://github.com/kidlatpogi/InfoSec-MyPC.git (push)
```

## 📱 Alternative: GitHub Desktop (GUI Method)

Don't like command line? Use GitHub Desktop:

1. **Download**: https://desktop.github.com/
2. **Install and login** with your GitHub account
3. **File → Add Local Repository**
4. **Select folder**: `c:\xampp\htdocs\InfoSec-MyPC-4.5.6\InfoSec-MyPC-4.5.6`
5. **Publish repository** button
6. **Create branch** `4.6.7` from menu
7. **Commit and push** with GUI

## 🎯 Complete Workflow Example

```powershell
# 1. Install Git (one-time)
# Download from https://git-scm.com/download/win

# 2. Navigate to project
cd c:\xampp\htdocs\InfoSec-MyPC-4.5.6\InfoSec-MyPC-4.5.6

# 3. First time setup
git init
git add .
git commit -m "Initial commit - InfoSec MyPC v4.6.7"
git checkout -b 4.6.7
git remote add origin https://github.com/kidlatpogi/InfoSec-MyPC.git
git push -u origin 4.6.7

# 4. For future changes
# ... make code changes ...
git add .
git commit -m "Fixed checkout bug"
git push

# 5. View on GitHub
# https://github.com/kidlatpogi/InfoSec-MyPC
```

---

## 🚀 Ready to Push!

**All files prepared:**
- ✅ `.gitignore` created
- ✅ `README.md` with full documentation
- ✅ All source code ready

**Next step:** Install Git, then copy-paste the commands from "Quick Setup" section above!

**After pushing, your code will be at:**
👉 **https://github.com/kidlatpogi/InfoSec-MyPC** (branch: `4.6.7`)

---

**Good luck! 🎉**
