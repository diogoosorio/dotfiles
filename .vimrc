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
    Plugin 'jlanzarotta/bufexplorer'
    Plugin 'w0rp/ale'
    Plugin 'jmcantrell/vim-virtualenv'
    Plugin 'davidhalter/jedi-vim'
call vundle#end()
filetype plugin indent on

" colorscheme
colors zenburn
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

" status line
set statusline+=%F
set statusline+=%=%{virtualenv#statusline()}

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

" indentation by file type
au FileType yaml setl sw=2 sts=2 et
au FileType yml setl sw=2 sts=2 et

" virtualenv.vim
let g:virtualenv_stl_format=' [virtualenv: %n] '

if (isdirectory(getcwd() . "/venv"))
    let g:virtualenv_directory = getcwd()
    autocmd VimEnter * VirtualEnvActivate venv
endif

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

" jedi-vim
let g:jedi#goto_command = "<leader>f"
let g:jedi#goto_assignments_command = "<leader>g"
autocmd FileType python setlocal completeopt-=preview
