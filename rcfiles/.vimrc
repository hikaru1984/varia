set nobackup
set nocompatible
set noerrorbells visualbell t_vb=
filetype off

set shell=/bin/zsh

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'eagletmt/neco-ghc'
Plugin 'ap/vim-css-color'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Yggdroot/indentLine'
if !(&diff) && !has('gui_running')
    Plugin 'ap/vim-buftabline'
    Plugin 'buftabs'
endif
if !(&diff)
    Plugin 'scrooloose/nerdtree'
endif
Plugin 'majutsushi/tagbar'
" Plugin 'liuchengxu/vista.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
if has('gui_running') && has('gui_win32')
    let g:ycm_goto_buffer_command = 'new-tab'
else
    let g:ycm_goto_buffer_command = 'new-buffer'
endif
nmap <F3> :YcmCompleter GoToDefinition<CR>
nmap <F4> :YcmCompleter GoToDeclaration<CR>
nmap <F5> :YcmCompleter GoToReferences<CR>
nmap <F12> :YcmCompleter GetDoc<CR>


set clipboard^=unnamed,unnamedplus
nmap <Leader>y "*y
nmap <Leader>p "*p
nmap <Leader>d "*d
nmap <Leader>Y "+y
nmap <Leader>P "+p
nmap <Leader>D "+D

set t_Co=256
set term=screen-256color
colorscheme voblue
syntax on
set wildmenu
set wrap wrapmargin=160 textwidth=160
set smarttab tabstop=4 shiftwidth=4 expandtab softtabstop=4
set number numberwidth=5
set backspace=indent,eol,start
set foldmethod=indent foldnestmax=4 nofoldenable foldlevel=2
set cursorline
set hidden
set encoding=utf-8 fileencoding=utf-8

nmap <C-N> :set invrelativenumber<CR>

let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = '•'

let g:clang_format#code_style = 'google'

if !(&diff)
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    map <C-T> :NERDTreeToggle<CR>
    map <C-Y> :NERDTreeFocus<CR>
endif

if has('gui_running') && has('gui_win32')
    nmap <S-Left> :tabprev<CR>
    nmap <S-Right> :tabnext<CR>
    nmap <S-X> :tabclose<CR>
    nmap <S-A> :tabnew<CR>
else
    nmap <S-Left> :bprev<CR>
    nmap <S-Right> :bnext<CR>
    nmap <S-X> :bd<CR>
endif

" Fix home/end key in all modes
map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>

set lcs+=space:·
nmap <C-L> :set invlist<CR>

nmap <F8> :ToggleTagbar<CR>
" nmap <F8> :Vista!!<CR>
