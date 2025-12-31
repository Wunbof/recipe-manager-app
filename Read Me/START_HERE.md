# 🚀 START HERE - Recipe Manager App

## Welcome! Follow These Steps in Order

---

## ⚠️ READ THIS FIRST

**Important:** This project contains all the Flutter CODE, but Flutter needs a specific project structure to run. You have two options:

1. **Easy Way:** Run our automated setup script (recommended)
2. **Manual Way:** Create a Flutter project and copy files

---

## 📋 What You Need Before Starting

### 1. Install Flutter (Required!)
- **Windows:** https://docs.flutter.dev/get-started/install/windows
- **Mac:** https://docs.flutter.dev/get-started/install/macos  
- **Linux:** https://docs.flutter.dev/get-started/install/linux

**Verify installation:**
```bash
flutter --version
flutter doctor
```

### 2. Install Node.js (For Backend)
- Download from: https://nodejs.org/
- Choose LTS version

### 3. Get a Code Editor
- VS Code (recommended): https://code.visualstudio.com/
- Or Android Studio: https://developer.android.com/studio

---

## 🎯 Quick Setup (3 Steps)

### Step 1: Setup Flutter Project (5 minutes)

**Option A: Automated (Recommended)**

**On Windows:**
1. Open Command Prompt or PowerShell
2. Navigate to the project folder:
   ```cmd
   cd path\to\recipe_manager_app
   ```
3. Run:
   ```cmd
   setup.bat
   ```

**On Mac/Linux:**
1. Open Terminal
2. Navigate to the project folder:
   ```bash
   cd /path/to/recipe_manager_app
   ```
3. Run:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

**Option B: Manual**
See [FLUTTER_SETUP.md](FLUTTER_SETUP.md) for detailed instructions.

---

### Step 2: Deploy Backend & Database (10 minutes)

Follow the [QUICKSTART.md](QUICKSTART.md) guide:

1. **Create Database (5 min)**
   - Go to https://railway.app
   - Create PostgreSQL
   - Run SQL from `database/schema.sql`

2. **Deploy Backend (5 min)**
   - Upload `backend/` folder to Railway
   - Add environment variables
   - Get your API URL (like: `https://your-app.railway.app`)

**Detailed instructions in [DEPLOYMENT.md](DEPLOYMENT.md)**

---

### Step 3: Connect App to Backend (2 minutes)

1. Open `lib/services/api_service.dart`
2. Line 8, change:
   ```dart
   static const String baseUrl = 'https://your-actual-backend-url.com/api';
   ```
3. Save the file

---

## ▶️ Run the App!

```bash
# Check everything is okay
flutter doctor

# Get dependencies (if you haven't already)
flutter pub get

# Run the app
flutter run
```

**Choose a device when prompted:**
- Android emulator
- iOS simulator (Mac only)
- Connected phone
- Chrome (for testing)

---

## 📱 Test the App

1. **Register** a new account
2. **Login** with your credentials
3. **Add** a recipe
4. **View** recipe details
5. **Edit** the recipe
6. **Mark** as favorite
7. **Search** for recipes
8. **Delete** a recipe

All features should work!

---

## 📚 Documentation Files

Here's what each file is for:

| File | Purpose |
|------|---------|
| **START_HERE.md** | 👈 You are here! |
| **FLUTTER_SETUP.md** | Detailed Flutter setup help |
| **QUICKSTART.md** | 15-minute backend setup |
| **DEPLOYMENT.md** | Backend hosting guide |
| **README.md** | Complete project docs |
| **API_DOCUMENTATION.md** | API endpoints reference |
| **SUBMISSION_GUIDE.md** | How to submit project |

---

## 🔧 Common Issues

### "Flutter not found"
- Install Flutter from https://docs.flutter.dev/
- Add Flutter to your system PATH
- Restart your terminal/command prompt

### "No devices found"
- **Android:** Open Android Studio → AVD Manager → Create emulator
- **iOS:** Open Xcode → Simulator (Mac only)
- **Physical Device:** Enable USB debugging
- **Web:** Use `flutter run -d chrome`

### "Setup script fails"
- Make sure Flutter is installed: `flutter --version`
- Try the manual method in FLUTTER_SETUP.md
- Or create a new Flutter project and copy our files

### "Can't connect to backend"
- Check backend URL in `api_service.dart` (line 8)
- Make sure backend is deployed and running
- Test backend URL in browser (should show API info)

### "gradle errors"
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

---

## 🎬 For Video Presentation

After everything works:

1. **Record your screen** (5-10 minutes)
2. **Show these features:**
   - Launch app
   - Register/Login
   - Create recipe (with image URL)
   - View details
   - Edit recipe
   - Mark favorite
   - Search & filter
   - Delete recipe

**Tools:**
- Windows: OBS Studio, Xbox Game Bar
- Mac: QuickTime, built-in screen recording
- Phone: Built-in screen recorder

---

## 📦 For Submission

See [SUBMISSION_GUIDE.md](SUBMISSION_GUIDE.md) for details.

**You need to submit:**
1. ✅ Compressed project folder (remove build/ and node_modules/)
2. ✅ Backend URL (your deployed API)
3. ✅ SQL file (database/schema.sql)
4. ✅ Video presentation (5-10 min)

---

## ✅ Checklist

Before you submit, verify:

- [ ] Flutter is installed
- [ ] App runs without errors
- [ ] Backend is deployed online
- [ ] Database is set up
- [ ] Can register new account
- [ ] Can login
- [ ] Can create recipe
- [ ] Can view/edit/delete recipes
- [ ] Search works
- [ ] Filter works
- [ ] Video is recorded
- [ ] Files are compressed

---

## 🆘 Still Stuck?

1. **Read the error message carefully**
2. **Check which step failed**
3. **Try the manual method** (FLUTTER_SETUP.md)
4. **Test each component separately:**
   - Flutter installation: `flutter doctor`
   - Backend: Test URL in browser
   - Database: Check Railway/Supabase dashboard

5. **Ask for help:**
   - Show the exact error message
   - Say which step you're on
   - Mention your operating system

---

## 🎓 Learning Path

If you're new to Flutter:

1. **Don't worry!** The code is already written
2. **Focus on setup:** Get the project running first
3. **Learn by exploring:** Change things and see what happens
4. **Read the code:** Everything is commented
5. **Try modifications:** Add new features after it works

---

## 🌟 You're Ready!

Follow the 3 steps above and you'll have a working app in about 20 minutes!

**Questions?** Check the documentation files listed above.

**Good luck! 🚀**

---

## Quick Links

- [Flutter Installation](https://docs.flutter.dev/get-started/install)
- [Railway (Backend Hosting)](https://railway.app)
- [Supabase (Database)](https://supabase.com)
- [VS Code](https://code.visualstudio.com/)
- [Node.js](https://nodejs.org/)

---

*Remember: The hardest part is just getting everything installed and set up. Once that's done, the app will work beautifully!*
