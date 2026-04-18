#!/bin/bash

# Màu sắc cho terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[+] Bắt đầu cài đặt môi trường đào XMR...${NC}"

# Cập nhật hệ thống và cài đặt wget, tar nếu chưa có
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y wget tar

# Tạo thư mục làm việc
mkdir -p ~/xmrig_build
cd ~/xmrig_build

# Tải phiên bản XMRig mới nhất cho Linux (x86_64)
echo -e "${GREEN}[+] Đang tải XMRig...${NC}"
wget https://github.com/xmrig/xmrig/releases/latest/download/xmrig-6.22.2-linux-static-x64.tar.gz

# Giải nén
echo -e "${GREEN}[+] Giải nén...${NC}"
tar -xvf xmrig-6.22.2-linux-static-x64.tar.gz

# Di chuyển vào thư mục vừa giải nén
cd xmrig-6.22.2

# Cấp quyền thực thi
chmod +x xmrig

# Chạy lệnh đào
echo -e "${GREEN}[+] Bắt đầu đào XMR...${NC}"
./xmrig -o xmr-sg.kryptex.network:7029 -u krxX2P79Q4.worker -p x --coin monero
