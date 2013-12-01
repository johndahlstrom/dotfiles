set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'maciakl/vim-neatstatus'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'kshenoy/vim-signature'
Bundle 'scrooloose/nerdtree'


" Source the vimrc file after saving it
if has('autocmd')
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

syntax on
set number
colorscheme mustang

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set hidden

" Enable filetype detection
filetype plugin indent on
filetype indent on
filetype plugin on
filetype on


" Wildmenu
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.git,*.svn

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


" Better navigation between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copy with xclip
map <leader>c :w !xclip -sel clip<CR><CR>

" Nerdtree options and mappings
let g:NERDTreeDirArrows=0
map <C-n> :NERDTreeToggle<CR>
