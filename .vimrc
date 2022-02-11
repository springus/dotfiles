" plugin manager ---------------------------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/bundles')

" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" tomlセット
let s:toml_dir=expand('~/.dein/')
let s:toml=s:toml_dir . 'dein.toml'
let s:toml_lazy=s:toml_dir . 'dein-lazy.toml'

" プラグインのロード
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml)
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" インストールしていないプラグインがあればインストールを実行
if dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on
syntax enable

" ------------------------------------------------------------
set encoding=UTF-8
"shell 指定
set shell=/bin/zsh
"行番号を表示
set number

syntax enable
"set termguicolors

"vim vi compatible off
set nocompatible
"backspace on
set backspace=indent,eol,start

filetype plugin indent on
set cindent
"set tabstop=1
"set softtabstop=1
set autoindent
set smartindent
set shiftwidth=2
au FileType go setlocal sw=4 ts=4 sts=4 noet

"jjでnormal mode に戻る
inoremap jj <ESC>
"クリップボート連携
set clipboard=unnamed
"入力中移動
inoremap <c-h> <left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <right>
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$
" 括弧の補完
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
" クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
"NERDTree
noremap <c-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden =1
"autocmd vimenter * NERDTree
map <c-l> gt
map <c-h> gT
"vim-auto-save
let g:auto_save=1
let g:auto_save_silent=1

