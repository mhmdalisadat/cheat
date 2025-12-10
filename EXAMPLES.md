# مثال‌های عملی - Practical Examples

## مثال‌های افزودن دستورات

### مثال 1: افزودن دستورات Docker

```bash
# افزودن دستورات Docker به صورت دسته‌ای
cheat-add docker "List All Containers" "docker ps -a"
cheat-add docker "Stop Container" "docker stop <container_id>"
cheat-add docker "Start Container" "docker start <container_id>"
cheat-add docker "Remove Container" "docker rm <container_id>"
cheat-add docker "View Container Logs" "docker logs <container_id>"
cheat-add docker "Execute Command in Container" "docker exec -it <container_id> /bin/bash"
```

### مثال 2: افزودن دستورات Git

```bash
cheat-add git "Create New Branch" "git checkout -b <branch_name>"
cheat-add git "Switch Branch" "git checkout <branch_name>"
cheat-add git "Merge Branch" "git merge <branch_name>"
cheat-add git "Delete Branch" "git branch -d <branch_name>"
cheat-add git "Show Git Log" "git log --oneline --graph --all"
cheat-add git "Undo Last Commit" "git reset --soft HEAD~1"
```

### مثال 3: افزودن دستورات Linux

```bash
cheat-add linux-core "Find Large Files" "find / -size +100M -type f 2>/dev/null"
cheat-add linux-core "Kill Process by Name" "pkill -f <process_name>"
cheat-add linux-core "Show Disk Usage" "du -sh * | sort -hr"
cheat-add linux-core "Monitor System Resources" "htop"
cheat-add linux-core "Check Port Status" "netstat -tulpn | grep :<port>"
```

### مثال 4: افزودن دستورات Network

```bash
cheat-add networking "Test Connectivity" "ping -c 4 <host>"
cheat-add networking "Check Open Ports" "nmap -p- <host>"
cheat-add networking "Show Network Interfaces" "ip addr show"
cheat-add networking "Test DNS" "dig <domain>"
cheat-add networking "Show Routing Table" "ip route show"
```

### مثال 5: افزودن دستورات Security

```bash
cheat-add security "Generate SSH Key" "ssh-keygen -t ed25519 -C 'email@example.com'"
cheat-add security "Copy SSH Key" "ssh-copy-id user@hostname"
cheat-add security "Check File Permissions" "ls -la <file>"
cheat-add security "Change File Owner" "chown user:group <file>"
cheat-add security "Set File Permissions" "chmod 600 <file>"
```

## مثال‌های دستورات چندخطی

### با ویرایش مستقیم فایل

```bash
# باز کردن فایل
nano ~/.cheats/docker.md
```

سپس اضافه کنید:

````markdown
## Docker Compose Workflow

```bash
# Start services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down

# Rebuild and restart
docker-compose up -d --build
```
````

````

## مثال‌های دستورات با متغیر

```markdown
## Docker Run with Options

```bash
# Run container with port mapping
docker run -d -p <host_port>:<container_port> <image>

# Run with volume mount
docker run -d -v <host_path>:<container_path> <image>

# Run with environment variables
docker run -d -e KEY=value <image>
````

````

## مثال‌های سازماندهی شده

### ایجاد دسته جدید برای Kubernetes

```bash
# ایجاد دسته جدید
cheat-add kubernetes "Get Pods" "kubectl get pods"
cheat-add kubernetes "Get Services" "kubectl get services"
cheat-add kubernetes "Describe Pod" "kubectl describe pod <pod_name>"
cheat-add kubernetes "Get Logs" "kubectl logs <pod_name>"
cheat-add kubernetes "Exec into Pod" "kubectl exec -it <pod_name> -- /bin/bash"
````

### ایجاد دسته جدید برای Nginx

```bash
cheat-add nginx "Test Configuration" "nginx -t"
cheat-add nginx "Reload Configuration" "sudo systemctl reload nginx"
cheat-add nginx "Restart Nginx" "sudo systemctl restart nginx"
cheat-add nginx "View Error Logs" "tail -f /var/log/nginx/error.log"
```

## مثال‌های پیشرفته

### دستورات با شرط

````markdown
## Conditional Docker Commands

```bash
# Stop all running containers
docker stop $(docker ps -q)

# Remove all stopped containers
docker container prune -f

# Remove all unused images
docker image prune -a -f
```
````

````

### دستورات با Pipe

```markdown
## Advanced Linux Commands

```bash
# Find and kill process
ps aux | grep <process> | grep -v grep | awk '{print $2}' | xargs kill

# Count files in directory
find . -type f | wc -l

# Find largest files
find / -type f -exec ls -lh {} \; | awk '{print $5, $9}' | sort -hr | head -10
````

````

## استفاده از دستورات اضافه شده

```bash
# مشاهده دسته
cheat docker

# جستجو
cheat search "restart"

# جستجوی هوشمند
cheat-smart docker

# Fuzzy search
cheat fzf
cheat-smart fzf
````

## به‌روزرسانی دستورات

```bash
# ویرایش فایل
nano ~/.cheats/docker.md

# یا با sed
sed -i 's/old-command/new-command/g' ~/.cheats/docker.md
```

## همگام‌سازی با Git

```bash
# اگر Git تنظیم کرده‌اید
cheat git-push

# یا دستی
cd ~/.cheats
git add .
git commit -m "Add new commands"
git push
```
