#!/bin/bash

# Linux Cheat Engine - Offline Installation Script
# Use this when you have the files locally (no internet needed)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
CHEATS_DIR="${HOME}/.cheats"
COMPLETION_DIR="${HOME}/.bash_completion.d"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=========================================="
echo "Linux Cheat Engine - Offline Installation"
echo "==========================================${NC}"
echo ""

# Check if we're in the right directory
if [ ! -f "${SCRIPT_DIR}/setup.sh" ]; then
    echo "Error: setup.sh not found in current directory"
    echo "Please run this script from the cheat repository directory"
    exit 1
fi

# Run setup.sh
echo -e "${YELLOW}Running setup...${NC}"
cd "$SCRIPT_DIR"
bash setup.sh

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo "Reload your shell: source ~/.bashrc"

