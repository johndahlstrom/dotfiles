" Pathogen loading
call pathogen#infect()
call pathogen#helptags()

" Theme settings
set background=dark
colorscheme mustang
syntax on
set lazyredraw

" General settings
set mouse=a                     " enable mouse
set number                      " enable line numbers
set autoindent                  " enable autoindent
set smartindent                 " enable smartindent
set tabstop=2                   " tabs are 2 spaces long
set shiftwidth=2                " tabs are 2 spaces long
set smarttab                    " be smart when using tab
set expandtab                   " create space when using tab
set hidden                      " hide buffers instead of closing them
set backspace=indent,eol,start	" allow backspace in insertmode

" Wildmenu
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.git,*.svn

" Enable filetype detection
filetype plugin indent on
filetype indent on
filetype plugin on
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

" Source the vimrc file after saving it
if has('autocmd')
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   execute "normal! g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%

if has('statusline')
  set laststatus=2

  set statusline=%<%f\ 
  set statusline+=%w%h%m%r
  set statusline+=\ [%{&ff}/%Y]\ 
  set statusline+=%#warningmsg#
  set statusline+=%*

  set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif

let g:Powerline_symbols = 'fancy'

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
vmap <leader>c :w !xclip -sel clip<CR><CR>

" Update jslint and go to the next error, if there is one.
nmap <F4> :JSLintUpdate<CR>:cn<CR>

" Better navigation between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Easier way to make lower/uppercase letters
map § ~

" Faster way to search
map <space> /

" Easier navigation between buffers
map <leader>ö :bNext<CR>
map <leader>ä :bprev<CR>

" Arrow keys are bad (not really but you know...)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Make Ctrl+C operate exactly like ESC. Apparently didn't work from default
" when using block mode.
map <C-c> <esc>

" Ctrl+P to document PHP code.
inoremap <C-P> <ESC>:call PhpDoc()<CR>i

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Don't move on *
nnoremap * *<c-o>

" Better movement
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Easier to type
noremap H ^
noremap L $
vnoremap L g_

" Window resize
nnoremap <s-left> 5<c-w><
nnoremap <s-right> 5<c-w>>
