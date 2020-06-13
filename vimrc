set nocompatible              " be iMproved, required                                                                           
filetype off                  " required                                                                                                
set rtp+=~/.vim/bundle/Vundle.vim                                                                                                               
call vundle#begin()                                                                                                                         
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936                                                                                        

Plugin 'VundleVim/Vundle.vim'                                                                                                                       
Plugin 'ctrlpvim/ctrlp.vim'                                                                                                                 
Plugin 'scrooloose/nerdtree'                                                                                                                    
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'

call vundle#end()            " required                                                                                             
filetype plugin indent on    " required                                                                                                         

" -- shotcut --
let mapleader=","                                                                                                               
set vb                                                                                                                          
"快捷键编辑vim配置文件
map<silent><leader>e :e ~/.vimrc<cr>                                                                                                            
"快捷键打开文件导航
map<silent><leader>n :NERDTree<cr>                                                                                                      
"快捷键设置粘贴模式
map<silent><leader>p :set paste<cr>                                                         
"快捷保存退出
map<silent><leader>w :wq<cr>                                                
"快捷开启一个tab
map<silent><leader>t :tabnew<cr>                                                                                            

"-- common --
syntax on                                                                                                                       
" 设置显示行号
set number                                                                                                                                      
" 将所有的table转换成space
set expandtab
" table键长4个空格
set tabstop=4
" 程序中自动缩进所使用的空白长度
set shiftwidth=4
" 修改自动锁紧的空白长度
set softtabstop=4
" 自动缩紧
set autoindent
" 不创建备份文件
set nobackup
" 将搜索内容高亮显示
set hlsearch
" 屏幕的右下角显示正在输入的命令
set showcmd
" 总是显示状态行
set laststatus=1
" 启动折叠
set foldenable                                                                                                                          
" 设置折叠模式为手动折叠
set foldmethod=manual                                                                                                                                                       
" 设置匿名寄存器
set clipboard=unnamed                                                                                                                                               
set term=screen-256color 
" 突出显示当前行
set cursorline      
" 不显示go语言插件警告
let g:go_version_warning = 0
" F6自动格式化代码并保存
noremap <F6> :Autoformat<CR>:w<CR>
let g:autoformat_verbosemode=1
"
"
"--ctags setting--
"" 按下F5重新生成tag文件，并更新taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags 

"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0
