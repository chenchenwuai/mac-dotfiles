#!/bin/bash

echo "[--- Bootstrap ---]: Install nvm: Starting"
# 下载并安装 NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
if [ $? -ne 0 ]; then
  exit 1
fi


# 设置 NVM 环境变量
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 验证 NVM 是否安装成功
nvm --version
echo "[--- Bootstrap ---]: Install nvm: Finished"
