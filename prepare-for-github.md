# Prepare Project for GitHub Upload

Your project is too large because of `node_modules/` and `build/` folders.

## Quick Fix Steps:

### Step 1: Make sure .gitignore is working

The `.gitignore` file should already exclude these. But let's verify:

1. **Check if node_modules is being tracked:**
   ```bash
   git status
   ```
   
   If you see `node_modules/` listed, it's being tracked (bad!)

### Step 2: Remove large folders from git (if already tracked)

If you already initialized git and added files, remove these:

```bash
# Remove node_modules from git tracking
git rm -r --cached backend/node_modules

# Remove build folders
git rm -r --cached build
git rm -r --cached backend/build
git rm -r --cached android/build
git rm -r --cached ios/build

# Remove package-lock.json (optional - people can regenerate it)
git rm --cached backend/package-lock.json
```

### Step 3: Commit the .gitignore changes

```bash
git add .gitignore
git commit -m "Add .gitignore to exclude large files"
```

---

## Alternative: Start Fresh (Easiest)

If git is giving you trouble, start fresh:

1. **Delete .git folder (if exists):**
   ```bash
   # In PowerShell
   Remove-Item -Recurse -Force .git
   ```

2. **Initialize git fresh:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

   Now `.gitignore` will work from the start!

---

## What Should Be Uploaded:

✅ Source code (small)
✅ package.json (small - lists dependencies)
✅ pubspec.yaml (small)
✅ Documentation files
✅ Database schema

❌ node_modules/ (HUGE - 100MB+)
❌ build/ folders (HUGE)
❌ .env files (sensitive)

---

## Check Project Size:

After excluding files, your project should be < 10MB (just source code).

Try again after following these steps!

