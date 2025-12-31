# Submission Instructions - Recipe Manager App

## 📦 What to Submit

### 1. Project Source Code (Compressed)
- **File:** `recipe_manager_app.tar.gz` (or .zip)
- **How to create:**
  ```bash
  # Remove build folders first
  cd recipe_manager_app
  rm -rf build/
  rm -rf backend/node_modules/
  
  # Then compress
  cd ..
  tar -czf recipe_manager_app.tar.gz recipe_manager_app/
  # Or create zip
  zip -r recipe_manager_app.zip recipe_manager_app/
  ```

### 2. Backend API URL
- **Example:** `https://recipe-backend-xyz.railway.app`
- **Format:** Text file or in README
- **Must be:** Live and accessible

### 3. Backend Source Code
- **Location:** Already in `backend/` folder in compressed file
- **Files included:**
  - `server.js`
  - `config/database.js`
  - `routes/auth.js`
  - `routes/recipes.js`
  - `middleware/auth.js`
  - `package.json`

### 4. SQL Schema
- **File:** `database/schema.sql`
- **Contains:**
  - Table creation statements
  - Sample data (optional)
  - All necessary indexes

### 5. Video Presentation
- **Length:** 5-10 minutes
- **Format:** MP4 (recommended)
- **Content:**
  1. App demonstration
  2. Features showcase
  3. Database interaction
  4. API testing (optional)

---

## 📋 Submission Checklist

### Before Compressing:
- [ ] Remove `node_modules/` folder
- [ ] Remove `build/` folder
- [ ] Remove `.env` file (keep `.env.example`)
- [ ] Update README with your backend URL
- [ ] Test that app works with deployed backend

### What to Include:
- [ ] All Flutter source code (`lib/` folder)
- [ ] All backend source code (`backend/` folder)
- [ ] Database schema (`database/schema.sql`)
- [ ] Documentation files (README.md, etc.)
- [ ] pubspec.yaml
- [ ] package.json

### What NOT to Include:
- [ ] ❌ `node_modules/` folder
- [ ] ❌ `build/` folder
- [ ] ❌ `.env` file (actual credentials)
- [ ] ❌ `.git/` folder (if exists)
- [ ] ❌ IDE config files (.vscode, .idea)

---

## 🎬 Video Presentation Guide

### Recording Tools:
- **Windows:** OBS Studio, Xbox Game Bar
- **Mac:** QuickTime, Screen Recording
- **Android:** Built-in screen recorder
- **iOS:** Built-in screen recording

### What to Show (5-10 minutes):

**Introduction (30 seconds)**
- Your name
- Project name: "Recipe Manager App"
- Brief description

**Features Demo (4-5 minutes)**
1. **Authentication:**
   - Show register screen
   - Create new account
   - Login

2. **Recipe List:**
   - Show main screen with recipes
   - Demonstrate search functionality
   - Filter by category

3. **Recipe Details:**
   - Click on a recipe
   - Show full details
   - Scroll through ingredients and instructions

4. **Create Recipe:**
   - Click add button
   - Fill in recipe form
   - Add image URL
   - Save recipe

5. **Edit Recipe:**
   - Open existing recipe
   - Click edit
   - Modify details
   - Save changes

6. **Favorites:**
   - Toggle favorite on recipe
   - Go to favorites screen
   - Show favorited recipes

7. **Delete:**
   - Delete a recipe
   - Show confirmation dialog

**Technical Overview (1-2 minutes)**
- Show backend URL is live
- Mention technologies used:
  - Flutter for mobile app
  - Node.js + Express for backend
  - MySQL/PostgreSQL for database
  - Deployed on Railway/Render

**Conclusion (30 seconds)**
- Summary of features
- Thank you

### Tips:
- Test your screen recording before final take
- Close unnecessary apps/tabs
- Turn off notifications
- Speak clearly
- Don't rush
- If you make a mistake, you can edit or re-record

---

## 📤 Upload to Google Classroom

### Step-by-Step:

1. **Go to your Google Classroom**

2. **Find the assignment**

3. **Upload files in this order:**
   
   a. **Project Source (Required)**
      - Click "Add or create"
      - Choose "File"
      - Upload `recipe_manager_app.tar.gz`
   
   b. **Backend URL (Required)**
      - Click "Add or create"
      - Choose "Link" or create a text file
      - Paste your API URL: `https://your-backend.railway.app`
   
   c. **Backend Code (Required)**
      - Already included in compressed file
      - But you can mention: "Backend code is in /backend folder"
   
   d. **SQL File (Required)**
      - Click "Add or create"
      - Choose "File"
      - Upload `schema.sql` from database folder
   
   e. **Video (Required)**
      - Click "Add or create"
      - Choose "File"
      - Upload your video presentation
      - **Note:** Don't add video inside zip file

4. **Add a comment (Optional but recommended):**
   ```
   Project: Recipe Manager App
   Backend URL: https://your-backend.railway.app
   Technologies: Flutter, Node.js, PostgreSQL
   Features: Authentication, CRUD operations, Favorites, Search, Categories
   ```

5. **Click "Turn In"**

---

## ✅ Pre-Submission Verification

### Test Your Backend:
```bash
# Test 1: Check if API is running
curl https://your-backend-url.com

# Test 2: Register a user
curl -X POST https://your-backend-url.com/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"test","email":"test@test.com","password":"test123"}'

# Test 3: Login
curl -X POST https://your-backend-url.com/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"test123"}'
```

All should return JSON responses without errors.

### Test Your App:
1. ✅ App launches without crashes
2. ✅ Can register new account
3. ✅ Can login
4. ✅ Can view recipe list
5. ✅ Can create new recipe
6. ✅ Can view recipe details
7. ✅ Can edit recipe
8. ✅ Can delete recipe
9. ✅ Can toggle favorite
10. ✅ Can search recipes
11. ✅ Can filter by category
12. ✅ Can logout

---

## 📊 Project Summary

**For your submission notes:**

### Technologies Used:
- **Frontend:** Flutter/Dart
- **Backend:** Node.js, Express.js
- **Database:** MySQL/PostgreSQL
- **Authentication:** JWT (JSON Web Tokens)
- **Hosting:** Railway/Render (backend), Free tier database

### Features Implemented:
- User registration and login
- JWT-based authentication
- CRUD operations for recipes
- Recipe categories
- Favorite recipes
- Search functionality
- Filter by category
- Image support via URL
- Responsive UI
- Error handling
- Input validation

### Database Schema:
- 2 tables (users, recipes)
- Foreign key relationships
- Indexes for performance

### API Endpoints:
- 9 RESTful endpoints
- All protected with authentication
- Proper HTTP status codes
- JSON responses

---

## 🆘 Last-Minute Issues?

### "Can't compress the file"
- Use online tool: https://www.ezyzip.com/
- Or Windows: Right-click → Send to → Compressed folder

### "Backend is down"
- Check Railway/Render dashboard
- Verify environment variables
- Check logs for errors

### "App can't connect"
- Verify URL in `api_service.dart` line 8
- Make sure no extra spaces or `/` at end
- Test URL in browser first

### "Video too large"
- Compress video: https://www.freeconvert.com/video-compressor
- Or upload to YouTube (unlisted) and share link

---

## ⏰ Deadline: Sunday January 4

### Time Management:
- **2 weeks before:** Deploy backend and database
- **1 week before:** Test everything thoroughly
- **3 days before:** Record video
- **1 day before:** Create compressed file and test upload
- **Deadline day:** Final checks and submit

**Important:** Submit before deadline. Late submissions get zero.

---

## 📞 Support

If you encounter issues:
1. Check documentation files in project
2. Review error messages carefully
3. Test components individually
4. Ask instructor during office hours

---

Good luck with your submission! 🚀
