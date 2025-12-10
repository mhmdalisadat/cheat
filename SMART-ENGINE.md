# Local Smart Suggestion Engine

## Overview

The Smart Suggestion Engine adds intelligent, context-aware, pattern-based local suggestions to the Linux Cheat Engine CLI. It works completely offline with no AI, using pure bash and awk for scoring and ranking.

## Features

### PHASE A - Local Intelligence Core

- **Smart Search**: `cheat-smart <keyword>` searches across all cheat files
- **Scoring Engine**: Pure bash + awk implementation with multiple scoring factors:
  - Exact match: +5 points
  - Partial match: +3 points
  - Keyword in title: +4 points
  - Category relevance: +2 points
  - File name relevance: +2 points
  - Recent usage: +2 points
  - Frequency boost: +1 per occurrence

### PHASE B - Context Awareness

Automatically detects environment and boosts relevant suggestions:

- **Docker**: Detects if `docker` command exists (+10)
- **Docker Compose**: Detects `docker-compose.yml` files (+15)
- **Docker Swarm**: Detects `stack.yml` files (+15)
- **Traefik**: Detects `traefik.yml` or `traefik.toml` (+12)
- **Git**: Detects `.git` directory or git command (+8)
- **Systemd**: Detects systemd installation (+10)
- **Directory Context**: Analyzes current directory path for keywords (+5)

### PHASE C - Smart FZF Mode

- **Ranked Results**: `cheat-smart fzf` shows suggestions ranked by relevance
- **Score Display**: Each entry shows relevance score: `[87] docker restart container`
- **Context Boost**: Entries matching current context appear at top
- **Interactive Selection**: Select and view entries instantly

### PHASE D - Command Frequency Learning

- **History Database**: `~/.cheats/history.db` stores search patterns
- **Format**: `timestamp|keyword|category|title|score`
- **Learning**: System learns from usage patterns and boosts frequently used commands
- **Offline**: All learning happens locally, no external dependencies

## Usage

### Basic Smart Search

```bash
# Search with intelligent ranking
cheat-smart docker

# Search for networking commands
cheat-smart network
```

### Smart FZF Mode

```bash
# Interactive fuzzy search with ranking
cheat-smart fzf
```

### Examples

```bash
# In a directory with docker-compose.yml
cd /path/to/docker-project
cheat-smart restart
# Docker-related suggestions will be boosted

# In a git repository
cd /path/to/git-repo
cheat-smart commit
# Git commands will be prioritized

# With systemd available
cheat-smart service
# Systemd commands will rank higher
```

## History Database

The history database (`~/.cheats/history.db`) tracks:

- Search keywords
- Selected categories
- Command titles
- Usage scores
- Timestamps

Format:

```
timestamp|keyword|category|title|score
1699123456|docker|docker|Restart Container|87
1699123500|network|networking|Check Port|45
```

## Scoring Algorithm

### Base Scores

1. **Exact Match**: +5 (word boundary match)
2. **Partial Match**: +3 (substring match)
3. **Title Match**: +4 (keyword in section title)
4. **Category Match**: +2 (keyword in category name)
5. **File Match**: +2 (keyword in filename)
6. **Recent Usage**: +2 (found in history)
7. **Frequency**: +1 per occurrence in file

### Context Boosts

- Context detection adds 50% of context score to matching categories
- Multiple context factors stack additively
- Directory-based context adds +5 per matching keyword

### Learning Boost

- Each history entry adds +2 to base score
- Frequently used commands accumulate higher scores over time
- Recent searches (last 24 hours) get additional weight

## Integration

The smart engine integrates seamlessly with existing commands:

```bash
# Use regular cheat for simple lookups
cheat docker

# Use cheat-smart for intelligent suggestions
cheat-smart docker

# Use cheat-smart fzf for interactive ranked search
cheat-smart fzf
```

## Requirements

- Bash 4.0+
- AWK (standard on all Linux/macOS)
- Optional: fzf (for smart fzf mode)
- Optional: bat/less (for better display)

## Performance

- Pure bash implementation - no external dependencies
- Fast scoring using grep and awk
- History database uses simple text format
- Minimal overhead on system resources

## Privacy

- **100% Offline**: No network requests
- **Local Only**: All data stays on your machine
- **No AI**: Pattern-based matching only
- **No Telemetry**: Zero data collection

## Troubleshooting

### History not updating

```bash
# Check history file permissions
ls -la ~/.cheats/history.db

# Manually create if missing
touch ~/.cheats/history.db
```

### Context not detected

```bash
# Verify context detection
cd /path/with/docker-compose.yml
cheat-smart docker
# Should show "Context detected: docker docker-compose"
```

### Scores seem incorrect

```bash
# Clear history to reset learning
rm ~/.cheats/history.db
cheat-smart <keyword>
```

## Advanced Usage

### View History

```bash
# See learning patterns
cat ~/.cheats/history.db
```

### Reset Learning

```bash
# Clear history database
rm ~/.cheats/history.db
```

### Custom Context

The system automatically detects context. To maximize effectiveness:

- Work in project directories with relevant config files
- Use consistent naming in cheat categories
- Regularly use cheat-smart to build history
