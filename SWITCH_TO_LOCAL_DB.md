# Quick Fix: Switch to Local MySQL for Development

The Railway database is slow on free tier. **Let's use a local MySQL database instead** - it will be MUCH faster!

## Option 1: Install MySQL Locally (Fastest for Development)

### Windows:
1. Download MySQL Installer: https://dev.mysql.com/downloads/installer/
2. Install MySQL Server (choose "Developer Default")
3. Set root password (remember this!)
4. Start MySQL service

### Update your .env file:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_root_password
DB_NAME=recipe_manager
DB_PORT=3306
DB_SSL=false

PORT=3000
JWT_SECRET=adaae2f07fc5d6c57a928e076335d84ed2b2482dad043a78ba5db38591c15ea5756033a5b9d5c5a7e964557b640b1c45cb094ae9f27d63e85aeff039eaa3451b
NODE_ENV=development
```

### Then run:
```bash
cd backend
npm run init-db
npm start
```

**This will be INSTANT! No more waiting!**

---

## Option 2: Use PlanetScale (Cloud but Faster)

1. Sign up at https://planetscale.com (free tier)
2. Create database
3. Update .env with PlanetScale credentials
4. Much faster than Railway!

---

## Option 3: Use XAMPP (Easiest - Pre-configured MySQL)

1. Download XAMPP: https://www.apachefriends.org/
2. Install and start MySQL from XAMPP Control Panel
3. Update .env as shown in Option 1
4. Done!

---

**Recommendation: Use local MySQL (Option 1 or 3) for development - it's instant!**
**Use Railway/PlanetScale only when deploying to production.**

