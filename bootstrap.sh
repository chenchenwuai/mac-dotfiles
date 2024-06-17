#!/bin/bash

echo "[--- Bootstrap ---]: starting"

# 修改主机名
hostnamectl set-hostname xxcc
echo "[--- Bootstrap ---]: 修改主机名为 xxcc"

# 检测是否已安装
is_installed() {
  local software_name="$1"

  if ! command -v "$software_name" >/dev/null 2>&1; then
    return 1
  else
    return 0
  fi
}

# 检测 yum 是否安装
if ! is_installed "yum"; then
  echo "[--- Bootstrap ---]: Error: yum 未安装"
  exit 1
fi
echo "[--- Bootstrap ---]: yum 已安装"

# 安装 nginx
if ! is_installed "nginx"; then
  source ./nginx/install.sh
  if [ $? -ne 0 ]; then
    echo "[--- Bootstrap ---]: Error install nginx"
    exit 1
  fi
else
  echo "[--- Bootstrap ---]: nginx 已安装"
fi


# yum 安装一些软件
echo "[--- Bootstrap ---]: Install git unzip qrencode: Starting"
yum install git unzip qrencode -y

echo "[--- Bootstrap ---]: git unzip qrencode 已安装"

# 安装 nvm
if ! is_installed "nvm"; then
  source ./install_nvm.sh
  if [ $? -ne 0 ]; then
    echo "[--- Bootstrap ---]: Error install nvm"
    exit 1
  fi
else
  echo "[--- Bootstrap ---]: nvm 已安装"
fi


if [ ! is_installed "node" ] && [ is_installed "nvm" ]; then
  echo "[--- Bootstrap ---]: Install node16: Starting"
  nvm install 16
  echo "[--- Bootstrap ---]: Install node16: Finished"
else
  echo "[--- Bootstrap ---]: node16 已安装"
fi

cp -n ./bash/.aliases ~/.aliases

if [ -f ~/.bashrc ]; then
  echo "[[ ! -f ~/.aliases ]] || source ~/.aliases" > ~/.bashrc
  echo "[--- Bootstrap ---]: Loaded .aliases"
else
  echo "[--- Bootstrap ---]: Error not found .bashrc file"
fi

echo "[--- Bootstrap ---]: Bootstrap Finished!, Please recreate shell."
