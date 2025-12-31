@echo off
echo Stopping backend server on port 3000...
echo.

for /f "tokens=5" %%a in ('netstat -ano ^| findstr :3000') do (
    echo Killing process %%a
    taskkill /PID %%a /F >nul 2>&1
)

timeout /t 1 >nul
echo.
echo Done! Port 3000 is now free.
pause

