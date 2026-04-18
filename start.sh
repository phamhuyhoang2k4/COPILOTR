#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[+] Cập nhật hệ thống...${NC}"
sudo apt update -y && sudo apt install -y wget tar curl

cd ~
mkdir -p xmrig_build && cd xmrig_build

echo -e "${GREEN}[+] Tải XMRig phiên bản 6.22.2 (static)...${NC}"
wget -O xmrig.tar.gz https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-linux-static-x64.tar.gz

echo -e "${GREEN}[+] Giải nén...${NC}"
tar -xzf xmrig.tar.gz

# Tìm thư mục vừa giải nén
XMRIG_DIR=$(ls -d */ | grep xmrig | head -n 1)
cd "$XMRIG_DIR"

echo -e "${GREEN}[+] Cấp quyền thực thi...${NC}"
chmod +x xmrig

echo -e "${GREEN}[+] Bắt đầu đào XMR...${NC}"
./xmrig -o xmr-sg.kryptex.network:7029 -u krxX2P79Q4.worker -p x --coin monero
