" Pathogen
call pathogen#infect()

" Vim mode
set nocompatible

" Syntax highlighting
syntax enable

" Enable filetype detection
filetype plugin indent on

" UTF-8
set encoding=utf-8

" Support all three, in this order
set fileformats=unix,dos,mac

" Turn off modelines; I don't use them
set modelines=0

" Autoread and allow hidden unsaved buffers but confirm before closing
set autoread
set hidden
set confirm

" History; default is 20
set history=1000

" No tabs, 4 spaces by default
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab
set autoindent
set smartindent
set shiftround

" Continuing lines with h, l and backspace
set backspace=2
set whichwrap=h,l,<,>,[,]

" Visual aid
set showmatch
set number
set showcmd
set cursorline

" No flickering, flashes or beeps
set matchtime=0
set visualbell t_vb=

" Searching; type C-L or :noh to clear
set hlsearch
set incsearch

" Autocompletion in command mode
" Complete until point of ambiguity; tab through other options
set wildmenu
set wildmode=list:longest,full
set wildchar=<Tab>
set wildignore=*.png,*.jpg,*.gif

" Not two spaces after . or ? when joining with J
set nojoinspaces

" In many terminal emulators the mouse works just fine, thus enable it
if has('mouse')
    set mouse=a
endif

" Always set ttyfast, although it's usually already set by Vim itself
" And do no redraw while running macros
" Set title in terminal
set ttyfast
set lazyredraw
set title

" Display lastline, e.g. in minified files (instead of @@@@..)
set display=lastline

" Statusline, (inspiration) from Tim Pope
set laststatus=2
set noruler
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

" Regexes
" Turn on "very magic" regex (:h /magic)
" Set the 'g' flag by default (substitute all matches in line instead of one)
" Ignore case unless capitals are used
vmap / /\v
set gdefault
set ignorecase
set smartcase

" Quicker save; clear screen after searching; Ack
let mapleader = ","
nmap <leader>w :w!<CR>
map <C-L> :noh<CR>
map <leader>a :Ack! 

" Make Y work like C and D; use yy to yank lines
noremap Y y$

" Expected up/down on wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj

" Better use for arrow keys - up/down handy in Ack
nmap <right> :bnext<CR>
nmap <left> :bprevious<CR>
nmap <up> :cprevious<CR>
nmap <down> :cnext<CR>

" Shortcut to file's dir; e.g. :cd %%
" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Solarized
if has('gui_running')
    set background=light
else
    set background=dark
    let g:solarized_termcolors=16
endif
colorscheme solarized
call togglebg#map("<F5>")

" Command T
nmap <leader>t :CommandTFlush<cr>:CommandT<CR>

" Extra file detection
autocmd BufNewFile,BufRead *.phtml set ft=php
autocmd BufNewFile,BufRead *.scss set ft=css
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.rss,*.atom set ft=xml
autocmd BufNewFile,BufRead Gemfile,Rakefile,Vagrantfile,Capfile set ft=ruby
autocmd BufNewFile,BufRead *.{module,install,test,info,inc,profile,view} set ft=php

" Wrapping in text files; by word and leave some space for the linenumbers
autocmd FileType text,markdown setlocal wrap linebreak nolist wrapmargin=5

" Extra settings for PHP
let php_sql_query=1
let php_htmlInStrings=1

" Taglist
let Tlist_WinWidth = 30
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Show_One_File = 1
let Tlist_Use_SingleClick = 1

" Nerdtree
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 1

" Locate tags recursively in parent dirs
set tags=./tags;

" Commands
if has("eval")
    " Nicer than 'if exists' with ternary operators
    function! SL(function)
        if exists('*'.a:function)
            return call(a:function,[])
        else
            return ''
        endif
    endfunction
endif

" Local config
if filereadable("~/.vimrc.local")
    source ~/.vimrc.local
endif
