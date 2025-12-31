# How to Run Your Backend Server

## The server runs in Terminal/PowerShell (NOT Android Studio)

### Step 1: Open Terminal/PowerShell

**Option A: Open new Terminal window**
- Press `Windows Key + X`
- Select "Windows PowerShell" or "Terminal"

**Option B: Open from VS Code/Editor**
- If you have VS Code, press `` Ctrl+` `` to open terminal
- Or go to: Terminal → New Terminal

---

### Step 2: Navigate to Backend Folder

```bash
cd C:\Users\torna\AndroidStudioProjects\recipe_manager_app\backend
```

---

### Step 3: Start the Server

```bash
npm start
```

---

### Step 4: Wait for Server to Start

You should see:
```
🚀 Server is running on port 3000
📝 API Documentation: http://localhost:3000/
🔄 Testing database connection...
✅ Database ready
```

**Keep this terminal window open!** The server needs to keep running.

---

### Step 5: Run Flutter App in Android Studio

1. Open Android Studio
2. Open your project
3. Click Run button (▶️)
4. Select Chrome or your device
5. The app will connect to your backend server!

---

## Quick Start Script

I created a `start-backend.bat` file for you! You can:
- Double-click `start-backend.bat` in your project folder
- Or run it from terminal

---

## Summary

- **Backend Server** = Terminal/PowerShell (runs `npm start`)
- **Flutter App** = Android Studio (click Run button)

**Both need to be running at the same time!**

