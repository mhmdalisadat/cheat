# Linux Cheat Engine

A terminal-based personal tool for storing, searching, reading, running, and syncing categorized Linux/DevOps cheat-sheets.

## Features

- ✅ **Category Management**: Organized markdown cheat files
- ✅ **Search**: Global search across all cheat sheets
- ✅ **Fuzzy Search**: Interactive browsing with fzf
- ✅ **Command Execution**: Safe execution mode with confirmation
- ✅ **Git Sync**: Version control and remote synchronization
- ✅ **Export**: PDF generation from all cheat sheets
- ✅ **Dashboard**: Local web server for viewing cheats
- ✅ **Smart Suggestions**: AI-free intelligent ranking with context awareness
- ✅ **Learning System**: Local frequency-based learning from usage patterns

## Quick Start

### نصب محلی (Local Installation)

```bash
# Run setup
./setup.sh

# Reload shell
source ~/.bashrc

# List categories
cheat list

# View a category
cheat docker

# Search
cheat search "docker run"

# Add new entry
cheat-add
```

### نصب از راه دور (Remote Installation)

```bash
# نصب مستقیم از GitHub (روی VPS)
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash

# یا دستور یک خطی
git clone https://github.com/mhmdalisadat/cheat.git /tmp/cheat-install && \
cd /tmp/cheat-install && chmod +x setup.sh && ./setup.sh && rm -rf /tmp/cheat-install && source ~/.bashrc
```

برای جزئیات بیشتر: [INSTALL-REMOTE.md](INSTALL-REMOTE.md)

## Installation

- **Local**: See [INSTALL.md](INSTALL.md) for local installation
- **Remote/VPS**: See [INSTALL-REMOTE.md](INSTALL-REMOTE.md) for remote installation from GitHub

## Usage

See [USAGE.md](USAGE.md) for complete usage guide.

## Project Structure

```
cheat/
├── bin/
│   ├── cheat                 # Main CLI tool
│   ├── cheat-add             # Add cheat entries
│   └── cheat-completion.bash # Bash completion
├── setup.sh                  # Installation script
├── INSTALL.md                # Installation guide
├── USAGE.md                  # Usage guide
└── README.MD                 # This file
```

## Phases

### Core Phases (1-7)

- **PHASE 1**: Core MVP with basic listing and viewing
- **PHASE 2**: Search and add functionality
- **PHASE 3**: UI improvements and autocomplete
- **PHASE 4**: Fuzzy search integration
- **PHASE 5**: Command execution mode
- **PHASE 6**: Git version control sync
- **PHASE 7**: Export and dashboard features

### Smart Engine Phases (A-G)

- **PHASE A**: Local Intelligence Core with scoring engine
- **PHASE B**: Context Awareness (docker, git, traefik, etc.)
- **PHASE C**: Smart FZF mode with ranked results
- **PHASE D**: Command frequency learning system
- **PHASE E**: Pattern Recognition (regex-based command/tool extraction)
- **PHASE F**: Integration with main cheat CLI
- **PHASE G**: Complete deliverables and verification

See [SMART-PHASES.md](SMART-PHASES.md) and [PHASE-EFG.md](PHASE-EFG.md) for detailed documentation.

## Requirements

- Bash 4.0+
- AWK (standard on Linux/macOS)
- Linux/macOS/WSL
- Optional: bat, fzf, pandoc, markserv

## Documentation

- [INSTALL.md](INSTALL.md) - Local installation guide
- [INSTALL-REMOTE.md](INSTALL-REMOTE.md) - Remote/VPS installation guide
- [INSTALL-ONE-LINER.md](INSTALL-ONE-LINER.md) - One-line installation commands
- [INSTALL-SMART.md](INSTALL-SMART.md) - Smart engine installation
- [USAGE.md](USAGE.md) - Usage examples
- [HOW-TO-ADD.md](HOW-TO-ADD.md) - راهنمای افزودن دستورات جدید
- [PHASES.md](PHASES.md) - Core phase documentation
- [SMART-ENGINE.md](SMART-ENGINE.md) - Smart suggestion engine guide
- [SMART-PHASES.md](SMART-PHASES.md) - Smart engine phase details (A-D)
- [PHASE-EFG.md](PHASE-EFG.md) - Pattern recognition & integration (E-G)

## License

MIT
