"set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
"let Vundle manage Vundle
Bundle 'gmarik/vundle'
"vim 内部控制
Bundle 'L9'
"git 控制
Bundle 'tpope/vim-fugitive'
"快速定位
Bundle 'Lokaltog/vim-easymotion'
"快速写html
Bundle 'mattn/emmet-vim'
"文件浏览
Bundle 'scrooloose/nerdtree'
"编辑器色彩
Bundle 'chriskempson/vim-tomorrow-theme'
"文件查找
Bundle 'kien/ctrlp.vim'
"语法检测
Bundle 'scrooloose/syntastic'
"对齐
Bundle 'godlygeek/tabular'
"注释
Bundle 'vim-scripts/tComment'
"代码提示
Bundle 'drmingdrmer/xptemplate' 
"符号补全()
Bundle 'jiangmiao/auto-pairs'
"自动补全
Bundle 'Shougo/neocomplcache.vim'
"状态栏
Bundle 'Lokaltog/powerline'
"buffer管理
Bundle 'fholgado/minibufexpl.vim'
"变量方法浏览
Bundle 'majutsushi/tagbar'


"自动检测文件类型
filetype plugin indent on
"定义eas  ymotion leader key
let g:EasyMotion_leader_key = '/'

"F4单独切换打开nerd_tree（nerd_tree插件）
let g:NERDChristmasTree = 1              "色彩显示
let g:NERDTreeShowHidden = 1             "显示隐藏文件
let g:NERDTreeWinPos = 'left'            "窗口显示位置
let g:NERDTreeHighlightCursorline = 0    "高亮当前行
nmap <F4>  :NERDTree<CR>


"配色方案
colorscheme Tomorrow-Night

"语法检测设置
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

"注释设置
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>
set encoding=utf-8
"设置一个黑色背景
set background=dark
"语法检测
syntax enable
"语法高亮
syntax on
"拼写检测
" set spell
"设置可切换buffer在没有保存的情况下
set hidden
"可以使用鼠标
" set mouse=a
set number
"vim自动切换到当前文件目录
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9]*://" | lcd %:p:h | endif 
"Tab切换窗口
nmap <Tab> <C-W>w
"高亮光标行 
set cursorline 
"Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %
"高亮搜索的关键字
set hlsearch
"搜索忽略大小写
set ignorecase


"自动补全
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"neocomplcache 设置
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><TAB> pumvisible()?"\<C-n>":"\<TAB>"
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'

" powerline 设置
" powerline{
 set guifont=PowerlineSymbols\ for\ Powerline
 set nocompatible
 set t_Co=256
 let g:Powerline_symbols = 'fancy'
" }
"TagBar 触发
nmap <F8> :TagbarToggle<CR>
"F12生成/更新tags文件
set tags=tags;
set autochdir
" Ctrl + F12删除&&更新tags文件
function! DeleteTagsFile()
    "Linux下的删除方法
    silent !rm tags
    "Windows下的删除方法
    " silent !del /F /Q tags
    silent !ctags -R --languages=php,c --c-kinds=+p --fields=+ianS --extra=+q
endfunction
nmap <C-F12> :call DeleteTagsFile()<CR>
"退出VIM之前删除tags文件
au VimLeavePre * call DeleteTagsFile()
