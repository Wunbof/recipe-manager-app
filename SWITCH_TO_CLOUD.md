# Switching to Cloud Database

Your project is working perfectly locally! Now let's switch to a cloud database for submission.

## Option 1: Railway (Already Set Up) ⭐ Easiest

We already have Railway credentials from earlier:
- Host: `hopper.proxy.rlwy.net`
- Port: `48373`
- User: `root`
- Database: `railway`

**To switch back:**
1. Update `backend/.env` with Railway credentials
2. Restart server
3. Done!

**Note:** Railway free tier can be slow (5-10 second delays), but it works and is fine for school projects.

---

## Option 2: PlanetScale (Better Performance) ⭐ Recommended

**Benefits:**
- Much faster than Railway
- 5GB free storage (vs Railway's 512MB)
- Better performance
- Takes 5 minutes to set up

**Setup Steps:**
1. Go to https://planetscale.com
2. Sign up with GitHub (free)
3. Create new database: `recipe-manager`
4. Create branch: `main`
5. Get connection credentials
6. Update `.env` file
7. Run schema in PlanetScale console
8. Done!

---

## Which Should You Choose?

**Use Railway if:**
- ✅ You want the quickest setup (already done!)
- ✅ Your professor just wants "cloud database" (doesn't care about speed)
- ✅ You want to submit quickly

**Use PlanetScale if:**
- ✅ You want better performance
- ✅ You want to impress with faster response times
- ✅ You have 5 minutes to set it up

---

**Both work perfectly with your codebase!** Your project is already set up to work with any MySQL database.

