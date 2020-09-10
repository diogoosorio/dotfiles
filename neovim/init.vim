
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction
call plug#begin('~/.vim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'scrooloose/nerdTree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'morhetz/gruvbox'
  Plug 'mileszs/ack.vim'
call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

" colorscheme
colorscheme gruvbox
set background=dark
syntax on

" status bar
set laststatus=2

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

" tab shortcuts
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tt :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

" sudo save
cmap w!! w !sudo tee % >/dev/null

" tab navigation
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tt :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

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

" Ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

