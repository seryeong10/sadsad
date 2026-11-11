@echo off
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is required to serve the demo.
  pause
  exit /b 1
)
call flutter build web --dart-define=MOCK_DEMO_MODE=true
if errorlevel 1 (
  echo Demo build failed. Please share the error above.
  pause
  exit /b 1
)
node demo-server.cjs
pause
