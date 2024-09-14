#!/bin/bash

# 端口号
PORT=【你自己的TCP端口】

# 检查端口是否在监听
PORT_IN_USE=$(sockstat -l | grep -q ":$PORT"; echo $?)

# 检查Argo进程是否在运行（通过检查 COMMAND 列是否包含 tunnel）
Argo_RUNNING=$(ps aux | grep "[t]unnel" ; echo $?)

# 如果端口不在使用或Argo不在运行，则执行安装脚本
if [ $PORT_IN_USE -ne 0 ] || [ $Argo_RUNNING -ne 0 ]; then
    echo "Port $PORT is not in use or Argo is not running. Starting Vmess..."

    # 设置TCP端口、ARGO_AUTH、ARGO_DOMAIN并启动老王Vmess脚本
    PORT=【你自己的TCP端口】 ARGO_AUTH=【你自己的Argo隧道密钥】 ARGO_DOMAIN=【你自己的隧道域名】 bash <(curl -Ls https://raw.githubusercontent.com/eooce/scripts/master/containers-shell/00_vmess.sh)
else
    echo "Port $PORT is in use and Argo is already running. No action needed."
fi
