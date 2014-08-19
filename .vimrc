set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()


Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/syntastic'
Plugin 'evidens/vim-twig'
Plugin 'tokutake/twig-indent'
Plugin 'chase/vim-ansible-yaml'
Plugin 'rhysd/clever-f.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'matze/vim-move'
Plugin 'tmhedberg/matchit'
Plugin 'Townk/vim-autoclose'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'

call vundle#end()

" Enable filetype detection
filetype plugin indent on

syntax on
set number
set t_Co=256
colorscheme monokai
set ttyfast
set laststatus=2
set showcmd
set showmode
set ruler
set autoread
set encoding=utf-8 nobomb
set backspace=indent,eol,start
set cursorline



" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vim/vimundo

" Use Ctrl as the Move modifier (Ctrl-j & Ctrl-k)
let g:move_key_modifier = 'C'

" NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>, <CR>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup().'\<C-h>'
inoremap <expr><BS> neocomplete#smart_close_popup().'\<C-h>'
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
inoremap <expr><C-c> neocomplete#cancel_popup()
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"


" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermbg=blue guifg=Black ctermfg=white
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermbg=8 guifg=White ctermfg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermbg=8 guifg=White ctermfg=15

" Formats the statusline
set statusline=\ \ \ \ %f               " file name
set statusline+=\ %y            "filetype
set statusline+=%h              "help file flag
set statusline+=%m              "modified flag
set statusline+=%r              "read only flag

set statusline+=\ %=            " align left
set statusline+=Line:%l/%L      " line X of Y
set statusline+=\ Col:%c        " current column

" Fix GitGutter to be readable
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set hidden


" Wildmenu
set wildmenu
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.git,*.svn
set wildignore+=*/vendor/**
set wildignore+=*/app/cache/**
set wildignore+=*/app/logs/**
set wildignore+=*/node_modules/**

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

" Make :W and :Q aliases of :w and :q.
command! W w
command! Q q
command! Wq wq
command! WQ wq

 " Map leader to ,
let mapleader = ","

" Map space to search and ctrl-space
nmap <space> /

" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<cr>

" Toggle pasting.
map <leader>pp :setlocal paste!<cr>

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

" Scroll viewport faster.
nnoremap <c-e> 3<C-e>
nnoremap <c-y> 3<C-y>

" Copy with xclip
map <leader>c :w !xclip -sel clip<CR><CR>

" Return to last edit position when opening files
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   execute "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%

" if php file, enable html syntaxes
"au BufNewFile,BufRead * if &ft == 'php' | set ft=php.html | endif

" if twig file, enable twig syntaxes
autocmd BufNewFile,BufRead *.html.twig set ft=html.twig

" Remove trailing whitespace
autocmd BufWritePre *.* :%s/\s\+$//e
autocmd BufWritePost *.* :%s/\s\+$//e

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

" Switch between buffers
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" Easymotion
let g:EasyMotion_leader_key = '<Leader>'

" Nerdtree options and mappings
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
map <C-e> :NERDTreeToggle<CR>

" Run codeception
nmap <C-t> :!php codecept.phar run --steps<CR>

" Better omni-complete menu.
set completeopt=menu,preview

" C-f to search for functions/tags (thanks to the Ctrl-P plugin)
map <C-f> :CtrlPBufTag<CR>

" Symfony, clear cache
map <leader>cc :!php app/console cache:clear<CR>

" Source and edit vimrc
map <leader>vimrc :so ~/.vimrc<CR>
map <leader>evimrc :e ~/.vimrc<CR>

" lets make escape a little more accessible
inoremap jj <esc>


" highlight last inserted text
nnoremap gV `[v`]
