# Deployment Guide - Recipe Manager App

This guide will help you deploy your backend API and database online.

## Option 1: Railway (Recommended - Easiest)

Railway provides free hosting for both database and backend API.

### Step 1: Setup Database on Railway

1. Go to https://railway.app and sign up
2. Click "New Project"
3. Select "Provision PostgreSQL"
4. Railway will create a PostgreSQL database
5. Click on the PostgreSQL service
6. Go to "Variables" tab
7. Copy the connection details:
   - `PGHOST`
   - `PGUSER`
   - `PGPASSWORD`
   - `PGDATABASE`
   - `PGPORT`

### Step 2: Import Database Schema

1. Click on "Data" tab in your PostgreSQL service
2. Click "Open psql"
3. Copy and paste the SQL from `database/schema.sql`
4. Press Enter to execute

OR use a PostgreSQL client:
```bash
psql -h your-host -U your-user -d your-database -f database/schema.sql
```

### Step 3: Deploy Backend on Railway

1. In Railway dashboard, click "New"
2. Select "Empty Service"
3. Click on the service → Settings
4. Under "Source", connect your GitHub repository or upload code
5. Railway will auto-detect Node.js and deploy

### Step 4: Add Environment Variables

1. Click on your backend service
2. Go to "Variables" tab
3. Add these variables:
   ```
   DB_HOST=your-postgres-host
   DB_USER=your-postgres-user
   DB_PASSWORD=your-postgres-password
   DB_NAME=your-postgres-database
   DB_PORT=5432
   PORT=3000
   JWT_SECRET=your_random_secret_key_12345
   ```

### Step 5: Get Your API URL

1. Go to "Settings" tab
2. Under "Domains", you'll see your public URL
3. Copy it (e.g., `https://recipe-backend.railway.app`)
4. Update in Flutter app: `lib/services/api_service.dart`
   ```dart
   static const String baseUrl = 'https://your-app.railway.app/api';
   ```

---

## Option 2: Render + Supabase

### Database: Supabase (Free PostgreSQL)

1. Go to https://supabase.com and sign up
2. Create new project
3. Wait for database to be ready
4. Go to Settings → Database
5. Copy connection string
6. Go to SQL Editor
7. Run your schema from `database/schema.sql`

### Backend: Render

1. Go to https://render.com and sign up
2. Click "New +" → "Web Service"
3. Connect your GitHub repository
4. Configure:
   - Name: recipe-manager-backend
   - Environment: Node
   - Build Command: `npm install`
   - Start Command: `npm start`
5. Add environment variables (same as Railway)
6. Click "Create Web Service"
7. Wait for deployment
8. Copy your URL: `https://your-app.onrender.com`

---

## Option 3: Vercel (Serverless) + PlanetScale

### Database: PlanetScale (MySQL)

1. Go to https://planetscale.com
2. Create new database
3. Create branch (main)
4. Connect and run schema
5. Get connection details

### Backend: Vercel

1. Install Vercel CLI:
   ```bash
   npm install -g vercel
   ```

2. In backend folder, create `vercel.json`:
   ```json
   {
     "version": 2,
     "builds": [
       {
         "src": "server.js",
         "use": "@vercel/node"
       }
     ],
     "routes": [
       {
         "src": "/(.*)",
         "dest": "/server.js"
       }
     ]
   }
   ```

3. Deploy:
   ```bash
   cd backend
   vercel
   ```

4. Add environment variables in Vercel dashboard

---

## Testing Your Deployment

1. Test API endpoint:
   ```bash
   curl https://your-api-url.com/
   ```

2. Test registration:
   ```bash
   curl -X POST https://your-api-url.com/api/auth/register \
     -H "Content-Type: application/json" \
     -d '{"username":"test","email":"test@test.com","password":"test123"}'
   ```

3. If you get responses, your API is working!

---

## Update Flutter App

After deploying backend, update the API URL in your Flutter app:

**File:** `lib/services/api_service.dart`

```dart
class ApiService {
  // Replace with your deployed URL
  static const String baseUrl = 'https://your-actual-deployed-url.com/api';
  
  // ... rest of the code
}
```

---

## Important Notes

### For Railway:
- Free tier: 500 hours/month
- Sleeps after 1 hour of inactivity
- Wakes up on first request (may take 30 seconds)

### For Render:
- Free tier: Spins down after 15 min of inactivity
- First request may be slow (cold start)

### For Vercel:
- Serverless functions
- No sleep/wake issues
- 100GB bandwidth/month on free tier

---

## Troubleshooting

### "Cannot connect to database"
- Check environment variables are correct
- Verify database is running
- Check firewall rules

### "CORS error"
- Ensure `cors` is enabled in backend
- Check frontend URL is allowed

### "JWT error"
- Verify JWT_SECRET is set
- Check token format in requests

### "502 Bad Gateway"
- Backend crashed
- Check logs in hosting platform
- Verify all dependencies installed

---

## Free Tier Limits

| Service | Database | Backend | Bandwidth |
|---------|----------|---------|-----------|
| Railway | 512MB | 500h/month | 100GB |
| Render + Supabase | 500MB | Unlimited* | 100GB |
| Vercel + PlanetScale | 5GB | 100GB** | Unlimited |

*Spins down after inactivity  
**Serverless execution time

---

## Recommended Combination

For this course project:

**Best: Railway**
- Easiest setup
- Both database and backend in one place
- Good free tier
- URL: `https://your-app.railway.app`

**Alternative: Render + Supabase**
- More generous database (500MB)
- Separate services
- Good documentation

Choose based on your preference!
