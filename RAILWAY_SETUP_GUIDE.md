# Railway Database Setup - Quick Guide

## Step 1: Sign Up & Create Project

1. Go to **https://railway.app**
2. Click **"Start a New Project"** 
3. Sign up with GitHub (recommended) or email
4. Click **"New Project"** → **"Empty Project"**

## Step 2: Add MySQL Database

1. Click the **"+ New"** button in your project
2. Click **"Database"**
3. Select **"Add MySQL"**
4. Wait ~30 seconds for Railway to provision your database

## Step 3: Get Your Database Credentials

1. Click on the **MySQL** service (it will appear in your project)
2. Click the **"Variables"** tab
3. You'll see these variables - **COPY THESE VALUES**:
   - `MYSQLHOST` → This is your `DB_HOST`
   - `MYSQLUSER` → This is your `DB_USER`  
   - `MYSQLPASSWORD` → This is your `DB_PASSWORD`
   - `MYSQLDATABASE` → This is your `DB_NAME`
   - `MYSQLPORT` → This is your `DB_PORT` (usually 3306)

**⚠️ IMPORTANT: Copy these values now - you'll need them!**

## Step 4: Run Database Schema

After you get the credentials and update your .env file, run:

```bash
cd backend
npm run init-db
```

This will create all the tables in your database!

## Step 5: Test Connection

```bash
npm start
```

You should see: ✅ Database connected successfully

---

**Need help? Share your credentials (safely) or ask me to help update the .env file!**

