# Linux Cheat Engine - Installation Guide

## Quick Setup

```bash
# Clone or download this repository
cd cheat

# Run setup script
chmod +x setup.sh
./setup.sh

# Reload shell
source ~/.bashrc
```

## Manual Installation

### 1. Create Directories

```bash
mkdir -p ~/.local/bin
mkdir -p ~/.cheats
mkdir -p ~/.bash_completion.d
```

### 2. Install Scripts

```bash
cp bin/cheat ~/.local/bin/cheat
cp bin/cheat-add ~/.local/bin/cheat-add
chmod +x ~/.local/bin/cheat
chmod +x ~/.local/bin/cheat-add
```

### 3. Install Bash Completion

```bash
cp bin/cheat-completion.bash ~/.bash_completion.d/cheat-completion.bash
echo "source ~/.bash_completion.d/cheat-completion.bash" >> ~/.bashrc
```

### 4. Add to PATH

```bash
echo 'export PATH="${HOME}/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### 5. Initialize Cheats Directory

```bash
cheat init
```

## Verification

```bash
# Test basic command
cheat list

# Test category view
cheat linux-core

# Test search
cheat search docker

# Test add command
cheat-add
```

## Optional Dependencies

### For Enhanced Display (PHASE 3)

```bash
# Ubuntu/Debian
sudo apt install bat

# macOS
brew install bat
```

### For Fuzzy Search (PHASE 4)

```bash
# Ubuntu/Debian
sudo apt install fzf

# macOS
brew install fzf
```

### For PDF Export (PHASE 7)

```bash
# Ubuntu/Debian
sudo apt install pandoc texlive-latex-base

# macOS
brew install pandoc basictex
```

### For Dashboard (PHASE 7)

```bash
npm install -g markserv
```

## Troubleshooting

### Command not found

- Ensure `~/.local/bin` is in your PATH
- Run: `export PATH="${HOME}/.local/bin:$PATH"`
- Add to `~/.bashrc` permanently

### Permission denied

- Make scripts executable: `chmod +x ~/.local/bin/cheat*`

### Completion not working

- Source completion file: `source ~/.bash_completion.d/cheat-completion.bash`
- Restart terminal
