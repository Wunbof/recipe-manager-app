# How to View Your Database

## Option 1: phpMyAdmin (Easiest - Comes with XAMPP) ⭐ Recommended

1. **Open XAMPP Control Panel**
2. **Make sure Apache and MySQL are running** (green "Running" status)
3. **Click "Admin" button next to MySQL** (or go to: http://localhost/phpmyadmin)
4. **phpMyAdmin will open in your browser**
5. **Click on `recipe_manager` database** in the left sidebar
6. **Click on tables:**
   - Click `users` to see all users
   - Click `recipes` to see all recipes
7. **To see data:** Click the "Browse" tab or click on the table name

**URL:** http://localhost/phpmyadmin

---

## Option 2: MySQL Command Line

1. Open Command Prompt or PowerShell
2. Navigate to XAMPP MySQL folder:
   ```bash
   cd C:\xampp\mysql\bin
   ```
3. Connect to MySQL:
   ```bash
   mysql -u root -p
   ```
   (Press Enter if no password, or enter your password)
4. Use the database:
   ```sql
   USE recipe_manager;
   ```
5. View tables:
   ```sql
   SHOW TABLES;
   ```
6. View users:
   ```sql
   SELECT * FROM users;
   ```
7. View recipes:
   ```sql
   SELECT * FROM recipes;
   ```

---

## Option 3: MySQL Workbench (GUI Tool)

1. Download MySQL Workbench: https://dev.mysql.com/downloads/workbench/
2. Install and open
3. Create new connection:
   - Host: `localhost`
   - Port: `3306`
   - Username: `root`
   - Password: (leave empty if no password)
4. Connect and browse your database

---

## Option 4: VS Code Extension

If you use VS Code:
1. Install "MySQL" extension by Jun Han
2. Add connection:
   - Host: `localhost`
   - User: `root`
   - Password: (leave empty)
   - Database: `recipe_manager`
3. Browse tables directly in VS Code

---

## Quick Check Script (What We've Been Using)

You can also use the script I created:

```bash
cd backend
node scripts/check-all.js
```

This shows users and recipes in the terminal.

---

**Recommendation: Use phpMyAdmin (Option 1) - it's the easiest and already installed with XAMPP!**

