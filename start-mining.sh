#!/bin/bash
# ================================================
# XMRIG MINER FIXED - Dành riêng cho GitHub Codespace
# Huge pages + config.json + screen + auto log
# ================================================

echo "🚀 Đang setup XMRig Monero Miner (Phiên bản FIXED)..."

# Cài gói cần thiết
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y curl wget tar screen > /dev/null 2>&1

# Tạo thư mục
mkdir -p ~/xmrig-miner
cd ~/xmrig-miner

# Tải XMRig mới nhất (v6.26.0)
echo "📥 Đang tải XMRig v6.26.0..."
wget -q https://github.com/xmrig/xmrig/releases/download/v6.26.0/xmrig-6.26.0-linux-static-x64.tar.gz -O xmrig.tar.gz

tar -xzf xmrig.tar.gz
rm xmrig.tar.gz
cd xmrig-6.26.0-linux-static-x64

chmod +x xmrig

# Tạo config.json (rất quan trọng)
cat > config.json << EOF
{
    "autosave": true,
    "cpu": true,
    "opencl": false,
    "cuda": false,
    "pools": [
        {
            "algo": "rx/0",
            "coin": "monero",
            "url": "xmr-sg.kryptex.network:7029",
            "user": "krxX2P79Q4.worker",
            "pass": "x",
            "keepalive": true,
            "tls": false
        }
    ],
    "randomx": {
        "1gb-pages": false,
        "huge-pages": true,
        "mode": "auto",
        "init": -1
    },
    "log-file": "miner.log",
    "no-color": true
}
EOF

# Setup huge pages (fix chính nguyên nhân không có hashrate)
echo "🔧 Đang bật Huge Pages..."
sudo sysctl -w vm.nr_hugepages=1280 > /dev/null 2>&1 || echo "⚠️ Không bật được huge pages (container limit)"

# Dừng session cũ nếu có
screen -S xmrig -X quit 2>/dev/null || true

# Chạy mining trong screen (KHÔNG dùng --background)
echo "🔥 Khởi động XMRig..."
screen -dmS xmrig ./xmrig -c config.json

echo "✅ Mining đã khởi động thành công!"

# Kiểm tra sau 8 giây
sleep 8
if screen -list | grep -q "xmrig"; then
    echo "✅ Miner đang chạy ổn định trong screen 'xmrig'"
    echo ""
    echo "📌 CÁCH SỬ DỤNG:"
    echo "   • Xem log realtime:          screen -r xmrig"
    echo "   • Thoát log (không tắt miner): Ctrl + A rồi nhấn D"
    echo "   • Dừng mining:               screen -S xmrig -X quit"
    echo "   • Xem file log:              cat miner.log | tail -n 50"
else
    echo "❌ Miner không chạy. Hãy paste lại screen -r xmrig và gửi log cho mình."
fi
