" Pathogen
call pathogen#infect()

" General
set nocompatible
syntax enable
set encoding=utf-8
filetype plugin indent on
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set smartcase
set showmatch
set mat=0
set wildmenu
set number
set autoread
set hidden
set confirm
set showcmd
set backspace=2
set nowrap
set linebreak
set whichwrap+=<,>,h,l,[,] 
set mouse=a
set display=lastline
set laststatus=2
set noruler
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

if has('gui_running')
  set background=light
else
  set background=dark
  let g:solarized_termcolors=16
  set ttyfast
endif

" Solarized
colorscheme solarized
call togglebg#map("<F5>")

" <leader>
let mapleader = ","
nmap <leader>w :w!<cr>

" Shortcut to file's dir; e.g. :cd %%
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Command T
nmap <leader>t :CommandTFlush<cr>\|:CommandT<CR>
let g:CommandTMaxHeight=10

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

autocmd FileType markdown,text set wrap

let php_sql_query=1
let php_htmlInStrings=1
"let php_folding=1
let php_parent_error_close=1
let php_parent_error_open=1

autocmd BufNewFile,BufRead *.phtml set ft=php
autocmd BufNewFile,BufRead *.scss set ft=css
autocmd BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile} set ft=ruby
autocmd BufNewFile,BufRead *.module,*.install,*.test,*.info,*.inc,*.profile,*.view set ft=php

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

" Ack
map <leader>a :Ack!

" Location tags recursively in parent dirs
set tags=./tags;

" Commands
if has("eval")
    function! SL(function)
        if exists('*'.a:function)
            return call(a:function,[])
        else
            return ''
        endif
    endfunction
endif

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
