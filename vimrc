" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" General
set nocompatible
syntax enable
set autoindent
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set ruler
set wildmenu
set number
set autoread
set backspace=indent,eol,start
filetype plugin on
filetype indent on
set ttyfast
set encoding=utf-8
set mat=0
set wrap
set linebreak
set whichwrap+=<,>,h,l,[,] 
set hidden

" Background and colorscheme
if has('gui_running')
  set background=light
  colorscheme solarized
  call togglebg#map("<F5>")
else
  set background=dark
  colorscheme desert
  set mouse=a
endif

let mapleader = ","
nmap <leader>w :w!<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <C-L> :nohls<CR>h " Redraw
nmap <leader>= gg=G`` " Auto-indent file

" Command T
nmap <leader>t  :CommandT<CR>

" Autocommands
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd Filetype sql set omnifunc=sqlcomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete

let php_sql_query=1
let php_htmlInStrings=1
"let php_folding=1
let php_parent_error_close=1
let php_parent_error_open=1

autocmd BufNewFile,BufRead *.phtml set ft=php
autocmd BufNewFile,BufRead *.scss set ft=css

autocmd FileType python set sw=4 sts=4
autocmd FileType php set sw=4 sts=4

" Drupal extensions.. brr.
autocmd BufNewFile,BufRead *.module set ft=php
autocmd BufNewFile,BufRead *.install set ft=php
autocmd BufNewFile,BufRead *.test set ft=php
autocmd BufNewFile,BufRead *.info set ft=php
autocmd BufNewFile,BufRead *.inc set ft=php
autocmd BufNewFile,BufRead *.profile set ft=php
autocmd BufNewFile,BufRead *.view set ft=php

" Lint
:autocmd FileType php noremap <C-L> :!php -l %<CR>

" Taglist
let Tlist_WinWidth = 30
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Show_One_File = 1
let Tlist_Use_SingleClick = 1

" Nerdtree
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>

" Locatie tags recursively in parent dirs
set tags=./tags;

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
