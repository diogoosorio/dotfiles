set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdtree'
    Plugin 'kien/ctrlp.vim'
    Plugin 'jnurmine/Zenburn'
    Plugin 'mileszs/ack.vim'
call vundle#end()
filetype plugin indent on

" colorscheme
colors zenburn
syntax on

" status bar
set laststatus=2
set statusline+=%F

" 4 spaces all the things
let mapleader=","
set tabstop=4
set shiftwidth=4
set expandtab

" search settings
set ignorecase
set hlsearch
set incsearch
nnoremap <silent> <Space> :nohl<CR><C-l>

" visual helpers
set nowrap
set number
set showmatch

" make backspace work as expected
set backspace=indent,eol,start

" go back in time
set history=5000
set undolevels=5000

" no beeping, please
set visualbell
set noerrorbells

" disable swp files
set nobackup
set noswapfile

" paste mode toggler
set pastetoggle=<F12>

" enable mouse
set mouse=a

" sudo save
cmap w!! w !sudo tee % >/dev/null

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>d :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|venv|virtualenv)$',
  \ }

" indentation by file type
au FileType yaml setl sw=2 sts=2 et
