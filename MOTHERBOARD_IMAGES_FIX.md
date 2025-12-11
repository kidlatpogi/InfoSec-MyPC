# Product Images Not Displaying - Fix Guide

## Problem Summary

Product images for motherboards (and potentially other categories) are not displaying because:

1. **Incorrect file names** in the database that don't match actual files in your assets folder
2. **Missing path prefix** - Database has `/assets/` but needs `/InfoSec-MyPC/assets/` to work properly

## Root Cause

Looking at the actual files in `assets/AMD Motherboard/`:

```
AORUS X670 ELITE AX.png
ASROCK B550 PHANTOM GAMING 4_AC.webp
ASROCK B650M HDV_M2.jpg
ASROCK X870 STEEL LEGEND WIFI.webp
ASUS ROG Strix B550-F Gaming_.webp
ASUS TUF GAMING B650-PLUS.png
GIGABYTE B850M GAMING X WIFI6E.png
MSI MAG B850 Tomahawk MAX WIFI_.webp
```

But the database (in `db/inserts.sql` lines 157-165) had incorrect names like:

- `ASUS CROSSHAIR X670E-E.jpg` (file doesn't exist)
- `ASUS PRIME B550M-A_AC.webp` (file doesn't exist)
- `GIGABYTE X870E AORUS MASTER.jpg` (file doesn't exist)

## How Images Are Displayed

1. **Frontend Request**: `script.js` requests a product from `/HTML_PHP/products.php?id=XX`
2. **Backend Response**: PHP queries `product_images` table for the image URL
3. **Image Rendering**: JavaScript sets `img.src = product.image_url`
4. **Path Resolution**: Browser loads from `/InfoSec-MyPC/assets/...`

## Files Involved

- **Database**: `db/inserts.sql` (lines 156-165) - Product image URLs
- **Backend**: `HTML_PHP/products.php` - Returns image URLs from database
- **Frontend**: `JS/script.js` (line 856) - Displays the image
- **Assets**: `assets/AMD Motherboard/` - Actual image files

## Solution - Run This SQL

Execute the SQL in your MySQL database. Two options:

### Option 1: Quick Fix (Motherboards Only)

File: `db/fix_motherboard_images.sql`
Contains corrected paths for 8 motherboard products

### Option 2: Comprehensive Fix

File: `db/fix_all_product_images.sql`
Ready for when you add more products

### Manual Execution Steps:

1. Open phpMyAdmin or MySQL command line
2. Select your `mypc` database
3. Run the SQL from `db/fix_motherboard_images.sql`
4. Verify: Refresh your shop page and check motherboard images

## Important Notes

- All image URLs must start with `/InfoSec-MyPC/` (not just `/assets/`)
- File names must EXACTLY match what's in the `assets/` folder (case-sensitive)
- Image extensions matter: `.png`, `.jpg`, `.webp`
- The `order` field determines which image shows first (use `0` for primary)

## Testing

After applying the SQL fix:

1. Navigate to motherboard products in your shop
2. Images should now load for all 8 motherboards
3. Check browser console (F12) for any 404 errors on images
4. If images still don't load, verify:
   - File exists in assets folder with exact name
   - Path in database matches exactly
   - PHP server is running and accessible
