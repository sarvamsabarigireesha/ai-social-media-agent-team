#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

echo "========================================================================"
echo "  1-Click GitHub Uploader — AI Native Social Media Agent Team"
echo "========================================================================"
echo ""
echo "1. Open https://github.com/new and create a repo named: ai-native-social-media-agent-team"
echo "2. Copy the HTTPS URL (e.g. https://github.com/YOURNAME/ai-native-social-media-agent-team.git)"
echo ""
read -rp "Paste your GitHub Repository URL: " REPO_URL

if [ -z "$REPO_URL" ]; then
  echo "No URL entered. Exiting."
  exit 1
fi

git init
git branch -M main
git add .
git commit -m "Initial commit: AI Native Social Media Agent Team (100% Free Cloud Edition)" || true
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"
git push -u origin main

echo ""
echo "✅ Pushed to GitHub! Import into https://vercel.com/new for instant 24/7 Free Cloud hosting!"
