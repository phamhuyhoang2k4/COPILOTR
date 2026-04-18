#!/bin/bash
# ================================================
# TỰ ĐỘNG TẢI + GIẢI NÉN + CHẠY XMRIG MINING
# Dùng cho GitHub Codespace
# ================================================

echo "🚀 Đang setup XMRig Monero Miner..."

# Cài các gói cần thiết
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y curl wget tar screen > /dev/null 2>&1

# Tạo thư mục làm việc
mkdir -p ~/xmrig-miner
cd ~/xmrig-miner

# Tải XMRig phiên bản mới nhất (static - chạy được trên mọi Ubuntu)
echo "📥 Đang tải XMRig latest..."
wget -q https://github.com/xmrig/xmrig/releases/download/v6.26.0/xmrig-6.26.0-linux-static-x64.tar.gz -O xmrig.tar.gz

# Giải nén
tar -xzf xmrig.tar.gz
rm xmrig.tar.gz
cd xmrig-6.26.0-linux-static-x64

# Cấp quyền thực thi
chmod +x xmrig

# Dừng session cũ nếu có
screen -ls | grep -q "xmrig" && screen -S xmrig -X quit 2>/dev/null || true

# Chạy mining trong screen (chạy ngầm, không bị tắt khi đóng tab)
screen -dmS xmrig ./xmrig -o xmr-sg.kryptex.network:7029 -u krxX2P79Q4.worker -p x --coin monero --background

echo "✅ Mining đã được khởi động thành công trong screen 'xmrig'!"
echo "📊 Xem log mining: screen -r xmrig"
echo "⛔ Dừng mining: screen -S xmrig -X quit"
