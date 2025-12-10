#!/bin/bash

# Linux Cheat Engine - Verification Script
# Tests all 7 phases

set -e

BIN_DIR="${HOME}/.local/bin"
CHEATS_DIR="${HOME}/.cheats"
ERRORS=0

echo "=========================================="
echo "Linux Cheat Engine - Verification"
echo "=========================================="
echo ""

# Test 1: Check if commands exist
echo "[TEST 1] Checking command installation..."
if [ -f "${BIN_DIR}/cheat" ] && [ -x "${BIN_DIR}/cheat" ]; then
    echo "✓ cheat command exists and is executable"
else
    echo "✗ cheat command not found or not executable"
    ERRORS=$((ERRORS + 1))
fi

if [ -f "${BIN_DIR}/cheat-add" ] && [ -x "${BIN_DIR}/cheat-add" ]; then
    echo "✓ cheat-add command exists and is executable"
else
    echo "✗ cheat-add command not found or not executable"
    ERRORS=$((ERRORS + 1))
fi
echo ""

# Test 2: Check PATH
echo "[TEST 2] Checking PATH configuration..."
if command -v cheat &> /dev/null; then
    echo "✓ cheat command is in PATH"
else
    echo "⚠ cheat command not in PATH (may need: source ~/.bashrc)"
fi
echo ""

# Test 3: Check cheats directory
echo "[TEST 3] Checking cheats directory..."
if [ -d "$CHEATS_DIR" ]; then
    echo "✓ Cheats directory exists: $CHEATS_DIR"
    
    # Count markdown files
    MD_COUNT=$(ls -1 "$CHEATS_DIR"/*.md 2>/dev/null | wc -l)
    echo "✓ Found $MD_COUNT markdown files"
else
    echo "✗ Cheats directory not found"
    ERRORS=$((ERRORS + 1))
fi
echo ""

# Test 4: PHASE 1 - List categories
echo "[TEST 4] PHASE 1 - Testing list categories..."
if [ -d "$CHEATS_DIR" ]; then
    if "${BIN_DIR}/cheat" list &> /dev/null; then
        echo "✓ List categories command works"
    else
        echo "✗ List categories command failed"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo "⚠ Skipping (cheats directory not found)"
fi
echo ""

# Test 5: PHASE 1 - View category
echo "[TEST 5] PHASE 1 - Testing view category..."
if [ -f "${CHEATS_DIR}/linux-core.md" ]; then
    if "${BIN_DIR}/cheat" linux-core &> /dev/null; then
        echo "✓ View category command works"
    else
        echo "✗ View category command failed"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo "⚠ Skipping (sample files not found)"
fi
echo ""

# Test 6: PHASE 2 - Search
echo "[TEST 6] PHASE 2 - Testing search..."
if [ -d "$CHEATS_DIR" ]; then
    if "${BIN_DIR}/cheat" search docker &> /dev/null; then
        echo "✓ Search command works"
    else
        echo "✗ Search command failed"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo "⚠ Skipping (cheats directory not found)"
fi
echo ""

# Test 7: PHASE 3 - Pager detection
echo "[TEST 7] PHASE 3 - Testing pager detection..."
if command -v bat &> /dev/null; then
    echo "✓ bat is installed (will be used for display)"
elif command -v less &> /dev/null; then
    echo "✓ less is installed (will be used as fallback)"
else
    echo "⚠ No pager found (cat will be used)"
fi
echo ""

# Test 8: PHASE 3 - Bash completion
echo "[TEST 8] PHASE 3 - Testing bash completion..."
if [ -f "${HOME}/.bash_completion.d/cheat-completion.bash" ]; then
    echo "✓ Bash completion file exists"
else
    echo "⚠ Bash completion file not found"
fi
echo ""

# Test 9: PHASE 4 - FZF availability
echo "[TEST 9] PHASE 4 - Testing fzf availability..."
if command -v fzf &> /dev/null; then
    echo "✓ fzf is installed (fuzzy search available)"
else
    echo "⚠ fzf not installed (install for fuzzy search: sudo apt install fzf)"
fi
echo ""

# Test 10: PHASE 6 - Git initialization
echo "[TEST 10] PHASE 6 - Testing git initialization..."
if [ -d "$CHEATS_DIR" ]; then
    cd "$CHEATS_DIR" || exit 1
    if [ -d ".git" ]; then
        echo "✓ Git repository initialized"
    else
        echo "⚠ Git not initialized (run: cheat git-init)"
    fi
    cd - > /dev/null || exit 1
else
    echo "⚠ Skipping (cheats directory not found)"
fi
echo ""

# Test 11: PHASE 7 - Pandoc availability
echo "[TEST 11] PHASE 7 - Testing pandoc availability..."
if command -v pandoc &> /dev/null; then
    echo "✓ pandoc is installed (PDF export available)"
else
    echo "⚠ pandoc not installed (install for PDF export: sudo apt install pandoc)"
fi
echo ""

# Test 12: PHASE 7 - Markserv availability
echo "[TEST 12] PHASE 7 - Testing markserv availability..."
if command -v markserv &> /dev/null; then
    echo "✓ markserv is installed (dashboard available)"
elif command -v python3 &> /dev/null; then
    echo "✓ python3 is installed (dashboard fallback available)"
else
    echo "⚠ No dashboard server available"
fi
echo ""

# Test 13: PHASE E - Pattern recognition
echo "[TEST 13] PHASE E - Testing pattern recognition..."
if [ -f "${BIN_DIR}/cheat-smart" ] && [ -x "${BIN_DIR}/cheat-smart" ]; then
    echo "✓ cheat-smart command exists"
    if [ -d "$CHEATS_DIR" ]; then
        echo "✓ Patterns database will be created on first use"
    fi
else
    echo "⚠ cheat-smart not found"
fi
echo ""

# Test 14: PHASE F - Integration
echo "[TEST 14] PHASE F - Testing cheat smart integration..."
if [ -f "${BIN_DIR}/cheat" ]; then
    if grep -q "smart)" "${BIN_DIR}/cheat" 2>/dev/null; then
        echo "✓ cheat smart integration found"
    else
        echo "⚠ cheat smart integration not found"
    fi
else
    echo "⚠ cheat command not found"
fi
echo ""

# Summary
echo "=========================================="
echo "Verification Summary"
echo "=========================================="
if [ $ERRORS -eq 0 ]; then
    echo "✓ All core tests passed!"
    echo ""
    echo "Optional features status:"
    echo "  - Fuzzy search (fzf): $(command -v fzf &> /dev/null && echo 'Available' || echo 'Not installed')"
    echo "  - PDF export (pandoc): $(command -v pandoc &> /dev/null && echo 'Available' || echo 'Not installed')"
    echo "  - Dashboard (markserv/python3): $(command -v markserv &> /dev/null && echo 'markserv' || (command -v python3 &> /dev/null && echo 'python3' || echo 'Not available'))"
    echo "  - Smart engine (cheat-smart): $(command -v cheat-smart &> /dev/null && echo 'Available' || echo 'Not installed')"
    echo "  - Pattern recognition: $(command -v cheat-smart &> /dev/null && echo 'Available' || echo 'Not available')"
else
    echo "✗ Found $ERRORS error(s)"
    echo "Please review the errors above and fix them."
    exit 1
fi
echo ""

