#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
echo "=================================================================="
echo " Starting AI Native Social Media Agent Team (Free Self-Hosted)..."
echo " Opening http://localhost:8000 in your browser!"
echo "=================================================================="
python3 server.py --open
