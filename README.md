# vimrc
系统环境Centos 7.3
自己用的vim配置
# Go1.13安装 
**这里比较坑 vim-go插件不支持Go1.12的module模式 所以老老实实升级吧**
```
wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz
tar -xzf go1.13.3.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=/root/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
```
# python3.7的安装 (如果没有安装python3.7 需要先安装python3.7 YCM需要)
1. 下载源码
```
wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tar.xz
sudo tar xvf Python-3.7.2.tar.xz 
cd python-3.7.2
```
2. 编译安装 这里必须要--enable-shared 要不然后续安装YCM会有提示要求 你的python必须是enable-shared
```
./configure --prefix=/usr/local/python37 --with-ssl --enable-shared
yum install libffi-devel
make && make install
```
3. 安装完了需要把包依赖添加到python3.conf 配置文件 然后执行ldconfig重载
```
echo "/usr/local/python37/lib" -> /etc/ld.so.conf.d/python3.conf 
ldconfig
```

# cmake 的安装
**要不然执行 install.py --go-completer 会报错**
```
wget https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2.tar.gz
tar -zxvf cmake-3.13.2.tar.gz 
cd cmake-3.13.2/
./bootstrap
gmake
gmake install
```

# vim8.1安装
1. 下载源码
wget ftp://ftp.vim.org/pub/vim/unix/vim-8.1.tar.bz2
2. 下载解压工具
yum install bzip2
3. 解压
tar jxvf vim-8.1.tar.bz2
4. 安装依赖
yum install ncurses-devel
5. 编译源码 这里面比较坑--enable-python3interp=dynamic 这个参数需要设置成dynamic 要不然YCM会让vim挂掉
下面的参数编译前要看看存不存在 
**/usr/local/bin/python3**
**/usr/local/python37/lib/python3.7/config-3.7m-x86_64-linux-gnu**
```
cd vim81 && ./configure --with-features=huge --enable-multibyte --enable-gtk3-check  --with-python3-command=/usr/local/bin/python3 --enable-python3interp=dynamic --with-python3-config-dir=/usr/local/python37/lib/python3.7/config-3.7m-x86_64-linux-gnu --enable-cscope
make
sudo make install
```
6. 安装完成了 自动安装到/usr/local/bin/vim 这里可以自己加 prefix 设置位置 如果用默认的位置，就需要增加启动别名
```
alias vim='/usr/local/bin/vim'
echo "alias vim='/usr/local/bin/vim' " >> ~/.bash_profile
source ~/.bash_profile
```

# YCM 安装
通过vundle vim插件管理工具 vim中执行:PluginInstall了之后 会得到~/.vim/bundle/YouCompleteMe 目录
.vimrc中添加这个
**Plugin 'Valloric/YouCompleteMe'**
```
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --go-completer
```
查看一下大小 大概有220M
```
du -sh ~/.vim/bundle/YouCompleteMe
```
# vim-go 插件使用
**Plugin 'fatih/vim-go'**
1. 自动补全vim-go 自带自动补全 其实完全没有必要使用YCM  <c-x><c-o> 就可以触发提示
2. 因为YCM比较强大 想要让YCM支持vim-go 需要在~/.vim/bundle/YouCompleteMe/install.py --go-completer
3. 安装vim-go之后，需要执行**:GoInstallBinaries**安装vim-go用到的一堆依赖 如果安装失败 可以手动安装 如下
```
go get github.com/nsf/gocode
go get github.com/alecthomas/gometalinter
go get github.com/bradfitz/goimports
go get golang.org/x/tools/cmd/guru
go get golang.org/x/tools/cmd/gorename
go get github.com/golang/lint/golint
go get github.com/rogpeppe/godef
go get github.com/kisielk/errcheck
go get github.com/jstemmer/gotags
go get github.com/klauspost/asmfmt/cmd/asmfmt
go get github.com/fatih/motion
go get github.com/zmb3/gogetdoc
go get github.com/josharian/impl
```
1. GoDef 跳转到函数或变量的定义
2. GoDoc 打开api文档
3. GoRun 执行go文件
4. GoImports 导入所有的依赖
