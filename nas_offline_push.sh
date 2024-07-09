#!/bin/bash
ip="192.168.0.248" # 设置要ping的IP地址
interval=30       # 设置ping的间隔时间，单位为秒
while true; do
    ping -c 1 $ip >/dev/null 2>&1  # 使用ping命令ping指定的IP地址，-c 1表示只发送1个ping包
    if [ $? -eq 0 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Ping $ip succeeded"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Ping $ip failed"
        curl "http://www.pushplus.plus/send?token=2c2e9c35b4d04e34b8fdc3e5cff9cdff&title=%E8%AE%BE%E5%A4%87%E7%A6%BB%E7%BA%BF%E9%80%9A%E7%9F%A5&content=${ip}%E5%B7%B2%E7%A6%BB%E7%BA%BF%EF%BC%81&template=html"
    fi
    sleep $interval  # 间隔指定的时间后再次ping
done