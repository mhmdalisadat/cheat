# راهنمای افزودن دستورات - How to Add Commands

## روش‌های افزودن دستورات

### روش 1: استفاده از `cheat-add` (توصیه می‌شود)

ساده‌ترین روش برای افزودن دستورات جدید:

#### حالت تعاملی (Interactive)

```bash
cheat-add
```

سپس به سوالات پاسخ دهید:

1. **Category**: دسته‌ای که می‌خواهید دستور را اضافه کنید (مثلاً `docker`, `linux-core`, `networking`)
2. **Title**: عنوان دستور (مثلاً `Restart Container`)
3. **Command**: دستور یا توضیحات (می‌توانید چند خط وارد کنید، با Ctrl+D تمام کنید)

**مثال:**

```bash
$ cheat-add
Available categories:
docker
linux-core
networking
security

Enter category (or new category name): docker
Enter title: Restart All Containers
Enter command or description (press Enter, then Ctrl+D when done):
docker restart $(docker ps -q)
^D
Cheat entry added to /home/user/.cheats/docker.md
```

#### حالت غیرتعاملی (Non-Interactive)

```bash
cheat-add <category> <title> <command>
```

**مثال:**

```bash
cheat-add docker "List Running Containers" "docker ps"
cheat-add git "Show Git Status" "git status"
cheat-add linux-core "Find Large Files" "find / -size +100M -type f"
```

### روش 2: ویرایش مستقیم فایل‌های Markdown

می‌توانید مستقیماً فایل‌های markdown را ویرایش کنید:

```bash
# باز کردن فایل با ویرایشگر
nano ~/.cheats/docker.md
# یا
vim ~/.cheats/docker.md
# یا
code ~/.cheats/docker.md  # VS Code
```

#### ساختار فایل Markdown

````markdown
# Docker

Cheat sheets for docker.

## Restart Container

```bash
docker restart <container_id>
```
````

## List Running Containers

```bash
docker ps
```

## Stop All Containers

```bash
docker stop $(docker ps -q)
```

---

````

### روش 3: افزودن دسته جدید

اگر دسته جدیدی می‌خواهید ایجاد کنید:

```bash
# روش 1: با cheat-add (خودکار ایجاد می‌شود)
cheat-add my-new-category "First Command" "my-command"

# روش 2: ایجاد دستی
cat > ~/.cheats/my-new-category.md << 'EOF'
# My New Category

Description of this category.

## First Command

```bash
my-command --option
````

---

EOF

````

## مثال‌های عملی

### مثال 1: افزودن دستور Docker

```bash
cheat-add docker "Remove All Stopped Containers" "docker container prune -f"
````

### مثال 2: افزودن دستور Git

```bash
cheat-add git "Create and Switch Branch" "git checkout -b feature/new-feature"
```

### مثال 3: افزودن دستور Linux

```bash
cheat-add linux-core "Check Disk Space" "df -h | grep -E '^/dev'"
```

### مثال 4: افزودن دستور چندخطی

```bash
cheat-add docker "Docker Compose Up" "docker-compose up -d
docker-compose logs -f"
```

یا با ویرایش مستقیم:

````markdown
## Docker Compose Setup

```bash
# Start services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```
````

````

## ساختار پیشنهادی برای دستورات

### 1. عنوان واضح

```markdown
## Restart Container
````

نه:

```markdown
## cmd1
```

### 2. دستور در بلوک کد

````markdown
```bash
docker restart <container_id>
```
````

````

### 3. توضیحات (اختیاری)

```markdown
## Restart Container

Restart a running container by ID or name.

```bash
docker restart <container_id>
````

````

### 4. مثال‌های متعدد

```markdown
## Docker Logs

```bash
# View logs
docker logs <container_id>

# Follow logs
docker logs -f <container_id>

# Last 100 lines
docker logs --tail 100 <container_id>
````

````

## دسته‌بندی پیشنهادی

### دسته‌های موجود

- `linux-core` - دستورات پایه لینوکس
- `networking` - شبکه و اتصالات
- `docker` - Docker و کانتینرها
- `swarm` - Docker Swarm
- `traefik` - Traefik reverse proxy
- `security` - امنیت و دسترسی‌ها
- `monitoring` - مانیتورینگ و لاگ‌ها
- `git` - Git و version control

### ایجاد دسته‌های جدید

می‌توانید دسته‌های جدید ایجاد کنید:

```bash
# مثال: دسته برای Kubernetes
cheat-add kubernetes "Get Pods" "kubectl get pods"

# مثال: دسته برای Nginx
cheat-add nginx "Restart Nginx" "sudo systemctl restart nginx"
````

## افزودن دستورات به صورت دسته‌ای

### با استفاده از اسکریپت

```bash
# ایجاد فایل با دستورات
cat > /tmp/add-cheats.sh << 'EOF'
#!/bin/bash
cheat-add docker "Stop Container" "docker stop <id>"
cheat-add docker "Start Container" "docker start <id>"
cheat-add docker "Remove Container" "docker rm <id>"
cheat-add git "Add All Files" "git add ."
cheat-add git "Commit Changes" "git commit -m 'message'"
EOF

chmod +x /tmp/add-cheats.sh
/tmp/add-cheats.sh
```

### با استفاده از حلقه

```bash
# افزودن چند دستور مشابه
for cmd in "start" "stop" "restart" "status"; do
    cheat-add docker "Container $cmd" "docker container $cmd <id>"
done
```

## بررسی دستورات اضافه شده

```bash
# مشاهده دسته
cheat docker

# جستجو
cheat search "restart"

# جستجوی هوشمند
cheat-smart docker
```

## ویرایش دستورات موجود

```bash
# باز کردن فایل
nano ~/.cheats/docker.md

# یا با cheat-smart پیدا کردن و ویرایش
cheat-smart "restart"
# سپس فایل را ویرایش کنید
```

## حذف دستورات

```bash
# باز کردن فایل
nano ~/.cheats/docker.md

# حذف بخش مربوطه
# یا استفاده از sed
sed -i '/^## Restart Container$/,/^---$/d' ~/.cheats/docker.md
```

## نکات مهم

### 1. فرمت صحیح

- همیشه از `##` برای عنوان استفاده کنید
- دستورات را در بلوک ` ```bash ` قرار دهید
- از `---` برای جدا کردن entries استفاده کنید

### 2. نام‌گذاری

- از عنوان‌های واضح و توصیفی استفاده کنید
- از کاراکترهای خاص در عنوان‌ها پرهیز کنید

### 3. سازماندهی

- دستورات مرتبط را در یک دسته قرار دهید
- از دسته‌های منطقی استفاده کنید

### 4. به‌روزرسانی

```bash
# همگام‌سازی با Git (اگر تنظیم کرده‌اید)
cheat git-push
```

## مثال کامل

```bash
# افزودن چند دستور Docker
cheat-add docker "List Containers" "docker ps -a"
cheat-add docker "Remove Container" "docker rm <container_id>"
cheat-add docker "View Logs" "docker logs <container_id>"
cheat-add docker "Execute Command" "docker exec -it <container_id> /bin/bash"

# بررسی
cheat docker

# جستجو
cheat search "docker"
```

## عیب‌یابی

### مشکل: دستور اضافه نشد

```bash
# بررسی وجود فایل
ls -la ~/.cheats/

# بررسی محتوای فایل
cat ~/.cheats/docker.md

# بررسی دسترسی
chmod 644 ~/.cheats/*.md
```

### مشکل: دستور نمایش داده نمی‌شود

```bash
# بررسی فرمت Markdown
head -20 ~/.cheats/docker.md

# بررسی syntax
cheat docker
```

## بهترین روش‌ها (Best Practices)

1. **استفاده از cheat-add**: برای افزودن سریع و آسان
2. **ویرایش مستقیم**: برای افزودن دستورات پیچیده یا چندخطی
3. **سازماندهی**: دستورات مرتبط را در یک دسته قرار دهید
4. **مستندسازی**: توضیحات کوتاه اضافه کنید
5. **به‌روزرسانی**: به‌طور منظم دستورات را بررسی و به‌روز کنید

## مثال‌های پیشرفته

### افزودن دستور با متغیرها

````markdown
## Copy File to Container

```bash
docker cp <local_path> <container_id>:<container_path>
docker cp <container_id>:<container_path> <local_path>
```
````

````

### افزودن دستور با گزینه‌ها

```markdown
## Docker Build

```bash
# Build with tag
docker build -t myimage:tag .

# Build without cache
docker build --no-cache -t myimage:tag .

# Build with build args
docker build --build-arg KEY=value -t myimage:tag .
````

````

### افزودن دستور با مثال‌های واقعی

```markdown
## Git Workflow

```bash
# Create feature branch
git checkout -b feature/new-feature

# Make changes and commit
git add .
git commit -m "Add new feature"

# Push to remote
git push origin feature/new-feature
````

```

```
