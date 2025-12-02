#!/bin/bash
# Clean all __pycache__ directories and .pyc files in the project

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Cleaning __pycache__ directories in: $PROJECT_ROOT"

# Find and remove all __pycache__ directories
pycache_count=$(find "$PROJECT_ROOT" -type d -name "__pycache__" | wc -l)
find "$PROJECT_ROOT" -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true

# Find and remove all .pyc files
pyc_count=$(find "$PROJECT_ROOT" -type f -name "*.pyc" | wc -l)
find "$PROJECT_ROOT" -type f -name "*.pyc" -delete 2>/dev/null || true

# Find and remove all .pyo files
pyo_count=$(find "$PROJECT_ROOT" -type f -name "*.pyo" | wc -l)
find "$PROJECT_ROOT" -type f -name "*.pyo" -delete 2>/dev/null || true

echo "Cleaned:"
echo "  - $pycache_count __pycache__ directories"
echo "  - $pyc_count .pyc files"
echo "  - $pyo_count .pyo files"
echo "Done!"
