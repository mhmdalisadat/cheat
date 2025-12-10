# Linux Cheat Engine - Usage Guide

## Basic Commands

### List Categories

```bash
cheat list
# or simply
cheat
```

### View Category

```bash
cheat linux-core
cheat docker
cheat networking
```

### Search (PHASE 2)

```bash
cheat search docker
cheat search "network interface"
```

### Add Entry (PHASE 2)

```bash
# Interactive mode
cheat-add

# Non-interactive mode
cheat-add docker "Run Container" "docker run -d nginx"
```

## Advanced Features

### Fuzzy Search (PHASE 4)

```bash
cheat fzf
```

- Browse all cheat entries
- Select with Enter
- Preview with arrow keys

### Execute Commands (PHASE 5)

```bash
cheat exec
# or
cheat execute
```

- Select command from fzf
- Confirm execution
- Command runs safely

## Git Sync (PHASE 6)

### Initialize Git Repository

```bash
cheat git-init
```

### Connect Remote Repository

```bash
cheat git-remote https://github.com/username/cheats.git
```

### Push Changes

```bash
cheat git-push
```

### Pull Changes

```bash
cheat git-pull
```

## Export & Dashboard (PHASE 7)

### Export to PDF

```bash
cheat export
# or
cheat export-pdf
```

### Start Dashboard

```bash
cheat dashboard
# or
cheat serve
```

- Access at: http://localhost:8642 (markserv)
- Or: http://localhost:8000 (Python fallback)

## Examples

### Workflow Example

```bash
# 1. List available categories
cheat list

# 2. View a specific category
cheat docker

# 3. Search for a command
cheat search "docker run"

# 4. Add a new cheat
cheat-add docker "Custom Command" "docker run -it ubuntu bash"

# 5. Use fuzzy search to find it
cheat fzf

# 6. Execute a command (with confirmation)
cheat exec

# 7. Sync to remote
cheat git-push
```

### Batch Add Example

```bash
cheat-add linux-core "Find Large Files" "find / -size +100M"
cheat-add networking "Check Port" "netstat -tulpn | grep :80"
cheat-add security "Generate Password" "openssl rand -base64 32"
```

## Tips

1. **Use bat for better display**: Install `bat` for syntax highlighting
2. **Enable completion**: Source bash completion for tab completion
3. **Organize by category**: Keep related commands in same category
4. **Use git sync**: Keep your cheats backed up and synced
5. **Export regularly**: Generate PDF backups periodically
