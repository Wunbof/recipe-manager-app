# Environment Configuration Examples

This file shows example configurations for different hosting platforms.

---

## 🚂 Railway (MySQL)

Railway is a great option to host your Node backend and MySQL database together. Follow these steps to provision a MySQL database and deploy the `backend/` service.

### 1) Provision a MySQL plugin
- In your Railway project: click **Plugins → MySQL** to provision a managed MySQL database. Railway will show the connection details (host, port, user, password, database).

**Example connection info (Railway provides these):**
```
DB_HOST=containers-us-west-123.railway.app
DB_PORT=3306
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=railway
```

### 2) Recommended `.env` for the backend (place in Railway variables, NOT in repo)
```env
DB_HOST=containers-us-west-123.railway.app
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=railway
DB_PORT=3306
# Do NOT set PORT here - Railway provides $PORT at runtime
JWT_SECRET=replace_with_a_long_random_secret
NODE_ENV=production
```

**Or use a single connection string** (if you prefer):
```env
DATABASE_URL=mysql://your_username:your_password@containers-us-west-123.railway.app:3306/railway
JWT_SECRET=replace_with_a_long_random_secret
NODE_ENV=production
```

> Note: On Railway you should set these values in the Project / Service **Variables** UI (they take precedence over `.env`).

### 3) Deploy your backend service
- Add a new **Service → Deploy from GitHub** and point it at your repository.
- Set the **Root Directory** to `backend` (if your repo contains the server inside a subfolder).
- Ensure the **Start Command** is `npm start` (or the script defined in `package.json`).
- Add the environment variables listed above in the Railway dashboard (Service → Variables).

Railway will build and run your service and show logs in the dashboard. Look for **"Database connected successfully"** and **"Server is running"** messages.

### 4) Import the database schema
- Railway's plugin usually includes a SQL editor. If available, open the plugin and run the contents of `database/schema.sql` to create tables.
- Alternatively, from your local machine using the MySQL client:
```bash
mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p $DB_NAME < path/to/database/schema.sql
```
(you will be prompted for the password)

### 5) Test the API
- Get the service URL Railway provides, e.g. `https://your-service.up.railway.app`
- Test the root endpoint:
```bash
curl https://your-service.up.railway.app/
```
You should see the JSON response:
```json
{ "success": true, "message": "Recipe Manager API is running", "version": "1.0.0" }
```

### 6) Configure your Flutter app
- Update `lib/services/api_service.dart`:
```dart
static const String baseUrl = 'https://your-service.up.railway.app/api';
```
- Use `https://` (Railway provides TLS). Don't include a trailing slash.

### Troubleshooting & tips
- Railway will set `PORT` at runtime — your app should use `process.env.PORT || 3000` (this repo already does).
- If you see connection timeouts, check firewall settings and that the DB user has access to the database.
- If you get SSL errors, consider enabling `ssl: { rejectUnauthorized: false }` in your MySQL connection options (see `database.js`).
- For cold starts, Railway services can be slower on the first request; a small retry/backoff on the client helps.

---

---

## 🟢 Supabase (PostgreSQL)

### From Supabase Dashboard → Settings → Database:

**Connection String format:**
```
postgresql://postgres:[YOUR-PASSWORD]@db.abc123xyz.supabase.co:5432/postgres
```

**Your .env file:**
```env
DB_HOST=db.abc123xyz.supabase.co
DB_USER=postgres
DB_PASSWORD=your_supabase_password_here
DB_NAME=postgres
DB_PORT=5432
PORT=3000
JWT_SECRET=my_super_secret_key_change_this_12345
```

**Note:** Supabase password is set during project creation!

---

## 🌐 PlanetScale (MySQL)

### From PlanetScale Dashboard → Connect:

**Connection Details:**
```
Host: aws.connect.psdb.cloud
Username: 123abcdefg
Password: pscale_pw_xyz789
Database: recipe-manager
```

**Your .env file:**
```env
DB_HOST=aws.connect.psdb.cloud
DB_USER=123abcdefg
DB_PASSWORD=pscale_pw_xyz789
DB_NAME=recipe-manager
DB_PORT=3306
PORT=3000
JWT_SECRET=my_super_secret_key_change_this_12345
```

**Note:** PlanetScale uses SSL by default!

---

## 🔧 Render (Web Service)

### When deploying to Render:

**Add Environment Variables in Render Dashboard:**
```
DB_HOST=your_database_host
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_NAME=your_database_name
DB_PORT=5432
JWT_SECRET=my_super_secret_key_change_this_12345
```

**Render automatically sets:**
```
PORT=10000  # Don't set this, Render provides it
NODE_ENV=production
```

**Important:** In Render, PORT is automatically assigned. Your .env should NOT include PORT when deploying to Render. Use:
```javascript
const PORT = process.env.PORT || 3000;
```

---

## ⚡ Vercel (Serverless)

### For Vercel deployment:

**Add in Vercel Dashboard → Settings → Environment Variables:**
```
DB_HOST=your_database_host
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_NAME=your_database_name
DB_PORT=5432
JWT_SECRET=my_super_secret_key_change_this_12345
```

**Note:** Vercel is serverless, so each request creates a new connection. Consider using connection pooling or serverless-friendly database like Supabase.

---

## 🏠 Local Development

### For testing locally:

**Your .env file:**
```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_local_mysql_password
DB_NAME=recipe_manager
DB_PORT=3306
PORT=3000
JWT_SECRET=local_development_secret_123
```

**For PostgreSQL locally:**
```env
DB_HOST=localhost
DB_USER=postgres
DB_PASSWORD=your_local_postgres_password
DB_NAME=recipe_manager
DB_PORT=5432
PORT=3000
JWT_SECRET=local_development_secret_123
```

---

## 🔐 Security Best Practices

### JWT_SECRET Generation

**Don't use simple strings!** Generate a strong secret:

**Using Node.js:**
```javascript
require('crypto').randomBytes(64).toString('hex')
```

**Using online tool:**
- https://randomkeygen.com/
- Choose "Fort Knox Passwords"

**Example strong secret:**
```
JWT_SECRET=8f7a9b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0
```

---

## 📝 Configuration Checklist

When setting up environment variables, verify:

- [ ] Database credentials are correct
- [ ] Database is accessible (check firewall)
- [ ] Port numbers are correct (3306 for MySQL, 5432 for PostgreSQL)
- [ ] JWT_SECRET is strong and random
- [ ] No spaces in values
- [ ] No quotes around values (unless needed)
- [ ] Variables are saved/applied in hosting platform
- [ ] App restarted after adding variables

---

## 🧪 Testing Your Configuration

### Test 1: Database Connection

**Create test file:** `test-db.js`
```javascript
require('dotenv').config();
const mysql = require('mysql2/promise');

async function testConnection() {
  try {
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      port: process.env.DB_PORT
    });
    console.log('✅ Database connected successfully!');
    await connection.end();
  } catch (error) {
    console.error('❌ Database connection failed:', error.message);
  }
}

testConnection();
```

**Run:**
```bash
node test-db.js
```

### Test 2: Backend API

**After deploying backend, test:**
```bash
curl https://your-backend-url.com
```

**Should return:**
```json
{
  "success": true,
  "message": "Recipe Manager API is running",
  "version": "1.0.0"
}
```

---

## ⚠️ Common Issues

### Issue: "ECONNREFUSED"
**Cause:** Wrong host or port  
**Fix:** Double-check DB_HOST and DB_PORT

### Issue: "Access denied"
**Cause:** Wrong username or password  
**Fix:** Verify DB_USER and DB_PASSWORD

### Issue: "Unknown database"
**Cause:** Database name doesn't exist  
**Fix:** Create database first, then run schema

### Issue: "ETIMEDOUT"
**Cause:** Firewall blocking connection  
**Fix:** Add your IP to database whitelist

### Issue: "SSL required"
**Cause:** Some services require SSL  
**Fix:** Add SSL configuration:
```javascript
const connection = await mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  ssl: {
    rejectUnauthorized: false
  }
});
```

---

## 📱 Flutter App Configuration

After setting up backend, update Flutter app:

**File:** `lib/services/api_service.dart`

**For Railway:**
```dart
static const String baseUrl = 'https://recipe-backend-production.up.railway.app/api';
```

**For Render:**
```dart
static const String baseUrl = 'https://recipe-manager-backend.onrender.com/api';
```

**For Vercel:**
```dart
static const String baseUrl = 'https://recipe-backend.vercel.app/api';
```

**Important:** 
- NO trailing slash at end
- Include `/api` in the URL
- Use `https://` not `http://`

---

## 🔄 Environment Variables Priority

Most hosting platforms read in this order:
1. Platform dashboard variables (highest priority)
2. .env file
3. Default values in code

**Best practice:** Set in platform dashboard, not in code!

---

## 💾 Backup Your Configuration

Save your working .env configuration in a secure place:
1. Password manager
2. Encrypted notes
3. Private repository

**Never commit .env to public GitHub!**

---

This configuration guide covers all major hosting platforms. Choose the one that works best for you!
