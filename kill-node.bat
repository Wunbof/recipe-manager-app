@echo off
echo Killing all Node.js processes...
taskkill /F /IM node.exe >nul 2>&1
timeout /t 1 >nul
echo Done! All Node processes stopped.
echo.
echo Now you can run: cd backend && npm start
pause

