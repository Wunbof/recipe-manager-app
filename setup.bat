@echo off
REM Recipe Manager App - Setup Script for Windows

echo ================================================
echo   Recipe Manager App - Setup Script
echo ================================================
echo.

REM Check if Flutter is installed
where flutter >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Flutter is not installed!
    echo.
    echo Please install Flutter first:
    echo   https://docs.flutter.dev/get-started/install/windows
    echo.
    pause
    exit /b 1
)

echo Flutter found
flutter --version | findstr /C:"Flutter"
echo.

REM Get the current directory
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

REM Check if pubspec.yaml exists
if not exist "pubspec.yaml" (
    echo ERROR: pubspec.yaml not found!
    echo Make sure you're running this script from the project directory.
    pause
    exit /b 1
)

echo Project directory: %SCRIPT_DIR%
echo.

REM Create temporary directory
set TEMP_PROJECT=%TEMP%\temp_flutter_project

echo Creating Flutter project structure...
cd /d "%TEMP%"
flutter create temp_flutter_project >nul 2>&1

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to create Flutter project
    pause
    exit /b 1
)

REM Copy generated folders
echo Copying Android configuration...
xcopy /E /I /Y "%TEMP_PROJECT%\android" "%SCRIPT_DIR%android" >nul 2>&1

echo Copying iOS configuration...
xcopy /E /I /Y "%TEMP_PROJECT%\ios" "%SCRIPT_DIR%ios" >nul 2>&1

echo Copying Web configuration...
xcopy /E /I /Y "%TEMP_PROJECT%\web" "%SCRIPT_DIR%web" >nul 2>&1

echo Copying test files...
xcopy /E /I /Y "%TEMP_PROJECT%\test" "%SCRIPT_DIR%test" >nul 2>&1

REM Copy metadata if not exists
if not exist "%SCRIPT_DIR%.metadata" (
    copy "%TEMP_PROJECT%\.metadata" "%SCRIPT_DIR%" >nul 2>&1
)

REM Clean up
rd /s /q "%TEMP_PROJECT%" >nul 2>&1

echo.
echo Installing dependencies...
cd /d "%SCRIPT_DIR%"
flutter pub get

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ================================================
echo   Setup Complete!
echo ================================================
echo.
echo Next steps:
echo   1. Update API URL in lib\services\api_service.dart (line 8)
echo   2. Run: flutter run
echo.
echo For deployment help, see:
echo   - QUICKSTART.md (15-minute setup)
echo   - DEPLOYMENT.md (backend deployment)
echo.
echo Happy coding! 
echo.
pause
