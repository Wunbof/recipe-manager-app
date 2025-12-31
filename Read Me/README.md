# Recipe Manager App

A complete Flutter mobile application for managing personal recipes with online database and backend API.

## 📱 Features

- **User Authentication**: Register and login functionality
- **Recipe Management**: Create, read, update, and delete recipes
- **Categories**: Organize recipes by categories (Breakfast, Lunch, Dinner, etc.)
- **Favorites**: Mark recipes as favorites for quick access
- **Search & Filter**: Search recipes by name and filter by category
- **Image Support**: Add images to recipes via URL
- **Responsive UI**: Beautiful and intuitive user interface

## 🏗️ Project Structure

```
recipe_manager_app/
├── backend/                 # Node.js Backend API
│   ├── config/
│   │   └── database.js     # Database configuration
│   ├── middleware/
│   │   └── auth.js         # JWT authentication
│   ├── routes/
│   │   ├── auth.js         # Authentication routes
│   │   └── recipes.js      # Recipe CRUD routes
│   ├── package.json
│   ├── server.js           # Main server file
│   └── .env.example        # Environment variables template
├── database/
│   └── schema.sql          # Database schema and sample data
├── lib/                    # Flutter App
│   ├── models/
│   │   ├── user.dart
│   │   └── recipe.dart
│   ├── services/
│   │   └── api_service.dart
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   ├── recipe_list_screen.dart
│   │   ├── recipe_detail_screen.dart
│   │   ├── add_edit_recipe_screen.dart
│   │   └── favorites_screen.dart
│   └── main.dart
└── pubspec.yaml
```

## 🚀 Setup Instructions

### Prerequisites

- Flutter SDK (3.0.0 or higher) - **INSTALL THIS FIRST!**
- Node.js (14.x or higher)
- MySQL or PostgreSQL database
- Git

### 🔴 IMPORTANT: Flutter Project Setup

**The downloaded project contains all the code, but you need to create the Flutter project structure first!**

Choose one of these methods:

### 🔴 IMPORTANT: Flutter Project Setup

**The downloaded project contains all the code, but you need to create the Flutter project structure first!**

Choose one of these methods:

#### Method 1: Automated Setup (Easiest!) ⭐

**For Linux/Mac:**
```bash
cd recipe_manager_app
chmod +x setup.sh
./setup.sh
```

**For Windows:**
```cmd
cd recipe_manager_app
setup.bat
```

This script will:
- Check if Flutter is installed
- Create the Flutter project structure
- Copy all necessary files
- Install dependencies

#### Method 2: Manual Setup

```bash
# 1. Make sure Flutter is installed
flutter --version

# 2. Create new Flutter project in a different location
flutter create my_recipe_app

# 3. Copy our code files into it
cd my_recipe_app
rm -rf lib/
cp -r /path/to/downloaded/recipe_manager_app/lib ./
cp /path/to/downloaded/recipe_manager_app/pubspec.yaml ./

# 4. Install dependencies
flutter pub get

# 5. Update API URL in lib/services/api_service.dart
# Change line 8 to your backend URL

# 6. Run the app
flutter run
```

**For detailed Flutter setup help, see [FLUTTER_SETUP.md](FLUTTER_SETUP.md)**

---

### Step 1: Database Setup

1. Choose a database hosting service (Railway, Supabase, PlanetScale, etc.)
2. Create a new database
3. Run the SQL schema from `database/schema.sql`

**For Railway (Recommended):**
- Go to https://railway.app
- Create new project → Add PostgreSQL
- Copy the connection details
- Use a PostgreSQL client to run the schema

**For MySQL (Local/Remote):**
```bash
mysql -u your_username -p your_database < database/schema.sql
```

### Step 2: Backend Setup

1. Navigate to backend folder:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create `.env` file from template:
```bash
cp .env.example .env
```

4. Edit `.env` with your database credentials:
```env
DB_HOST=your_database_host
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_NAME=recipe_manager
DB_PORT=3306
PORT=3000
JWT_SECRET=your_secret_key_here
```

5. Test locally:
```bash
npm start
```

The API should be running at http://localhost:3000

### Step 3: Deploy Backend (Railway)

1. Go to https://railway.app
2. Create new project → Deploy from GitHub (or local)
3. Add your Node.js backend
4. Add environment variables from your `.env` file
5. Deploy and copy the public URL (e.g., https://your-app.railway.app)

**Alternative Deployment Options:**
- **Render.com**: Free tier available
- **Fly.io**: Easy deployment
- **Heroku alternatives**: Cyclic.sh, Vercel (serverless)

### Step 4: Flutter App Setup

1. Navigate to project root:
```bash
cd recipe_manager_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Update API URL in `lib/services/api_service.dart`:
```dart
static const String baseUrl = 'https://your-deployed-api.railway.app/api';
```

4. Run the app:
```bash
flutter run
```

## 📡 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user

### Recipes
- `GET /api/recipes` - Get all recipes (with optional filters)
- `GET /api/recipes/:id` - Get single recipe
- `POST /api/recipes` - Create new recipe
- `PUT /api/recipes/:id` - Update recipe
- `DELETE /api/recipes/:id` - Delete recipe
- `PATCH /api/recipes/:id/favorite` - Toggle favorite
- `GET /api/recipes/favorites/list` - Get favorite recipes

## 🗄️ Database Schema

### Users Table
- user_id (Primary Key)
- username
- email
- password_hash
- created_at

### Recipes Table
- recipe_id (Primary Key)
- user_id (Foreign Key)
- title
- description
- ingredients
- instructions
- cooking_time
- category
- image_url
- is_favorite
- created_at
- updated_at

## 📦 Technologies Used

### Frontend (Flutter)
- Flutter SDK
- http package for API calls
- shared_preferences for local storage
- Material Design 3

### Backend (Node.js)
- Express.js - Web framework
- MySQL2 - Database driver
- bcryptjs - Password hashing
- jsonwebtoken - JWT authentication
- cors - Cross-origin resource sharing
- dotenv - Environment variables

### Database
- MySQL or PostgreSQL

## 🎯 Course Requirements Met

✅ Minimum 2 activities (screens)
✅ Backend services published online
✅ Online database
✅ User authentication
✅ CRUD operations
✅ HTTP requests and JSON parsing
✅ State management
✅ Form validation
✅ Async/await operations
✅ ListView/GridView
✅ Navigation
✅ Error handling
✅ Local storage (SharedPreferences)

## 🧪 Testing

### Test User Credentials
- Email: demo@example.com
- Password: demo123

### Testing Locally
1. Start backend: `cd backend && npm start`
2. Run Flutter app: `flutter run`
3. Register a new account or use demo credentials

## 📝 Submission Checklist

- [ ] Project source code (compressed)
- [ ] Backend API URL
- [ ] Backend source code
- [ ] SQL schema file
- [ ] README documentation
- [ ] Video presentation

## 🔧 Troubleshooting

### Common Issues

1. **Connection Error**
   - Verify backend URL in `api_service.dart`
   - Check if backend is running
   - Ensure CORS is enabled

2. **Database Connection Failed**
   - Verify database credentials in `.env`
   - Check if database is running
   - Ensure firewall allows connections

3. **Build Failed**
   - Run `flutter clean`
   - Run `flutter pub get`
   - Check Flutter version compatibility

## 📧 Support

For any issues or questions, please contact your instructor or refer to the project documentation.

## 📄 License

This project is created for educational purposes as part of a mobile application development course.
