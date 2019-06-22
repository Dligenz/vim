
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
se hlsearch 
set showcmd
"se sm
set cursorline
se shiftround
set laststatus=2
set nu rnu
set nocompatible              " be iMproved, required
filetype off                  " required
"Vundle的路径
set rtp+=~/.vim/bundle/Vundle.vim
"插件的安装路径
call vundle#begin('~/.vim/bundle/')
 
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'yggdroot/indentline'
Plugin 'kien/ctrlp.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'raimondi/delimitmate'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"""Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
""" Plugin 'L9'
" Git plugin not hosted on GitHub
"""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"Launch vim and run :PluginInstall
"To install from command line: vim +PluginInstall +qall

" NerdTree Settings --------------------{{{
augroup nerdtree_settings
    autocmd!
    " NERDDTree快捷键
    map <C-n> :NERDTreeFind<CR>
    nnoremap <leader>t :NERDTreeToggle<cr>
    " 显示行号
    " let NERDTreeShowLineNumbers=1
    " let NERDTreeAutoCenter=1
    " 是否显示隐藏文件
    let NERDTreeShowHidden=1
    " 设置宽度
    let NERDTreeWinSize=30
    " 在终端启动vim时，共享NERDTree
    let g:nerdtree_tabs_open_on_console_startup=1
    " 忽略一下文件的显示
    let NERDTreeIgnore=['\.pyc','\~$',
                \ '\.swp',
                \ '.DS_Store',
                \ '\.orig$',
                \ '@neomake_',
                \ '__pycache__$[[dir]]',
                \ '.pytest_cache$[[dir]]',
                \ '.git[[dir]]',
                \ '.idea[[dir]]',
                \ '.vscode[[dir]]',
                \ '.egg-info$[[dir]]']
    " 显示书签列表
    let NERDTreeShowBookmarks=1
    " 改变nerdtree的箭头
    " let g:NERDTreeDirArrowExpandable = '?'
    " let g:NERDTreeDirArrowCollapsible = '?'
    " vim不指定具体文件打开是，自动使用nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |endif

    " 当vim打开一个目录时，nerdtree自动使用
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    " 打开新的窗口，focus在buffer里而不是NerdTree里
    autocmd VimEnter * :wincmd l

    " 当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
augroup END
" }}}

" InsertMode Quick Edit --------------------{{{
" us emacs shortcut in INSERT mode
imap <C-e> <END>
imap <C-a> <HOME>
imap <C-f> <Right>
imap <C-b> <Left>
augroup relative_numbser
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END
" }}}

" airline Settings --------------------{{{
" }}}
func Wrap()
    :set wrap
endfunc
map <F10>       :call Wrap() <CR><C-W><C-W> :call Wrap() <CR> <C-W><C-W>
imap <F10>      <Esc>:call Wrap() <C-W><C-W> :call Wrap() <C-W><C-W> 

"":set noscrollbind
set tabstop=8
