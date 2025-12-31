# Cloud Database Setup Guide - Railway (MySQL)

## Step-by-Step Instructions

### Step 1: Sign Up for Railway

1. Go to **https://railway.app**
2. Click **"Start a New Project"** or **"Login"**
3. Sign up with GitHub (recommended) or email

### Step 2: Create a New Project

1. Click **"New Project"**
2. Select **"Empty Project"** (we'll add services manually)

### Step 3: Add MySQL Database

1. In your project, click **"+ New"** button
2. Click **"Database"** 
3. Select **"Add MySQL"**
4. Railway will provision a MySQL database (this takes ~30 seconds)

### Step 4: Get Database Credentials

1. Click on the **MySQL** service in your project
2. Click on the **"Variables"** tab
3. You'll see these variables:
   - `MYSQLHOST` (this is your DB_HOST)
   - `MYSQLUSER` (this is your DB_USER)
   - `MYSQLPASSWORD` (this is your DB_PASSWORD)
   - `MYSQLDATABASE` (this is your DB_NAME)
   - `MYSQLPORT` (this is your DB_PORT - usually 3306)

**Copy these values - you'll need them!**

### Step 5: Connect to Database and Run Schema

You have two options:

#### Option A: Using Railway's SQL Editor (Easier)

1. In your MySQL service, click on the **"Data"** tab
2. If available, click **"Open SQL Editor"** or **"Query"**
3. Copy the entire contents of `database/schema.sql`
4. Paste it into the SQL editor
5. Click **"Run"** or press Execute
6. You should see success messages

#### Option B: Using Your Local Script (Recommended)

1. Update your `.env` file with Railway credentials (see Step 6)
2. Run our initialization script:
   ```bash
   cd backend
   npm run init-db
   ```

### Step 6: Update Your .env File

Update `backend/.env` with your Railway database credentials:

```env
DB_HOST=<value from MYSQLHOST>
DB_USER=<value from MYSQLUSER>
DB_PASSWORD=<value from MYSQLPASSWORD>
DB_NAME=<value from MYSQLDATABASE>
DB_PORT=<value from MYSQLPORT>
DB_SSL=false

PORT=3000
JWT_SECRET=adaae2f07fc5d6c57a928e076335d84ed2b2482dad043a78ba5db38591c15ea5756033a5b9d5c5a7e964557b640b1c45cb094ae9f27d63e85aeff039eaa3451b
NODE_ENV=development
```

**Replace the `<value from ...>` with actual values from Railway's Variables tab.**

### Step 7: Test Database Connection Locally

```bash
cd backend
npm start
```

You should see:
```
✅ Database connected successfully
🚀 Server is running on port 3000
```

---

## Alternative: PlanetScale Setup

If you prefer PlanetScale (better free tier), follow these steps:

### Step 1: Sign Up

1. Go to **https://planetscale.com**
2. Sign up with GitHub (free tier available)

### Step 2: Create Database

1. Click **"New database"**
2. Choose **"Create new database"**
3. Name it: `recipe-manager`
4. Select a region close to you
5. Choose **"Development"** plan (free)
6. Click **"Create database"**

### Step 3: Get Connection Details

1. Click on your database
2. Click **"Connect"** button
3. Select **"Node.js"** tab
4. You'll see connection details:
   - Host
   - Username
   - Password (click "Show password")
   - Database name
   - Port (usually 3306)

**Copy these values!**

### Step 4: Create Branch

1. Click **"Branches"** tab
2. Click **"Create branch"**
3. Name it: `main` (or use the default)
4. Click **"Create branch"**

### Step 5: Run Schema

1. Click **"Console"** tab
2. Copy contents from `database/schema.sql`
3. Paste into the console
4. Click **"Run"**

### Step 6: Update .env File

```env
DB_HOST=<PlanetScale host>
DB_USER=<PlanetScale username>
DB_PASSWORD=<PlanetScale password>
DB_NAME=<PlanetScale database name>
DB_PORT=3306
DB_SSL=true

PORT=3000
JWT_SECRET=adaae2f07fc5d6c57a928e076335d84ed2b2482dad043a78ba5db38591c15ea5756033a5b9d5c5a7e964557b640b1c45cb094ae9f27d63e85aeff039eaa3451b
NODE_ENV=development
```

**Important:** PlanetScale requires `DB_SSL=true`

---

## Which Should You Choose?

**Choose Railway if:**
- ✅ You want the easiest setup
- ✅ You're just getting started
- ✅ 512MB is enough for your project

**Choose PlanetScale if:**
- ✅ You want more free storage (5GB)
- ✅ You need better performance
- ✅ You're building for production

**Both work perfectly with this codebase!**

---

## Need Help?

If you get stuck:
1. Check the error messages carefully
2. Verify all credentials are copied correctly (no extra spaces)
3. Make sure the database service is running
4. For Railway: Check the service logs in the dashboard
5. For PlanetScale: Make sure you created and selected a branch

