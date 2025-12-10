# Smart Engine Installation Guide

## Quick Installation

```bash
# Run setup (includes smart engine)
./setup.sh

# Reload shell
source ~/.bashrc

# Verify
cheat-smart docker
```

## Manual Installation

### Step 1: Install cheat-smart

```bash
# Copy script
cp bin/cheat-smart ~/.local/bin/cheat-smart

# Make executable
chmod +x ~/.local/bin/cheat-smart
```

### Step 2: Add to PATH

```bash
# Check if already in PATH
echo $PATH | grep -q ".local/bin"

# If not, add to ~/.bashrc
echo 'export PATH="${HOME}/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Step 3: Verify Installation

```bash
# Test command
cheat-smart docker

# Test integration
cheat smart docker

# Check databases created
ls -la ~/.cheats/history.db ~/.cheats/patterns.db
```

## Requirements

- Bash 4.0+
- Standard Unix tools: `grep`, `sed`, `awk`, `cut`, `tr`
- Optional: `fzf` (for smart fzf mode)
- Optional: `bat` or `less` (for better display)

## POSIX Compliance

All scripts are POSIX-compliant:

- Pure bash (no bashisms)
- Standard Unix tools only
- No external dependencies
- Works on Linux, macOS, WSL

## Verification

```bash
# Run verification script
./verify.sh

# Manual verification
command -v cheat-smart && echo "✓ Installed" || echo "✗ Not found"
cheat smart docker && echo "✓ Integration works" || echo "✗ Integration failed"
```

## Troubleshooting

### Command not found

```bash
# Check PATH
echo $PATH

# Add to PATH
export PATH="${HOME}/.local/bin:$PATH"

# Make permanent
echo 'export PATH="${HOME}/.local/bin:$PATH"' >> ~/.bashrc
```

### Permission denied

```bash
# Fix permissions
chmod +x ~/.local/bin/cheat-smart
```

### Pattern database not created

```bash
# Initialize manually
mkdir -p ~/.cheats
touch ~/.cheats/patterns.db
echo "# Format: pattern_type|pattern|frequency|last_used" > ~/.cheats/patterns.db
```

### Integration not working

```bash
# Check cheat command
grep "smart)" ~/.local/bin/cheat

# Reinstall if missing
cp bin/cheat ~/.local/bin/cheat
chmod +x ~/.local/bin/cheat
```
