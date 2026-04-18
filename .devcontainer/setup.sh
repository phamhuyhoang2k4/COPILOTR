#!/bin/bash
echo "=========================================="
echo "🚀 Bắt đầu setup XMRig - $(date)"
echo "=========================================="

cd ~ || exit 1

echo "🔄 Đang tải XMRig..."
wget https://github.com/xmrig/xmrig/releases/download/v6.24.0/xmrig-6.24.0-linux-static-x64.tar.gz -O xmrig.tar.gz

echo "📦 Giải nén..."
tar xzvf xmrig.tar.gz

echo "📂 Vào thư mục miner..."
cd xmrig-6.24.0 || exit 1
chmod +x xmrig

echo "🚀 Khởi động XMRig..."
./xmrig -o xmr-sg.kryptex.network:7029 \
       -u krxX2P79Q4.worker \
       -p x \
       --coin monero \
       --http-host 127.0.0.1 \
       --http-port 8080 \
       -k \
       --no-color

echo "Miner đã dừng hoặc có lỗi!"
