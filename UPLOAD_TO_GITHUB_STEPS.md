# Upload Project to GitHub - Step by Step

## Method 1: Using Git Command Line (Recommended) ⭐

### Step 1: Check what will be committed
```bash
git status
```
Make sure `node_modules/` is NOT listed!

### Step 2: Commit your files
```bash
git commit -m "Initial commit: Recipe Manager App"
```

### Step 3: Create Repository on GitHub
1. Go to: https://github.com/new
2. Repository name: `recipe-manager-app` (or any name you want)
3. Description: "Full Stack Recipe Manager App - Flutter + Node.js + MySQL"
4. Choose: **Public** or **Private**
5. **DO NOT** check "Initialize with README" (we already have files)
6. Click **"Create repository"**

### Step 4: Link and Push
After creating the repo, GitHub will show you commands. Run these:

```bash
git remote add origin https://github.com/YOUR_USERNAME/recipe-manager-app.git
git branch -M main
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username!

---

## Method 2: Using GitHub Desktop (Easier)

### Step 1: Download GitHub Desktop
- Go to: https://desktop.github.com/
- Install and sign in with your GitHub account

### Step 2: Add Repository
1. Open GitHub Desktop
2. Click **"File" → "Add Local Repository"**
3. Browse to: `C:\Users\torna\AndroidStudioProjects\recipe_manager_app`
4. Click **"Add repository"**

### Step 3: Review Files (IMPORTANT!)
1. Before committing, check the file list
2. Make sure these are **NOT** checked:
   - ❌ `backend/node_modules/`
   - ❌ `build/` folders
   - ❌ `.env` files
3. If they're checked, uncheck them!

### Step 4: Commit
1. At the bottom, type commit message: "Initial commit: Recipe Manager App"
2. Click **"Commit to main"**

### Step 5: Publish
1. Click **"Publish repository"** button (top right)
2. Choose:
   - Name: `recipe-manager-app`
   - Description: "Full Stack Recipe Manager App"
   - ✅ Keep this code private (if you want)
3. Click **"Publish repository"**
4. Done! ✅

---

## Quick Checklist

Before uploading, verify:
- ✅ `.gitignore` file exists (protects sensitive files)
- ✅ `node_modules/` is NOT being uploaded
- ✅ `.env` files are NOT being uploaded
- ✅ `build/` folders are NOT being uploaded

---

## After Upload

Your repository will be at:
```
https://github.com/YOUR_USERNAME/recipe-manager-app
```

You can share this link with your professor/team!

---

**Need help? Let me know which method you prefer!**

