# Database Setup Guide

This guide will help you deploy/initialize your database.

## Step 1: Create `.env` File

Create a `.env` file in the `backend` directory with your database credentials:

```env
# Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password_here
DB_NAME=recipe_manager
DB_PORT=3306

# For cloud databases (Railway, PlanetScale, etc.), add:
# DB_SSL=true

# Server Configuration
PORT=3000

# JWT Secret (generate a strong random string)
JWT_SECRET=your_super_secret_jwt_key_change_this_12345

# Environment
NODE_ENV=development
```

### For Cloud Databases:

**Railway:**
```env
DB_HOST=containers-us-west-123.railway.app
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=railway
DB_PORT=3306
```

**PlanetScale:**
```env
DB_HOST=aws.connect.psdb.cloud
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=recipe-manager
DB_PORT=3306
DB_SSL=true
```

## Step 2: Deploy/Initialize Database

Run the initialization script:

```bash
cd backend
npm run init-db
```

This script will:
- ✅ Connect to your MySQL server
- ✅ Create the database if it doesn't exist
- ✅ Create all tables (users, recipes)
- ✅ Insert sample data (optional, from schema.sql)

## Step 3: Verify Connection

Start your server to test the connection:

```bash
npm start
```

You should see:
```
✅ Database connected successfully
🚀 Server is running on port 3000
```

## Troubleshooting

### Error: "Missing required environment variables"
- Make sure you have a `.env` file in the `backend` directory
- Check that all required variables are set (DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)

### Error: "ECONNREFUSED"
- Check that your MySQL server is running
- Verify DB_HOST and DB_PORT are correct
- For local MySQL: Make sure MySQL service is started

### Error: "Access denied"
- Verify DB_USER and DB_PASSWORD are correct
- Check user permissions on the MySQL server

### Error: "SSL required"
- Add `DB_SSL=true` to your `.env` file
- This is needed for cloud databases like PlanetScale

### Error: "Unknown database"
- The script will create the database automatically
- If it still fails, create the database manually:
  ```sql
  CREATE DATABASE recipe_manager;
  ```

## Manual Database Setup (Alternative)

If you prefer to set up the database manually:

1. Connect to your MySQL server
2. Create the database:
   ```sql
   CREATE DATABASE recipe_manager;
   ```
3. Run the schema file:
   ```bash
   mysql -h localhost -u root -p recipe_manager < ../database/schema.sql
   ```

## Need Help?

- Check `Read Me/ENVIRONMENT_CONFIG.md` for platform-specific configurations
- Check `Read Me/DEPLOYMENT.md` for deployment instructions

