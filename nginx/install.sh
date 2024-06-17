#!/bin/bash

echo "[--- Bootstrap ---]: Install nginx: Starting"
yum install nginx -y

systemctl start nginx # 启动 nginx
systemctl status nginx # 查看 nginx 状态
systemctl enable nginx # 设置 nginx 开机自动开启

# 复制网站代码
unzip ./blog.zip -d /var/www/
cp -n ./blog.conf /etc/nginx/conf.d/blog.conf
cp -n ./game.conf /etc/nginx/conf.d/game.conf

nginx -s reload # 重新启用 nginx 配置

echo "[--- Bootstrap ---]: 创建 /etc/nginx/ssl 文件夹，将ssl证书进去 'xxcc.fun_bundle.crt', 'xxcc.fun.key'，然后重启nginx"
echo "[--- Bootstrap ---]: Install nginx: Finished"
