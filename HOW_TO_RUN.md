# How to Run Your Recipe Manager App

## You Need to Run TWO Things:

### 1. Backend Server (Node.js) - Run in Terminal/PowerShell

**Open a terminal/PowerShell window and run:**

```bash
cd backend
npm start
```

**You should see:**
```
🚀 Server is running on port 3000
📝 API Documentation: http://localhost:3000/
🔄 Testing database connection...
✅ Database ready
```

**Keep this terminal window open!** The server needs to keep running.

---

### 2. Flutter App - Run from Android Studio

1. Open Android Studio
2. Open your project: `recipe_manager_app`
3. Select your device:
   - **Chrome** (for web testing)
   - Or your Android emulator/phone
4. Click the **Run** button (▶️) or press `Shift+F10`

---

## Important: API URL Configuration

Your Flutter app needs to connect to the backend. Currently it's set to:
- `http://192.168.1.10:3000/api`

**If running on the same computer:**
- For **Chrome/Web**: Use `http://localhost:3000/api`
- For **Android Emulator**: Use `http://10.0.2.2:3000/api`
- For **Physical Phone on same WiFi**: Use your computer's IP (like `192.168.1.10:3000/api`)

**To change it, edit:** `lib/services/api_service.dart` (line 9)

---

## Quick Start Steps:

1. ✅ **Start Backend:**
   ```bash
   cd backend
   npm start
   ```
   Wait for "Server is running" message

2. ✅ **Start Flutter App:**
   - Open Android Studio
   - Click Run ▶️
   - Select Chrome or your device

3. ✅ **Test Registration/Login:**
   - The app should now connect to your Railway database!

---

## Troubleshooting:

**"Connection refused" or "Failed to connect":**
- Make sure backend is running (check terminal)
- Check the API URL in `api_service.dart`
- For Chrome: use `localhost:3000`
- For Android emulator: use `10.0.2.2:3000`

**Backend won't start:**
- Make sure you're in the `backend` folder
- Check that `.env` file exists with Railway credentials
- Run `npm install` if needed

**Database connection slow:**
- This is normal for Railway free tier (first connection takes a few seconds)
- Server will still work, just be patient on first request

