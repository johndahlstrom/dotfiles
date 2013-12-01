set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'maciakl/vim-neatstatus'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-commentary'
Bundle 'conormcd/matchindent.vim'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/syntastic'
Bundle 'evidens/vim-twig'
Bundle 'rhysd/clever-f.vim'
Bundle 'Lokaltog/vim-easymotion'


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

" Map space to search and ctrl-space
nmap <space> /

" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<cr>

" Reselect visual block after indent/outdent.
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

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
let NERDTreeShowHidden=1

" Tabular bindings
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" UltiSnips settings
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-l>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Return to last edit position when opening files 
autocmd BufReadPost *   
      \ if line("'\"") > 0 && line("'\"") <= line("$") |   
      \   execute "normal! g`\"" |
      \ endif 
" Remember info about open buffers on close 
set viminfo^=%

" if php file, enable html syntaxes
au BufNewFile,BufRead * if &ft == 'php' | set ft=php.html | endif

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

" Easymotion
let g:EasyMotion_leader_key = '<Leader>'

