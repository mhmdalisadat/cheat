#!/bin/bash

# Linux Cheat Engine - Remote Installation Script
# Installs directly from GitHub repository

set -e

REPO_URL="https://github.com/mhmdalisadat/cheat.git"
TEMP_DIR=$(mktemp -d)
SCRIPT_DIR=""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=========================================="
echo "Linux Cheat Engine - Remote Installation"
echo "==========================================${NC}"
echo ""

# Check for git
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is not installed.${NC}"
    echo "Install git first:"
    echo "  Ubuntu/Debian: sudo apt install git"
    echo "  CentOS/RHEL: sudo yum install git"
    exit 1
fi

# Clone repository
echo -e "${YELLOW}[1/3] Cloning repository...${NC}"
if git clone "$REPO_URL" "$TEMP_DIR" 2>/dev/null; then
    echo -e "${GREEN}✓ Repository cloned${NC}"
else
    echo -e "${RED}✗ Failed to clone repository${NC}"
    exit 1
fi
echo ""

# Find setup.sh
SCRIPT_DIR="$TEMP_DIR"
if [ ! -f "$SCRIPT_DIR/setup.sh" ]; then
    echo -e "${RED}Error: setup.sh not found in repository${NC}"
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Make setup.sh executable
chmod +x "$SCRIPT_DIR/setup.sh"

# Run setup.sh
echo -e "${YELLOW}[2/3] Running setup...${NC}"
cd "$SCRIPT_DIR"
if bash "$SCRIPT_DIR/setup.sh"; then
    echo -e "${GREEN}✓ Setup completed${NC}"
else
    echo -e "${RED}✗ Setup failed${NC}"
    rm -rf "$TEMP_DIR"
    exit 1
fi
echo ""

# Cleanup
echo -e "${YELLOW}[3/3] Cleaning up...${NC}"
rm -rf "$TEMP_DIR"
echo -e "${GREEN}✓ Cleanup completed${NC}"
echo ""

echo -e "${GREEN}=========================================="
echo "Installation Complete!"
echo "==========================================${NC}"
echo ""
echo "Next steps:"
echo "1. Reload your shell: source ~/.bashrc"
echo "2. Test the command: cheat list"
echo "3. Or use smart search: cheat-smart docker"
echo ""

