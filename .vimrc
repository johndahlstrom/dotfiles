" Pathogen loading
call pathogen#infect()
call pathogen#helptags()

" Theme settings
set background=dark
colorscheme mustang
syntax on

" General settings
set mouse=a                     " enable mouse
set number                      " enable line numbers
set autoindent                  " enable autoindent
set smartindent                 " enable smartindent
set tabstop=2                   " tabs are 2 spaces long
set shiftwidth=2                " tabs are 2 spaces long
set smarttab                    " be smart when using tabs
set expandtab                   " create space when using tab
set hidden                      " hide buffers instead of closing them
set backspace=indent,eol,start	" allow backspace in insertmode

" Enable filetype detection
filetype plugin indent on
filetype indent on
filetype on

" Search options
set incsearch                   " find the next match as we type
set hlsearch                    " highlight searches
set ignorecase                  " ignore case when searching
set smartcase                   " unless query contains at least one capital letter
set gdefault                    " add the g flag to search/replace by default

" Swapfiles are annoying...
set noswapfile
set nobackup
set nowb

" Map W and Q become w and q
cmap W w
cmap Q q

" Easier way to remove search highlights
map <silent> // :set hlsearch!<CR>

" Map leader to ,
let mapleader = ","

" Delete and paste without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
nnoremap <leader>p "_ddP
vnoremap <leader>p "_dP

" Easy window split
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Close window with Q
noremap <silent> Q <C-w>c

" Lets use xclip to copy text for outside uses
map <F1> :w !xclip -sel clip<CR><CR>


