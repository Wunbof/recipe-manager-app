# Quick Start Guide - Recipe Manager App

Get your Recipe Manager app running in 15 minutes!

## 🚀 Fast Track Setup

### Step 1: Database (5 minutes)

**Option A: Railway (Easiest)**
1. Go to https://railway.app
2. Sign up with GitHub
3. New Project → Add PostgreSQL
4. Click PostgreSQL → Connect
5. Copy connection details
6. Go to "Query" tab
7. Paste SQL from `database/schema.sql`
8. Execute

**Option B: Supabase**
1. Go to https://supabase.com
2. New Project
3. Wait 2 minutes for setup
4. SQL Editor → New Query
5. Paste from `database/schema.sql`
6. Run

### Step 2: Backend Deploy (5 minutes)

**Railway Method:**
1. In Railway dashboard
2. New → Empty Service
3. Settings → Connect Repo (upload backend folder)
4. Add Variables tab:
   ```
   DB_HOST=<from step 1>
   DB_USER=<from step 1>
   DB_PASSWORD=<from step 1>
   DB_NAME=<from step 1>
   DB_PORT=5432
   JWT_SECRET=my_super_secret_key_12345
   ```
5. Wait 2 minutes for deploy
6. Copy public URL from Settings

**Alternative: Render**
1. https://render.com
2. New Web Service
3. Upload backend folder
4. Environment: Node
5. Build: `npm install`
6. Start: `npm start`
7. Add environment variables
8. Deploy

### Step 3: Flutter App (5 minutes)

1. Open `lib/services/api_service.dart`
2. Line 8: Change URL to your deployed backend:
   ```dart
   static const String baseUrl = 'https://YOUR-URL.railway.app/api';
   ```
3. In terminal:
   ```bash
   flutter pub get
   flutter run
   ```

Done! Your app should be running.

---

## 🎯 Test Your Setup

1. **Test Backend:**
   Open browser: `https://your-backend-url.com`
   Should see: `{"success": true, "message": "Recipe Manager API is running"}`

2. **Test App:**
   - Register new account
   - Login
   - Create a recipe
   - View recipes

---

## 📱 Demo Credentials

Already have sample data? Use:
- Email: `demo@example.com`
- Password: `demo123`

(Only works if you ran the full SQL schema with sample data)

---

## ⚡ Common Issues & Fixes

### Issue: "Connection Error" in app
**Fix:** 
- Check URL in `api_service.dart` (line 8)
- Ensure backend is deployed and running
- Test backend URL in browser first

### Issue: "Database connection failed" in backend
**Fix:**
- Check environment variables in Railway/Render
- Verify database is running
- Test database connection in Railway dashboard

### Issue: "Invalid credentials"
**Fix:**
- Make sure you registered first
- Password must be 6+ characters
- Check email format

### Issue: Backend shows "Cannot find module"
**Fix:**
- In backend folder: `npm install`
- Redeploy to Railway/Render

---

## 📝 What to Submit

1. **Project Folder** (compressed):
   - Remove `node_modules/`
   - Remove `build/` folder
   - Keep everything else
   - Zip the folder

2. **Backend URL**:
   ```
   https://your-recipe-backend.railway.app
   ```

3. **Database SQL**:
   - File: `database/schema.sql`

4. **Screenshots** (optional):
   - Login screen
   - Recipe list
   - Recipe detail
   - Add recipe form

---

## 🎬 For Video Presentation

Show these features:
1. App launch & login
2. Register new user
3. Add a recipe (with image)
4. View recipe details
5. Edit a recipe
6. Mark as favorite
7. View favorites
8. Search recipes
9. Filter by category
10. Delete a recipe
11. Logout

**Time:** 5-10 minutes max

---

## 📊 Project Stats

- **Screens:** 6 (Login, Register, List, Detail, Add/Edit, Favorites)
- **API Endpoints:** 9
- **Database Tables:** 2 (Users, Recipes)
- **Lines of Code:** ~2500
- **Technologies:** Flutter, Node.js, MySQL/PostgreSQL

---

## 💡 Tips for Success

1. **Deploy Early:** Don't wait until deadline
2. **Test Thoroughly:** Try all features
3. **Keep Credentials Safe:** Save your `.env` file
4. **Backup Database:** Export SQL regularly
5. **Check Logs:** Railway/Render have log viewers

---

## 🆘 Emergency Help

If stuck:
1. Check README.md for detailed instructions
2. Check DEPLOYMENT.md for hosting options
3. Check API_DOCUMENTATION.md for API details
4. Test each component separately:
   - Database connection
   - Backend deployment
   - Flutter app connectivity

---

## ✅ Final Checklist

Before submission:
- [ ] Backend deployed and accessible
- [ ] Database online and populated
- [ ] Flutter app connects to backend
- [ ] Can register new user
- [ ] Can login
- [ ] Can create recipe
- [ ] Can view recipes
- [ ] Can edit recipe
- [ ] Can delete recipe
- [ ] Can toggle favorite
- [ ] Search works
- [ ] Filter works
- [ ] App doesn't crash
- [ ] Code is clean and commented
- [ ] README is updated

Good luck! 🚀
