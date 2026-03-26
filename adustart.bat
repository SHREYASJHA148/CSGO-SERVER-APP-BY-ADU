@echo off
title ADU CS:GO Server Browser - Starting...
color 0A

echo ========================================
echo    ADU CS:GO Server Browser Launcher
echo ========================================
echo.
echo [1/3] Checking dependencies...

REM Check if node_modules exists
if not exist "node_modules" (
    echo [!] Dependencies not found. Installing now...
    echo.
    call npm install
    if errorlevel 1 (
        echo [ERROR] Failed to install dependencies!
        pause
        exit /b 1
    )
    echo [✓] Dependencies installed successfully!
) else (
    echo [✓] Dependencies already installed
)

echo.
echo [2/3] Starting server...
echo.

REM Start the server in background
start "ADU Server" cmd /k "node server.js"

REM Wait a moment for server to start
timeout /t 3 /nobreak >nul

echo.
echo [3/3] Opening browser...
echo.

REM Open in default browser
start http://localhost:3000

echo.
echo ========================================
echo [✓] ADU Server Browser is running!
echo    Server: http://localhost:3000
echo    Press any key to stop server...
echo ========================================
echo.

REM Wait for user input to stop
pause >nul

echo.
echo [!] Stopping server...
taskkill /f /im node.exe >nul 2>&1
echo [✓] Server stopped. Goodbye!
timeout /t 2 /nobreak >nul
