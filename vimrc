" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>


" the width of a tab is set to 4
set tabstop=4 

" indents will have a width of 4
set shiftwidth=4

" sets the number of columns for a TAB
set softtabstop=4

" expand TABs to spaces
set expandtab

" show matching brackets
set showmatch

" highlight characters in magenta when line goes over 80-character maximum
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)

set cursorline

set colorcolumn=80

" auto-indentation
set autoindent

" turn on filetype detection
filetype on

" enable plugins and load plugin for the detected file type 
filetype plugin on

" load an indent file for the detected file type
filetype indent on

" set the commands to save in history default number is 20
set history=1000

" enable auto completion menu after pressing TAB
set wildmenu

" make wildmenu behave similar to bash completion
set wildmode=list:longest

" files and directories we want to ignore
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*/.git/*,*/tmp/*,*.swp

" yaml specific settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" set leader to <space>
let mapleader=" "

" use 'jk' to exit insert mode
inoremap jk <ESC>

" easy buffer switching
nnoremap <leader>n :bn<enter>
nnoremap <leader>b :bp<enter>
nnoremap <leader>d :bd<enter>
nnoremap <leader>l :ls<enter>

" Keep cursor in middle of screen when scrolling with Ctrl+d/Ctrl+u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" keep search terms in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv


" plug-in Specific Configurations:

" change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" use ripgrep with CtrlP
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" solarized dark colorscheme
set background=dark
colorscheme solarized


" enable file overriding for local customization
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
