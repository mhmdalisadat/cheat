# نصب از راه دور - Remote Installation

## نصب مستقیم از GitHub

می‌توانید Linux Cheat Engine را مستقیماً از GitHub روی هر VPS یا سرور نصب کنید.

### روش 1: استفاده از install.sh (توصیه می‌شود)

```bash
# دانلود و اجرای اسکریپت نصب
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash

# یا با wget
wget -qO- https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash
```

### روش 2: دستور یک خطی (One-liner)

```bash
# Clone و نصب در یک خط
git clone https://github.com/mhmdalisadat/cheat.git /tmp/cheat-install && \
cd /tmp/cheat-install && \
chmod +x setup.sh && \
./setup.sh && \
rm -rf /tmp/cheat-install && \
source ~/.bashrc
```

### روش 3: نصب دستی

```bash
# 1. Clone repository
git clone https://github.com/mhmdalisadat/cheat.git ~/cheat

# 2. اجرای setup
cd ~/cheat
chmod +x setup.sh
./setup.sh

# 3. Reload shell
source ~/.bashrc

# 4. (اختیاری) حذف فایل‌های clone شده
rm -rf ~/cheat
```

## نصب روی VPS

### Ubuntu/Debian

```bash
# اطمینان از نصب git
sudo apt update && sudo apt install -y git

# نصب Cheat Engine
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash

# Reload shell
source ~/.bashrc
```

### CentOS/RHEL

```bash
# اطمینان از نصب git
sudo yum install -y git

# نصب Cheat Engine
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash

# Reload shell
source ~/.bashrc
```

### Alpine Linux

```bash
# اطمینان از نصب git
apk add git bash

# نصب Cheat Engine
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash

# Reload shell
source ~/.bashrc
```

## تأیید نصب

```bash
# بررسی دستورات
cheat list
cheat-smart docker

# بررسی PATH
echo $PATH | grep -q ".local/bin" && echo "✓ PATH configured" || echo "✗ PATH not configured"

# بررسی فایل‌ها
ls -la ~/.local/bin/cheat*
ls -la ~/.cheats/
```

## به‌روزرسانی

برای به‌روزرسانی به آخرین نسخه:

```bash
# روش 1: حذف و نصب مجدد
rm -rf ~/.local/bin/cheat* ~/.cheats
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash
source ~/.bashrc

# روش 2: Pull از repository
cd ~/cheat  # اگر clone کرده‌اید
git pull origin main
./setup.sh
source ~/.bashrc
```

## عیب‌یابی

### مشکل: git not found

```bash
# Ubuntu/Debian
sudo apt install git

# CentOS/RHEL
sudo yum install git

# Alpine
apk add git
```

### مشکل: curl not found

```bash
# استفاده از wget به جای curl
wget -qO- https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash

# یا نصب curl
sudo apt install curl  # Ubuntu/Debian
sudo yum install curl  # CentOS/RHEL
```

### مشکل: Permission denied

```bash
# بررسی permissions
chmod +x ~/cheat/setup.sh
chmod +x ~/.local/bin/cheat*

# یا اجرا با bash
bash ~/cheat/setup.sh
```

### مشکل: PATH not set

```bash
# اضافه کردن دستی به PATH
export PATH="${HOME}/.local/bin:$PATH"

# اضافه کردن دائمی
echo 'export PATH="${HOME}/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## امنیت

⚠️ **توجه**: اجرای اسکریپت‌ها از اینترنت باید با احتیاط انجام شود.

برای بررسی محتوای اسکریپت قبل از اجرا:

```bash
# مشاهده محتوای install.sh
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh

# مشاهده محتوای setup.sh
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/setup.sh
```

## استفاده بعد از نصب

```bash
# لیست دسته‌ها
cheat list

# مشاهده یک دسته
cheat docker

# جستجو
cheat search "docker run"

# جستجوی هوشمند
cheat-smart docker
cheat smart docker

# افزودن cheat جدید
cheat-add

# Fuzzy search
cheat fzf
cheat-smart fzf
```

## لینک‌های مفید

- Repository: https://github.com/mhmdalisadat/cheat
- Raw install.sh: https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh
- Raw setup.sh: https://raw.githubusercontent.com/mhmdalisadat/cheat/main/setup.sh
