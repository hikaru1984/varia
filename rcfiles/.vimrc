set nobackup
set nocompatible
set noerrorbells visualbell t_vb=
filetype off

set shell=/bin/zsh

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
if !(&diff)
    Plugin 'ap/vim-buftabline'
    Plugin 'scrooloose/nerdtree'
    Plugin 'majutsushi/tagbar'
endif
Plugin 'Yggdroot/indentLine'

call vundle#end()            " required
filetype plugin indent on    " required

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'V'

if !(&diff)
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    map <C-T> :NERDTreeToggle<CR>
    map <C-Y> :NERDTreeFocus<CR>
endif

set clipboard^=unnamed,unnamedplus
nmap <Leader>y "*y
nmap <Leader>p "*p
nmap <Leader>d "*d
nmap <Leader>Y "+y
nmap <Leader>P "+p
nmap <Leader>D "+D

set termguicolors
colorscheme azuki
syntax on
set wildmenu
set wrap wrapmargin=160 textwidth=160
set smarttab tabstop=4 shiftwidth=4 expandtab softtabstop=4
set number numberwidth=5
set backspace=indent,eol,start
set foldmethod=indent foldnestmax=4 nofoldenable foldlevel=2
set hidden

nmap <C-N> :set invrelativenumber<CR>

let g:indentLine_char = '|'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '•'

set encoding=utf-8 fileencoding=utf-8

nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprev<CR>
nnoremap <C-D> :bd<CR>

map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>

set lcs+=space:·
nmap <C-L> :set invlist<CR>

nmap <F8> :TagbarToggle<CR>
