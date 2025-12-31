# Flutter Project Setup Guide

## 🚨 IMPORTANT: How to Run the Flutter App

The project files are included, but you need to initialize a proper Flutter project. Here's how:

---

## Method 1: Use the Provided Files (Recommended)

### Step 1: Install Flutter
If you don't have Flutter installed:
1. Go to https://docs.flutter.dev/get-started/install
2. Download Flutter SDK for your OS
3. Add Flutter to your PATH
4. Run `flutter doctor` to verify

### Step 2: Create New Flutter Project
```bash
# Navigate to where you want the project
cd /path/to/your/projects

# Create a new Flutter project
flutter create recipe_manager_app

# This creates a complete Flutter project structure
```

### Step 3: Replace Files
```bash
# Go into the new project
cd recipe_manager_app

# Delete the default lib folder
rm -rf lib/

# Copy our lib folder from the downloaded project
cp -r /path/to/downloaded/recipe_manager_app/lib ./

# Copy pubspec.yaml
cp /path/to/downloaded/recipe_manager_app/pubspec.yaml ./

# Copy analysis_options.yaml
cp /path/to/downloaded/recipe_manager_app/analysis_options.yaml ./
```

### Step 4: Get Dependencies
```bash
flutter pub get
```

### Step 5: Update API URL
Edit `lib/services/api_service.dart` line 8:
```dart
static const String baseUrl = 'https://your-backend-url.com/api';
```

### Step 6: Run the App
```bash
# For Android emulator or connected device
flutter run

# Or for web (testing)
flutter run -d chrome

# Or for iOS simulator (Mac only)
flutter run -d ios
```

---

## Method 2: Manual Copy (If Method 1 Doesn't Work)

### Step 1: Create New Project
```bash
flutter create recipe_manager_app
cd recipe_manager_app
```

### Step 2: Copy Files One by One

**Models:**
```bash
mkdir -p lib/models
# Copy recipe.dart and user.dart to lib/models/
```

**Services:**
```bash
mkdir -p lib/services
# Copy api_service.dart to lib/services/
```

**Screens:**
```bash
mkdir -p lib/screens
# Copy all *_screen.dart files to lib/screens/
```

**Main:**
```bash
# Copy main.dart to lib/
```

**Dependencies:**
```bash
# Copy pubspec.yaml to project root
```

### Step 3: Install Packages
```bash
flutter pub get
```

---

## Method 3: Quick Start Script (Linux/Mac)

Save this as `setup.sh` and run it:

```bash
#!/bin/bash

echo "Setting up Recipe Manager App..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    echo "Visit: https://docs.flutter.dev/get-started/install"
    exit 1
fi

# Create new Flutter project
echo "Creating new Flutter project..."
flutter create recipe_manager_app

# Navigate to project
cd recipe_manager_app

# Copy lib folder
echo "Copying app files..."
cp -r ../lib ./

# Copy pubspec.yaml
cp ../pubspec.yaml ./

# Get dependencies
echo "Installing dependencies..."
flutter pub get

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. cd recipe_manager_app"
echo "2. Update API URL in lib/services/api_service.dart"
echo "3. flutter run"
```

Make it executable:
```bash
chmod +x setup.sh
./setup.sh
```

---

## Required Files for Flutter Project

### Core Files (From Downloaded Project):
- ✅ `lib/` folder (all Dart files)
- ✅ `pubspec.yaml` (dependencies)
- ✅ `analysis_options.yaml` (linting rules)

### Auto-Generated Files (Created by `flutter create`):
- Android configuration (`android/` folder)
- iOS configuration (`ios/` folder)
- Web configuration (`web/` folder)
- Test files (`test/` folder)
- `.gitignore`
- `README.md`

---

## Verify Your Setup

After setup, your project should have this structure:

```
recipe_manager_app/
├── android/              # Auto-generated
├── ios/                  # Auto-generated
├── lib/                  # ✅ From downloaded project
│   ├── models/
│   ├── services/
│   ├── screens/
│   └── main.dart
├── test/                 # Auto-generated
├── web/                  # Auto-generated
├── pubspec.yaml         # ✅ From downloaded project
├── analysis_options.yaml # ✅ From downloaded project
└── README.md            # Auto-generated
```

---

## Quick Test

After setup, test that everything works:

```bash
# Check Flutter installation
flutter doctor

# Check for errors in code
flutter analyze

# Run the app (without backend)
flutter run
```

---

## Common Issues & Solutions

### Issue: "Flutter not found"
**Solution:** Install Flutter SDK from https://docs.flutter.dev/get-started/install

### Issue: "No device found"
**Solution:** 
- For Android: Open Android Studio → AVD Manager → Create/Start emulator
- For iOS: Open Xcode → Simulator
- Or connect a physical device with USB debugging enabled

### Issue: "Package not found"
**Solution:** 
```bash
flutter clean
flutter pub get
```

### Issue: "gradle errors" (Android)
**Solution:**
```bash
cd android
./gradlew clean
cd ..
flutter run
```

---

## Dependencies Needed

The `pubspec.yaml` includes:
- `http: ^1.1.0` - For API calls
- `shared_preferences: ^2.2.2` - For local storage

These will be installed automatically when you run `flutter pub get`.

---

## Alternative: Use Android Studio

1. Open Android Studio
2. File → New → New Flutter Project
3. Select "Flutter Application"
4. Name it "recipe_manager_app"
5. Click Finish
6. Once created, replace the `lib/` folder with ours
7. Copy our `pubspec.yaml`
8. Click "Pub get" in Android Studio

---

## Next Steps After Setup

1. ✅ Flutter project created and running
2. 🔧 Update API URL in `lib/services/api_service.dart`
3. 🚀 Deploy backend (see DEPLOYMENT.md)
4. 🗄️ Setup database (see QUICKSTART.md)
5. 📱 Test the complete app

---

## Need Help?

If you're stuck:
1. Make sure Flutter is installed: `flutter --version`
2. Check that you have Android Studio or Xcode installed
3. Run `flutter doctor` to see what's missing
4. Create the project fresh with `flutter create`
5. Then copy our files into it

---

## Simple Video Tutorial Alternative

If all else fails, you can:
1. Watch a "Flutter installation" video for your OS
2. Create a new Flutter project
3. Copy our code files into the new project
4. Run `flutter pub get`
5. Run the app

**The key point:** You need a complete Flutter project structure. Our files provide the CODE, but Flutter needs its own project scaffolding.

---

## For Absolute Beginners

**What you downloaded:**
- ✅ All the Dart code (the app logic)
- ✅ The dependencies list (pubspec.yaml)
- ❌ Not included: Flutter's project scaffolding

**What you need to do:**
1. Install Flutter on your computer
2. Create a new Flutter project (this creates the scaffolding)
3. Copy our code into that project
4. Run it

It's like getting the ingredients for a cake (our code) but you still need the oven and baking pan (Flutter's project structure)!

---

Good luck! Once you have Flutter installed and create the project, everything should work perfectly! 🚀
