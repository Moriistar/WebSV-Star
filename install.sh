#!/bin/bash

# رنگ‌های ترمینال
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}[*] در حال نصب WebSV-Star...${NC}"

# بررسی نصب git
if ! command -v git &> /dev/null; then
    echo -e "${RED}[!] git نصب نیست!${NC}"
    exit 1
fi

# نصب Node.js
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}[*] نصب Node.js...${NC}"
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# نصب npm
if ! command -v npm &> /dev/null; then
    echo -e "${YELLOW}[*] نصب npm...${NC}"
    sudo apt-get install -y npm
fi

# کلون ریپو
echo -e "${YELLOW}[*] دانلود پروژه...${NC}"
git clone https://github.com/MoriiStar/WebSV-Star.git
cd WebSV-Star

# نصب کتابخانه‌ها
echo -e "${YELLOW}[*] نصب کتابخانه‌ها...${NC}"
npm install

# تنظیم فایل محیطی
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo -e "${YELLOW}[!] لطفا فایل .env را ویرایش کنید${NC}"
fi

echo -e "${GREEN}[✅] نصب با موفقیت انجام شد!${NC}"
echo -e "برای اجرا از دستورات زیر استفاده کنید:"
echo -e "1. cd WebSV-Star"
echo -e "2. npm start"
