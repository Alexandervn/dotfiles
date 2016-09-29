" Pathogen
call pathogen#infect()

" Vim mode
set nocompatible

" Syntax coloring and filetype detection
syntax enable
filetype plugin indent on

" Backups and swapfiles, but not in my working dir please
set backupdir=~/tmp,/tmp
set directory=~/tmp,/tmp

" UTF-8
set encoding=utf-8

" Support all three
set fileformats=unix,dos,mac

" Longer history (default: 20)
set history=1000

" No modelines
set modelines=0

" Autoread and allow hidden unsaved buffers but confirm before closing
set autoread
set hidden
set confirm

" <leader> and quicker save
let mapleader = ","
nmap <leader>w :w!<CR>

" No tabs, 4 spaces, autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set shiftround

" Soft wrapping
set wrap
set linebreak
set nolist

" Continuing lines with h, l and backspace
set backspace=2
set whichwrap=h,l,<,>,[,]

" Visual aid
set number
set showcmd
set cursorline
set showmatch

" No flickering, flashes or beeps
set matchtime=0
set visualbell t_vb=

" Highlighted incremental search
" Redraw like in Bash to clear the search
set hlsearch
set incsearch
map <C-L> :nohls<CR>

" Regexes
" Turn on "very magic" regex (:h /magic)
" Set the 'g' flag by default (substitute all matches in line instead of one)
" Ignore case unless capitals are used
nnoremap / /\v
vnoremap / /\v
set gdefault
set ignorecase
set smartcase

" Complete until point of ambiguity; tab through other options
set wildmenu
set wildmode=list:longest,full
set wildchar=<Tab>
set wildignore=*.png,*.jpg,*.gif

" Not two spaces after . or ? when joining with J
set nojoinspaces

" Terminals
set ttyfast
set lazyredraw
set title
set mouse=a

" Display lastline, e.g. in minified files (instead of @@@@..)
set display=lastline

" Statusline, (inspiration) from Tim Pope
set laststatus=2
set noruler
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

" Easy scrolling through results with up/down
map <leader>a :Ack!<CR>
nmap <up> :cprevious<CR>
nmap <down> :cnext<CR>

" Expected up/down on wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj

" Shortcut to file's dir; e.g. :cd %%
" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" MousePasteToggle with <F3>
" For paste with <RightMouse> in insert mode
map <F3> :call MousePasteToggle()<CR>

function! MousePasteToggle()
  if &mouse == 'a'
    set mouse=
    set paste
    echo "Mouse off, paste on"
  else
    set mouse=a
    set nopaste
    echo "Mouse on, paste off"
  endif
endfunction

" Solarized
if has('gui_running')
    set background=light
else
    set background=dark
    let g:solarized_termcolors=16
endif
colorscheme solarized
call togglebg#map("<F5>")

" Extra file detection
autocmd BufNewFile,BufRead *.phtml set ft=php
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.rss,*.atom set ft=xml
autocmd BufNewFile,BufRead Gemfile,Rakefile,Vagrantfile,Capfile set ft=ruby
autocmd BufNewFile,BufRead *.{module,install,test,info,inc,profile,view} set ft=php
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.cshtml set filetype=html

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

" NERDTree
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 1

" Ctrlp
map <leader>s :CtrlP<CR>

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
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
