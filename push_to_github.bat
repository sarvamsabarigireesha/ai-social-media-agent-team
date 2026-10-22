@echo off
title Push AI Native Social Media Agent Team to GitHub (Free Cloud Ready)
echo ========================================================================
echo   1-Click GitHub Uploader — AI Native Social Media Agent Team
echo ========================================================================
echo.
echo Step 1: Open https://github.com/new in your browser
echo Step 2: Name the repository: ai-native-social-media-agent-team
echo Step 3: Leave README unchecked and click "Create repository"
echo Step 4: Copy the HTTPS URL shown (e.g. https://github.com/YOURNAME/ai-native-social-media-agent-team.git)
echo.
set /p REPO_URL="Paste your GitHub Repository HTTPS URL here: "

if "%REPO_URL%"=="" (
  echo No URL entered. Exiting.
  pause
  exit /b 1
)

git init
git branch -M main
git add .
git commit -m "Initial commit: AI Native Social Media Agent Team (100%% Free Cloud Edition)"
git remote remove origin 2>nul
git remote add origin "%REPO_URL%"
git push -u origin main

echo.
echo ========================================================================
echo  SUCCESS! Code pushed to GitHub!
echo  Now deploy FREE 24/7 in the Cloud in 1 click:
echo    Option A (Full Python API + Live Signals): https://vercel.com/new
echo    Option B (GitHub Pages Auto-Deploy): Repo Settings -> Pages -> Source: GitHub Actions
echo ========================================================================
pause
