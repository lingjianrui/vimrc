"Author:lingjianrui
"Email: toiklaun@gmail.com
"----------------------Vundle----------------------
set nocompatible              " be iMproved, required
filetype off " required
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
Plugin 'VundleVim/Vundle.vim'
" 大名鼎鼎的YCM
Plugin 'Valloric/YouCompleteMe'
" tagbar
Plugin 'majutsushi/tagbar'
" 显示状态行
Plugin 'vim-airline/vim-airline'
" 状态行主题
Plugin 'vim-airline/vim-airline-themes'
" 快速搜索文件
Plugin 'ctrlpvim/ctrlp.vim'
" 文件导航
Plugin 'scrooloose/nerdtree'
" 显示缩进线
Plugin 'Yggdroot/indentLine' 
Plugin 'scrooloose/nerdcommenter'
" Go语言支持
Plugin 'fatih/vim-go'
" 自动补全括号
Plugin 'jiangmiao/auto-pairs'
" supertab用来防止使用tab展开snippet与youcompleteme的tab补全发生冲突
Plugin 'ervandew/supertab'
" ultisnips是引擎
Plugin 'SirVer/ultisnips'
" 代码片段快速补全
Plugin 'honza/vim-snippets'
" 自动格式化
Plugin 'Chiel92/vim-autoformat'
" 主题插件
Plugin 'flazz/vim-colorschemes'
call vundle#end()            " required
filetype plugin indent on    " required
" vim主题
colorscheme simple_dark
"----------------------shotcut-----------------------
let mapleader=","
set vb
"快捷键编辑vim配置文件
map<silent><leader>e :e ~/.vimrc<cr>
"快捷键打开文件导航
map<silent><leader>n :NERDTree<cr>
"快捷键设置粘贴模式
nnoremap<silent><leader>p :set paste<cr>
"快捷保存退出
map<silent><leader>w :wq<cr>                                                
"快捷开启一个tab
map<silent><leader>t :tabnew<cr>
"空格键开启关闭折叠
nnoremap <space> za
"buffer快速跳转
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>
nnoremap <leader>1 :1b<cr>
nnoremap <leader>2 :2b<cr>
nnoremap <leader>3 :3b<cr>
nnoremap <leader>4 :4b<cr>
nnoremap <leader>5 :5b<cr>
nnoremap <leader>6 :6b<cr>
nnoremap <leader>7 :7b<cr>
nnoremap <leader>8 :8b<cr>
nnoremap <leader>9 :9b<cr>
"快速打开GoDoc
map <leader>doc :GoDoc<cr>
"快速govet 检查问题
map <leader>vet :GoVet<cr>
"快速查找引用
nnoremap <leader>ref :GoReferrers<cr>
map <leader>cal :GoCallees<cr>
map <leader>imp :GoImplements<cr>
map <leader>debug :GoDebugStart .<cr>
map <leader>bb :GoDebugBreakpoint<cr>
map <leader>nx :GoDebugNext<cr>
map <leader>ns :GoDebugStep<cr>
"快速编辑代码碎片
map <leader>script :UltiSnipsEdit<cr>
"-----------------------common------------------------
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
" 退格键不好用
set backspace=indent,eol,start
" 突出显示当前行
set cursorline      
" 设置grep结果颜色
set grepprg=grep\ --color=always\ -n\ $*\ /dev/null
" 设置make结果颜色
set makeprg=make\ EXTRA_CFLAGS=-fcolor-diagnostic
hi CursorLine   cterm=bold ctermbg=darkgreen ctermfg=white
hi CursorColumn cterm=NONE ctermbg=cyan ctermfg=white 
hi Comment cterm=bold ctermfg=lightblue
hi Pmenu cterm=bold ctermfg=white ctermbg=darkgreen guifg=#ffffff guibg=#000000
" 不显示go语言插件警告
let g:go_version_warning = 0
" F6自动格式化代码并保存
noremap <F8> :Autoformat<CR>:w<CR>
let g:autoformat_verbosemode=1
" 打开文件自动折叠
set fdm=indent
"-----------------------airline-------------------------
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='bubblegum'
set laststatus=2
imap <leader>a  <C-X><C-O>


"let g:go_gopls_enabled = 0
"-----------------vim-go 只支持gopls模式----------------
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"--------------------- Tagbar 设置----------------------
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
let g:tagbar_right_=1
map <leader>tb :TagbarToggle<CR>
autocmd BufReadPost *.go call tagbar#autoopen()
"-------------------YouCompleteMe 配置------------------
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],}
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
nnoremap <leader>k :YcmCompleter GoToDefinitionElseDeclaration<CR>
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" --------------------issue fix-------------------------
" fix bug imp module
if has('python3')
      silent! python3 1
endif


