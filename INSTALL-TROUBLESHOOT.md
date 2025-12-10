# عیب‌یابی نصب - Installation Troubleshooting

## مشکل: اتصال به GitHub برقرار نمی‌شود

### راه‌حل 1: استفاده از wget به جای curl

```bash
wget -qO- https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash
```

### راه‌حل 2: Clone مستقیم از Repository

```bash
# Clone repository
git clone https://github.com/mhmdalisadat/cheat.git /tmp/cheat-install

# اجرای setup
cd /tmp/cheat-install
chmod +x setup.sh
./setup.sh

# پاکسازی
rm -rf /tmp/cheat-install

# Reload shell
source ~/.bashrc
```

### راه‌حل 3: دانلود دستی فایل‌ها

```bash
# ایجاد دایرکتوری موقت
mkdir -p /tmp/cheat-install
cd /tmp/cheat-install

# دانلود فایل setup.sh (اگر دسترسی دارید)
# یا کپی از سیستم دیگر

# اجرای setup
chmod +x setup.sh
./setup.sh

# پاکسازی
cd ~
rm -rf /tmp/cheat-install
source ~/.bashrc
```

### راه‌حل 4: استفاده از Proxy (اگر در دسترس است)

```bash
# تنظیم proxy برای curl
export http_proxy=http://proxy-server:port
export https_proxy=http://proxy-server:port

# سپس اجرای نصب
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash
```

### راه‌حل 5: نصب دستی کامل

```bash
# 1. ایجاد دایرکتوری‌ها
mkdir -p ~/.local/bin
mkdir -p ~/.cheats
mkdir -p ~/.bash_completion.d

# 2. Clone repository (یا کپی فایل‌ها)
git clone https://github.com/mhmdalisadat/cheat.git ~/cheat-repo
# یا اگر git هم کار نمی‌کند، فایل‌ها را از جای دیگر کپی کنید

# 3. کپی اسکریپت‌ها
cp ~/cheat-repo/bin/cheat ~/.local/bin/cheat
cp ~/cheat-repo/bin/cheat-add ~/.local/bin/cheat-add
cp ~/cheat-repo/bin/cheat-smart ~/.local/bin/cheat-smart
cp ~/cheat-repo/bin/cheat-completion.bash ~/.bash_completion.d/
cp ~/cheat-repo/bin/cheat-smart-completion.bash ~/.bash_completion.d/

# 4. تنظیم دسترسی اجرا
chmod +x ~/.local/bin/cheat*
chmod +x ~/.bash_completion.d/*.bash

# 5. اضافه کردن به PATH
echo 'export PATH="${HOME}/.local/bin:$PATH"' >> ~/.bashrc
echo 'source ~/.bash_completion.d/cheat-completion.bash' >> ~/.bashrc
echo 'source ~/.bash_completion.d/cheat-smart-completion.bash' >> ~/.bashrc

# 6. ایجاد فایل‌های نمونه cheat
mkdir -p ~/.cheats
# کپی فایل‌های نمونه از ~/cheat-repo (اگر وجود دارند)
# یا ایجاد دستی

# 7. Reload shell
source ~/.bashrc

# 8. تست
cheat list
```

### راه‌حل 6: استفاده از Mirror یا CDN

اگر از ایران هستید، می‌توانید از mirror استفاده کنید:

```bash
# استفاده از ghproxy.com (اگر در دسترس است)
curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash
```

### راه‌حل 7: نصب از سیستم دیگر

```bash
# روی سیستم دیگری که دسترسی دارد:
# 1. Clone repository
git clone https://github.com/mhmdalisadat/cheat.git

# 2. ایجاد archive
cd cheat
tar -czf cheat-install.tar.gz bin/ setup.sh

# 3. انتقال به VPS (با scp)
scp cheat-install.tar.gz user@vps:/tmp/

# روی VPS:
cd /tmp
tar -xzf cheat-install.tar.gz
chmod +x setup.sh
./setup.sh
source ~/.bashrc
```

## مشکلات رایج دیگر

### مشکل: git not found

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y git

# CentOS/RHEL
sudo yum install -y git

# Alpine
apk add git
```

### مشکل: bash not found

```bash
# Ubuntu/Debian
sudo apt install -y bash

# Alpine (استفاده از sh)
sh setup.sh
```

### مشکل: Permission denied

```bash
# بررسی permissions
ls -la ~/.local/bin/cheat*

# تنظیم permissions
chmod +x ~/.local/bin/cheat*
chmod +x ~/.bash_completion.d/*.bash
```

### مشکل: PATH not set

```bash
# اضافه کردن دستی
export PATH="${HOME}/.local/bin:$PATH"

# اضافه کردن دائمی
echo 'export PATH="${HOME}/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## بررسی نصب

```bash
# بررسی دستورات
which cheat
which cheat-add
which cheat-smart

# تست دستورات
cheat list
cheat-add --help

# بررسی فایل‌ها
ls -la ~/.local/bin/cheat*
ls -la ~/.cheats/
```

## نصب بدون اینترنت

اگر کاملاً بدون اینترنت هستید:

1. روی سیستم دیگری که اینترنت دارد، repository را clone کنید
2. فایل‌های `bin/` و `setup.sh` را در یک archive قرار دهید
3. Archive را به VPS منتقل کنید (USB، شبکه محلی، و غیره)
4. Extract و اجرای `setup.sh`

## پشتیبانی

اگر هیچکدام از راه‌حل‌ها کار نکرد:

1. بررسی کنید که git نصب است: `git --version`
2. بررسی اتصال: `ping github.com`
3. بررسی DNS: `nslookup github.com`
4. استفاده از IP مستقیم (اگر می‌دانید)
