# Centos7 Initialization

## 如何使用

+ 复制整个文件夹到需要初始化的服务器的 root 目录。

  `scp -r /.dotfiles root@hostname:~/.dotfiles`

+ 进入服务器的shell，给刚才复制过来的文件夹添加可执行权限

  `find ~/.dotfiles -type f -name "*.sh" -exec chmod +x {} \`

+ 然后进入到文件夹内部，运行初始化命令即可

  ```shell
    cd ~/.dotfiles
    ./bootstrap.sh
  ```
