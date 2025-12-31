#!/bin/bash

# Recipe Manager App - Automated Setup Script
# This script sets up the Flutter project automatically

echo "================================================"
echo "  Recipe Manager App - Setup Script"
echo "================================================"
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed!"
    echo ""
    echo "Please install Flutter first:"
    echo "  Windows: https://docs.flutter.dev/get-started/install/windows"
    echo "  Mac: https://docs.flutter.dev/get-started/install/macos"
    echo "  Linux: https://docs.flutter.dev/get-started/install/linux"
    echo ""
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -n 1)"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if we're in the right directory
if [ ! -f "$SCRIPT_DIR/pubspec.yaml" ]; then
    echo "❌ Error: pubspec.yaml not found!"
    echo "Make sure you're running this script from the project directory."
    exit 1
fi

echo "📂 Project directory: $SCRIPT_DIR"
echo ""

# Create a temporary new Flutter project
TEMP_DIR=$(mktemp -d)
TEMP_PROJECT="$TEMP_DIR/temp_flutter_project"

echo "🔨 Creating Flutter project structure..."
cd "$TEMP_DIR"
flutter create temp_flutter_project > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Failed to create Flutter project"
    exit 1
fi

# Copy the generated folders to our project
echo "📋 Copying Android configuration..."
cp -r "$TEMP_PROJECT/android" "$SCRIPT_DIR/" 2>/dev/null

echo "📋 Copying iOS configuration..."
cp -r "$TEMP_PROJECT/ios" "$SCRIPT_DIR/" 2>/dev/null

echo "📋 Copying Web configuration..."
cp -r "$TEMP_PROJECT/web" "$SCRIPT_DIR/" 2>/dev/null

echo "📋 Copying test files..."
cp -r "$TEMP_PROJECT/test" "$SCRIPT_DIR/" 2>/dev/null

# Copy other necessary files if they don't exist
if [ ! -f "$SCRIPT_DIR/.metadata" ]; then
    cp "$TEMP_PROJECT/.metadata" "$SCRIPT_DIR/" 2>/dev/null
fi

# Clean up temp directory
rm -rf "$TEMP_DIR"

echo ""
echo "📦 Installing dependencies..."
cd "$SCRIPT_DIR"
flutter pub get

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "================================================"
echo "  ✅ Setup Complete!"
echo "================================================"
echo ""
echo "Next steps:"
echo "  1. Update API URL in lib/services/api_service.dart (line 8)"
echo "  2. Run: flutter run"
echo ""
echo "For deployment help, see:"
echo "  - QUICKSTART.md (15-minute setup)"
echo "  - DEPLOYMENT.md (backend deployment)"
echo ""
echo "Happy coding! 🚀"
echo ""
