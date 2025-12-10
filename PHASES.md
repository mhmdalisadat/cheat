# Linux Cheat Engine - Phase Implementation Guide

## PHASE 1 – CORE MVP ✓

### Implementation

- ✅ Created `~/.cheats` directory structure
- ✅ Created categorized markdown files:
  - `linux-core.md`
  - `networking.md`
  - `docker.md`
  - `swarm.md`
  - `traefik.md`
  - `security.md`
  - `monitoring.md`
- ✅ Implemented `cheat` CLI command with:
  - `cheat` or `cheat list` - List all categories
  - `cheat <category>` - Show category contents
- ✅ PATH setup in `~/.local/bin`
- ✅ Execution permissions handled in setup

### Files

- `bin/cheat` - Main CLI script (lines 1-50)
- `setup.sh` - Creates sample markdown files

### Verification

```bash
cheat list
cheat linux-core
```

---

## PHASE 2 – SEARCH & ADD ✓

### Implementation

- ✅ Global search: `cheat search <keyword>`
  - Greps across all markdown files
  - Colorized output
- ✅ `cheat-add` command:
  - Interactive mode: Prompts for category, title, command
  - Non-interactive mode: `cheat-add <category> <title> <command>`
  - Appends formatted markdown to category files

### Files

- `bin/cheat` - Search function (lines 52-70)
- `bin/cheat-add` - Complete add command implementation

### Verification

```bash
cheat search docker
cheat-add
cheat-add docker "Test" "docker ps"
```

---

## PHASE 3 – UI & USABILITY ✓

### Implementation

- ✅ Pager detection: `bat` → `less` → `cat` fallback
- ✅ Bash autocomplete for categories
- ✅ Colored display with `bat` or `less -R`
- ✅ Paging enabled by default

### Files

- `bin/cheat` - `detect_pager()` function (lines 12-20)
- `bin/cheat-completion.bash` - Bash completion script
- `setup.sh` - Completion installation

### Verification

```bash
# Test autocomplete (tab after typing "cheat ")
cheat <TAB>

# Test colored display
cheat docker
```

---

## PHASE 4 – FUZZY SEARCH ✓

### Implementation

- ✅ `cheat fzf` command
- ✅ Fuzzy search across all cheat entries
- ✅ Preview window for matched entries
- ✅ Interactive selection and viewing

### Files

- `bin/cheat` - `fuzzy_search()` function (lines 72-95)

### Verification

```bash
# Requires fzf installation
sudo apt install fzf  # or brew install fzf
cheat fzf
```

---

## PHASE 5 – COMMAND EXECUTION MODE ✓

### Implementation

- ✅ `cheat exec` or `cheat execute` command
- ✅ Extracts commands from cheat entries
- ✅ FZF selection interface
- ✅ Confirmation prompt before execution
- ✅ Safe execution using eval

### Files

- `bin/cheat` - `execute_mode()` function (lines 97-125)

### Verification

```bash
cheat exec
# Select a command, confirm with 'y'
```

---

## PHASE 6 – VERSION CONTROL SYNC ✓

### Implementation

- ✅ `cheat git-init` - Initialize git repository
- ✅ `cheat git-remote <url>` - Connect remote repository
- ✅ `cheat git-push` - Push changes
- ✅ `cheat git-pull` - Pull changes
- ✅ Automatic commit on push

### Files

- `bin/cheat` - Git functions (lines 127-180)

### Verification

```bash
cheat git-init
cheat git-remote https://github.com/username/cheats.git
cheat git-push
cheat git-pull
```

---

## PHASE 7 – EXPORT & DASHBOARD ✓

### Implementation

- ✅ `cheat export` or `cheat export-pdf` - Generate PDF
  - Uses pandoc to convert all markdown files
  - Output: `~/.cheats/cheats.pdf`
- ✅ `cheat dashboard` or `cheat serve` - Local web server
  - Primary: markserv on port 8642
  - Fallback: Python HTTP server on port 8000

### Files

- `bin/cheat` - Export and dashboard functions (lines 182-220)

### Verification

```bash
# PDF export (requires pandoc)
cheat export

# Dashboard (requires markserv or python3)
cheat dashboard
# Access at http://localhost:8642 or http://localhost:8000
```

---

## Complete Command Reference

### Basic Commands

```bash
cheat                    # List categories
cheat <category>         # View category
cheat list               # List categories
cheat search <keyword>   # Search all cheats
```

### Advanced Commands

```bash
cheat fzf                # Fuzzy search
cheat exec               # Execute commands
cheat git-init           # Initialize git
cheat git-remote <url>   # Set remote
cheat git-push           # Push changes
cheat git-pull           # Pull changes
cheat export             # Export PDF
cheat dashboard          # Start dashboard
```

### Add Commands

```bash
cheat-add                # Interactive mode
cheat-add <cat> <title> <cmd>  # Non-interactive
```

---

## Dependencies by Phase

| Phase | Required  | Optional                 |
| ----- | --------- | ------------------------ |
| 1-2   | bash      | -                        |
| 3     | bash      | bat, less                |
| 4     | bash, fzf | -                        |
| 5     | bash, fzf | -                        |
| 6     | bash, git | -                        |
| 7     | bash      | pandoc, markserv/python3 |

---

## Installation Order

1. Run `./setup.sh` (installs phases 1-3)
2. Install optional dependencies as needed:
   ```bash
   sudo apt install bat fzf pandoc  # Ubuntu/Debian
   brew install bat fzf pandoc      # macOS
   npm install -g markserv          # Dashboard
   ```
3. Verify: `./verify.sh`
