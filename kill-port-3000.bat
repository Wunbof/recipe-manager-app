@echo off
echo Killing all processes using port 3000...
echo.
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :3000') do (
    echo Killing process %%a
    taskkill /F /PID %%a >nul 2>&1
)
echo.
echo Killing all Node.js processes...
taskkill /F /IM node.exe >nul 2>&1
echo.
echo Done! Port 3000 is now free.
echo.
pause

