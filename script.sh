#!/bin/bash

# Test CPU performance
echo "Testing CPU performance..."
cpu_cores=$(nproc)
echo "Number of CPU cores: $cpu_cores"
cpu_load=$(uptime | awk -F'load average: ' '{print $2}' | awk -F',' '{print $1}')
echo "Current CPU load: $cpu_load"

# Test memory performance
echo "Testing memory performance..."
total_mem=$(free -m | awk '/Mem:/ {print $2}')
used_mem=$(free -m | awk '/Mem:/ {print $3}')
free_mem=$(free -m | awk '/Mem:/ {print $4}')
echo "Total memory: $total_mem MB"
echo "Used memory: $used_mem MB"
echo "Free memory: $free_mem MB"

# Test disk performance
echo "Testing disk performance..."
disk_usage=$(df -h / | awk '/\// {print $(NF-1)}'| sed 's/%//g')
echo "Root disk usage: $disk_usage%"

# Test network performance
echo "Testing network performance..."
download_speed=$(curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - --share | awk '/Download/ {print $2}')
upload_speed=$(curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - --share | awk '/Upload/ {print $2}')
echo "Download speed: $download_speed"
echo "Upload speed: $upload_speed"

