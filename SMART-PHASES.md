# Smart Suggestion Engine - Phase Implementation

## PHASE A – Local Intelligence Core ✓

### Implementation

- ✅ Created `~/.local/bin/cheat-smart` command
- ✅ Search across all `~/.cheats/*.md` files
- ✅ Ranking based on:
  - Frequency of keyword in cheat files
  - Recent usage in `~/.cheats/history.db`
  - Matching command patterns
- ✅ Lightweight scoring engine (pure bash + awk):
  - Exact match = +5
  - Partial match = +3
  - File/category relevance = +2
  - Keyword in title = +4
  - Recently used = +2
  - Frequency boost = +1 per occurrence

### Files

- `bin/cheat-smart` - Main smart command (lines 1-350)
- `calculate_score()` function - Scoring algorithm

### Verification

```bash
cheat-smart docker
cheat-smart network
```

---

## PHASE B – Context Awareness ✓

### Implementation

- ✅ Environment detection:
  - Docker installed → prefer docker suggestions (+10)
  - `docker-compose.yml` in cwd → boost docker/swarm (+15)
  - `stack.yml` in cwd → boost swarm (+15)
  - `traefik.yml` or `traefik.toml` → boost traefik (+12)
  - `.git` folder exists → boost git (+8)
  - Systemd available → boost systemctl (+10)
  - Directory path analysis → boost matching keywords (+5)
- ✅ Context boost applied to matching categories
- ✅ Pure bash implementation

### Files

- `bin/cheat-smart` - `detect_context()` function (lines 50-90)

### Verification

```bash
# In directory with docker-compose.yml
cd /path/with/docker-compose.yml
cheat-smart restart
# Should show docker-related suggestions first

# In git repository
cd /path/to/git-repo
cheat-smart commit
# Should prioritize git commands
```

---

## PHASE C – Smart Mode via FZF ✓

### Implementation

- ✅ `cheat-smart fzf` command
- ✅ Fuzzy-selection list of all cheat entries
- ✅ Ranked by relevance:
  - Most relevant entries at top
  - Relevance score shown as prefix: `[87] docker restart container`
- ✅ After selection:
  - Opens entry using default viewer (bat/less)
  - Records selection in history database

### Files

- `bin/cheat-smart` - `smart_fzf()` function (lines 160-250)

### Verification

```bash
# Requires fzf
sudo apt install fzf  # or brew install fzf
cheat-smart fzf
# Select entry, view ranked results
```

---

## PHASE D – Command Frequency Learning ✓

### Implementation

- ✅ Lightweight local "learning" system
- ✅ History database: `~/.cheats/history.db`
- ✅ Format: `timestamp|keyword|category|title|score`
- ✅ Each `cheat-smart` result writes to history
- ✅ Each `cheat-smart fzf` selection records usage
- ✅ Recent usage boosts future suggestions
- ✅ Frequency tracking for commands

### Files

- `bin/cheat-smart` - History functions (lines 25-30, 140-150, 240-250)
- `init_history_db()` - Initialize database
- History recording in `smart_search()` and `smart_fzf()`

### Verification

```bash
# Search multiple times
cheat-smart docker
cheat-smart docker
cheat-smart docker

# Check history
cat ~/.cheats/history.db

# Future searches will boost frequently used entries
cheat-smart docker
# Docker entries should rank higher
```

---

## Complete Command Reference

### Smart Commands

```bash
cheat-smart <keyword>     # Intelligent search with ranking
cheat-smart fzf            # Interactive ranked fuzzy search
```

### Integration with Existing Commands

```bash
cheat <category>           # Simple category view
cheat search <keyword>     # Basic grep search
cheat-smart <keyword>      # Smart ranked search
cheat-smart fzf            # Smart interactive search
```

---

## Scoring Details

### Base Scoring

| Factor         | Score | Description              |
| -------------- | ----- | ------------------------ |
| Exact match    | +5    | Word boundary match      |
| Partial match  | +3    | Substring match          |
| Title match    | +4    | Keyword in `## Title`    |
| Category match | +2    | Keyword in category name |
| File match     | +2    | Keyword in filename      |
| Recent usage   | +2    | Found in history.db      |
| Frequency      | +1    | Per occurrence in file   |

### Context Boosts

| Context            | Base Boost | Additional  |
| ------------------ | ---------- | ----------- |
| Docker installed   | +10        | -           |
| docker-compose.yml | +15        | -           |
| stack.yml          | +15        | -           |
| traefik.yml        | +12        | -           |
| .git directory     | +8         | -           |
| systemd            | +10        | -           |
| Directory match    | +5         | Per keyword |

### Learning Boost

- History entry: +2 per occurrence
- Recent (24h): Additional +1
- Frequency accumulation: Continuous learning

---

## Dependencies

| Phase | Required  | Optional |
| ----- | --------- | -------- |
| A     | bash, awk | -        |
| B     | bash      | -        |
| C     | bash, fzf | -        |
| D     | bash      | -        |

---

## Installation

The smart engine is installed automatically with `setup.sh`:

```bash
./setup.sh
```

Or manually:

```bash
cp bin/cheat-smart ~/.local/bin/cheat-smart
chmod +x ~/.local/bin/cheat-smart
```

---

## Performance Notes

- Pure bash implementation - fast startup
- AWK for text processing - efficient
- History database - simple text format
- No external AI dependencies
- Minimal memory footprint
