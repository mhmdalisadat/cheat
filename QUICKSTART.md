# Linux Cheat Engine - Quick Start

## Installation (One Command)

```bash
chmod +x setup.sh && ./setup.sh
source ~/.bashrc
```

## Basic Usage

```bash
# List all categories
cheat

# View a category
cheat docker

# Search
cheat search "docker run"

# Add new entry
cheat-add
```

## Smart Suggestions (NEW!)

```bash
# Intelligent ranked search
cheat-smart docker

# Interactive ranked fuzzy search
cheat-smart fzf
```

## All Commands

| Command                  | Description                     |
| ------------------------ | ------------------------------- |
| `cheat`                  | List all categories             |
| `cheat <category>`       | View category contents          |
| `cheat search <keyword>` | Search all cheats               |
| `cheat fzf`              | Fuzzy search (requires fzf)     |
| `cheat exec`             | Execute commands (requires fzf) |
| `cheat git-init`         | Initialize git repository       |
| `cheat git-remote <url>` | Connect remote repo             |
| `cheat git-push`         | Push changes                    |
| `cheat git-pull`         | Pull changes                    |
| `cheat export`           | Export to PDF (requires pandoc) |
| `cheat dashboard`        | Start web dashboard             |
| `cheat-add`              | Add new cheat entry             |
| `cheat-smart <keyword>`  | Smart ranked search (NEW!)      |
| `cheat-smart fzf`        | Smart interactive search (NEW!) |

## File Locations

- **Commands**: `~/.local/bin/cheat`, `~/.local/bin/cheat-add`, `~/.local/bin/cheat-smart`
- **Cheats**: `~/.cheats/*.md`
- **History**: `~/.cheats/history.db` (learning database)
- **Completion**: `~/.bash_completion.d/cheat-completion.bash`

## Verification

```bash
./verify.sh
```

## Optional Dependencies

```bash
# Enhanced display
sudo apt install bat

# Fuzzy search
sudo apt install fzf

# PDF export
sudo apt install pandoc texlive-latex-base

# Dashboard
npm install -g markserv
```

## Smart Engine Features

The smart suggestion engine provides:

- **Context Awareness**: Detects docker, git, traefik, systemd environments
- **Intelligent Ranking**: Scores results by relevance and frequency
- **Learning System**: Learns from your usage patterns
- **100% Offline**: No AI, no network, pure local intelligence

See [SMART-ENGINE.md](SMART-ENGINE.md) for details.

## Troubleshooting

**Command not found?**

```bash
export PATH="${HOME}/.local/bin:$PATH"
# Add to ~/.bashrc for permanent fix
```

**Completion not working?**

```bash
source ~/.bash_completion.d/cheat-completion.bash
```

**Smart suggestions not ranking correctly?**

```bash
# Clear history to reset learning
rm ~/.cheats/history.db
cheat-smart <keyword>
```

**Need help?**

- See [INSTALL.md](INSTALL.md) for detailed installation
- See [USAGE.md](USAGE.md) for usage examples
- See [PHASES.md](PHASES.md) for phase documentation
- See [SMART-ENGINE.md](SMART-ENGINE.md) for smart engine guide
