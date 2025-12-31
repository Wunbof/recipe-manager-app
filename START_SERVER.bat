@echo off
chcp 65001 >nul
title Backend Server
cd /d "%~dp0backend"
echo ====================================
echo   Recipe Manager Backend Server
echo ====================================
echo.
echo Starting server...
echo.
echo Press Ctrl+C to stop the server
echo.
npm start
echo.
echo Server stopped.
pause

