#!/bin/bash

# VmessTCP端口号
PORT=1977

# 检查端口是否在监听，存在跳过，不存在执行安装老王脚本
if sockstat -l | grep -q ":$PORT"; then
    echo "Port $PORT is already in use. No action needed."
else
    echo "Port $PORT is not in use. Starting Hysteria2..."
    PORT=$PORT bash /home/tilltill1234/2.sh
fi

# 远程执行 check_and_start.sh 脚本检查S9
echo "Connecting to s9.serv00.com to execute check_and_start.sh..."
ssh till@s9.serv00.com 'bash /home/till/check_and_start.sh'
