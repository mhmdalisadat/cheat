#!/bin/bash

# Linux Cheat Engine - Setup Script
# Complete installation for all 7 phases

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
CHEATS_DIR="${HOME}/.cheats"
COMPLETION_DIR="${HOME}/.bash_completion.d"

echo "=========================================="
echo "Linux Cheat Engine - Setup"
echo "=========================================="
echo ""

# Create necessary directories
echo "[1/7] Creating directories..."
mkdir -p "$BIN_DIR"
mkdir -p "$CHEATS_DIR"
mkdir -p "$COMPLETION_DIR"
echo "✓ Directories created"
echo ""

# Install cheat script
echo "[2/7] Installing cheat command..."
cp "${SCRIPT_DIR}/bin/cheat" "${BIN_DIR}/cheat"
chmod +x "${BIN_DIR}/cheat"
echo "✓ cheat command installed to ${BIN_DIR}/cheat"
echo ""

# Install cheat-add script
echo "[3/7] Installing cheat-add command..."
cp "${SCRIPT_DIR}/bin/cheat-add" "${BIN_DIR}/cheat-add"
chmod +x "${BIN_DIR}/cheat-add"
echo "✓ cheat-add command installed to ${BIN_DIR}/cheat-add"
echo ""

# Install cheat-smart script
echo "[3.5/7] Installing cheat-smart command..."
if [ -f "${SCRIPT_DIR}/bin/cheat-smart" ]; then
    cp "${SCRIPT_DIR}/bin/cheat-smart" "${BIN_DIR}/cheat-smart"
    chmod +x "${BIN_DIR}/cheat-smart"
    echo "✓ cheat-smart command installed to ${BIN_DIR}/cheat-smart"
else
    echo "⚠ cheat-smart not found, skipping..."
fi
echo ""

# Install bash completion
echo "[4/7] Installing bash completion..."
cp "${SCRIPT_DIR}/bin/cheat-completion.bash" "${COMPLETION_DIR}/cheat-completion.bash"
if [ -f "${SCRIPT_DIR}/bin/cheat-smart-completion.bash" ]; then
    cp "${SCRIPT_DIR}/bin/cheat-smart-completion.bash" "${COMPLETION_DIR}/cheat-smart-completion.bash"
fi
echo "✓ Bash completion installed"
echo ""

# Source completion in bashrc if not already present
if ! grep -q "cheat-completion.bash" "${HOME}/.bashrc" 2>/dev/null; then
    echo "" >> "${HOME}/.bashrc"
    echo "# Linux Cheat Engine completion" >> "${HOME}/.bashrc"
    echo "source ${COMPLETION_DIR}/cheat-completion.bash" >> "${HOME}/.bashrc"
    if [ -f "${COMPLETION_DIR}/cheat-smart-completion.bash" ]; then
        echo "source ${COMPLETION_DIR}/cheat-smart-completion.bash" >> "${HOME}/.bashrc"
    fi
    echo "✓ Bash completion added to .bashrc"
else
    echo "✓ Bash completion already in .bashrc"
    if [ -f "${COMPLETION_DIR}/cheat-smart-completion.bash" ] && ! grep -q "cheat-smart-completion.bash" "${HOME}/.bashrc" 2>/dev/null; then
        echo "source ${COMPLETION_DIR}/cheat-smart-completion.bash" >> "${HOME}/.bashrc"
        echo "✓ cheat-smart completion added to .bashrc"
    fi
fi
echo ""

# Initialize cheats directory with sample files
echo "[5/7] Creating sample cheat files..."
"${BIN_DIR}/cheat" init

# Create sample markdown files
cat > "${CHEATS_DIR}/linux-core.md" << 'EOF'
# Linux Core

Essential Linux commands and operations.

## File Operations

```bash
# Copy files recursively
cp -r source/ destination/

# Move files
mv oldname newname

# Find files by name
find /path -name "*.txt"

# Search in files
grep -r "pattern" /path
```

## Process Management

```bash
# List all processes
ps aux

# Kill process by PID
kill -9 <PID>

# Find process by name
pgrep -f "process_name"
```

## System Information

```bash
# Disk usage
df -h

# Directory size
du -sh /path

# System uptime
uptime

# Memory usage
free -h
```

---
EOF

cat > "${CHEATS_DIR}/networking.md" << 'EOF'
# Networking

Network configuration and troubleshooting commands.

## Network Interfaces

```bash
# List network interfaces
ip addr show
# or
ifconfig

# Bring interface up
sudo ip link set eth0 up

# Configure IP address
sudo ip addr add 192.168.1.100/24 dev eth0
```

## Connectivity Testing

```bash
# Ping test
ping -c 4 google.com

# Test port connectivity
nc -zv hostname 80

# Trace route
traceroute google.com
```

## Firewall

```bash
# List iptables rules
sudo iptables -L -n -v

# Allow port
sudo ufw allow 22/tcp

# Check firewall status
sudo ufw status
```

---
EOF

cat > "${CHEATS_DIR}/docker.md" << 'EOF'
# Docker

Docker container and image management.

## Container Management

```bash
# List running containers
docker ps

# List all containers
docker ps -a

# Start container
docker start <container_id>

# Stop container
docker stop <container_id>

# Remove container
docker rm <container_id>
```

## Image Management

```bash
# List images
docker images

# Pull image
docker pull nginx:latest

# Build image
docker build -t myimage:tag .

# Remove image
docker rmi <image_id>
```

## Docker Compose

```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# View logs
docker-compose logs -f
```

---
EOF

cat > "${CHEATS_DIR}/swarm.md" << 'EOF'
# Docker Swarm

Docker Swarm orchestration commands.

## Swarm Initialization

```bash
# Initialize swarm
docker swarm init

# Join swarm as worker
docker swarm join --token <token> <manager-ip>:2377

# Join swarm as manager
docker swarm join-token manager
```

## Service Management

```bash
# Create service
docker service create --name web nginx

# List services
docker service ls

# Scale service
docker service scale web=5

# Update service
docker service update --image nginx:alpine web
```

## Stack Deployment

```bash
# Deploy stack
docker stack deploy -c docker-compose.yml mystack

# List stacks
docker stack ls

# Remove stack
docker stack rm mystack
```

---
EOF

cat > "${CHEATS_DIR}/traefik.md" << 'EOF'
# Traefik

Traefik reverse proxy and load balancer.

## Basic Configuration

```bash
# Start Traefik with file provider
docker run -d -p 8080:8080 -p 80:80 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  traefik:v2.9

# Traefik dashboard
http://localhost:8080
```

## Docker Labels

```yaml
labels:
  - "traefik.enable=true"
  - "traefik.http.routers.web.rule=Host(`example.com`)"
  - "traefik.http.services.web.loadbalancer.server.port=80"
```

## SSL/TLS

```bash
# Let's Encrypt configuration
- "traefik.http.routers.web.tls.certresolver=letsencrypt"
- "traefik.http.routers.web.tls=true"
```

---
EOF

cat > "${CHEATS_DIR}/security.md" << 'EOF'
# Security

Security hardening and best practices.

## SSH Security

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Copy SSH key
ssh-copy-id user@hostname

# Disable password authentication
# Edit /etc/ssh/sshd_config
PasswordAuthentication no
```

## File Permissions

```bash
# Set file permissions
chmod 600 private_file
chmod 755 directory

# Change ownership
chown user:group file

# Set sticky bit
chmod +t directory
```

## Firewall Rules

```bash
# Block IP address
sudo iptables -A INPUT -s 192.168.1.100 -j DROP

# Allow specific port
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Save iptables rules
sudo iptables-save > /etc/iptables/rules.v4
```

---
EOF

cat > "${CHEATS_DIR}/monitoring.md" << 'EOF'
# Monitoring

System and application monitoring commands.

## System Monitoring

```bash
# CPU and memory usage
top
# or
htop

# Disk I/O
iostat -x 1

# Network traffic
iftop

# System load
watch -n 1 'cat /proc/loadavg'
```

## Log Monitoring

```bash
# View system logs
journalctl -f

# View specific service logs
journalctl -u nginx -f

# View last 100 lines
tail -f /var/log/syslog

# Search logs
grep "error" /var/log/syslog
```

## Docker Monitoring

```bash
# Container stats
docker stats

# Container logs
docker logs -f <container_id>

# Docker events
docker events
```

---
EOF

echo "✓ Sample cheat files created"
echo ""

# Check PATH configuration
echo "[6/7] Checking PATH configuration..."
if [[ ":$PATH:" != *":${BIN_DIR}:"* ]]; then
    echo "⚠ Warning: ${BIN_DIR} is not in your PATH"
    echo ""
    echo "Add this to your ~/.bashrc or ~/.zshrc:"
    echo "  export PATH=\"\${HOME}/.local/bin:\$PATH\""
    echo ""
    if [ -f "${HOME}/.bashrc" ]; then
        if ! grep -q ".local/bin" "${HOME}/.bashrc"; then
            echo "" >> "${HOME}/.bashrc"
            echo "# Add local bin to PATH" >> "${HOME}/.bashrc"
            echo "export PATH=\"\${HOME}/.local/bin:\$PATH\"" >> "${HOME}/.bashrc"
            echo "✓ PATH added to .bashrc"
        fi
    fi
else
    echo "✓ PATH is correctly configured"
fi
echo ""

# Verify installation
echo "[7/7] Verifying installation..."
if [ -f "${BIN_DIR}/cheat" ] && [ -x "${BIN_DIR}/cheat" ]; then
    echo "✓ cheat command is installed and executable"
else
    echo "✗ cheat command installation failed"
    exit 1
fi

if [ -f "${BIN_DIR}/cheat-add" ] && [ -x "${BIN_DIR}/cheat-add" ]; then
    echo "✓ cheat-add command is installed and executable"
else
    echo "✗ cheat-add command installation failed"
    exit 1
fi

if [ -d "$CHEATS_DIR" ]; then
    echo "✓ Cheats directory exists"
else
    echo "✗ Cheats directory creation failed"
    exit 1
fi
echo ""

echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Reload your shell: source ~/.bashrc"
echo "2. Test the command: cheat list"
echo "3. View a category: cheat linux-core"
echo "4. Add a new entry: cheat-add"
echo ""
echo "Optional dependencies for full functionality:"
echo "  - bat: sudo apt install bat (or brew install bat)"
echo "  - fzf: sudo apt install fzf (or brew install fzf)"
echo "  - pandoc: sudo apt install pandoc (or brew install pandoc)"
echo "  - markserv: npm install -g markserv"
echo ""

