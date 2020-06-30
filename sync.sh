#! /bin/bash
cd /root/vimrc
cp ~/.vimrc vimrc
cp ~/.tmux.conf tmux.conf
git add .
git commit -m "更新vimrc"
git push

