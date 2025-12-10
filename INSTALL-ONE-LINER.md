# نصب یک خطی - One-Line Installation

## نصب سریع روی VPS

### روش 1: با curl (توصیه می‌شود)

```bash
curl -fsSL https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash && source ~/.bashrc
```

### روش 2: با wget

```bash
wget -qO- https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh | bash && source ~/.bashrc
```

### روش 3: Clone و نصب مستقیم

```bash
git clone https://github.com/mhmdalisadat/cheat.git /tmp/cheat-install && cd /tmp/cheat-install && chmod +x setup.sh && ./setup.sh && rm -rf /tmp/cheat-install && source ~/.bashrc
```

## استفاده بعد از نصب

```bash
# لیست دسته‌ها
cheat list

# مشاهده یک دسته
cheat docker

# جستجوی هوشمند
cheat-smart docker

# یا از طریق دستور اصلی
cheat smart docker
```

## نیازمندی‌ها

- `git` (برای clone)
- `bash` (معمولاً پیش‌فرض است)

## نصب git (در صورت نیاز)

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y git

# CentOS/RHEL
sudo yum install -y git

# Alpine
apk add git
```

## لینک مستقیم

- Repository: https://github.com/mhmdalisadat/cheat
- install.sh: https://raw.githubusercontent.com/mhmdalisadat/cheat/main/install.sh
- setup.sh: https://raw.githubusercontent.com/mhmdalisadat/cheat/main/setup.sh
