set nobackup
set nocompatible
set noerrorbells visualbell t_vb=
filetype off

set shell=/bin/zsh

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/base16-vim'
Plugin 'lifepillar/vim-colortemplate'
if !(&diff)
    Plugin 'valloric/youcompleteme'
    Plugin 'ap/vim-buftabline'
    Plugin 'majutsushi/tagbar'
    Plugin 'itchyny/lightline.vim'
    Plugin 'Shougo/vimproc.vim'
endif
Plugin 'Yggdroot/indentLine'
Plugin 'rrethy/vim-hexokinase'
Plugin 'franbach/miramare'

call vundle#end()
filetype plugin indent on

let g:clipboard = {
            \   'name': 'xclip',
            \   'copy': {
            \      '+': 'xclip -quiet -i -selection clipboard',
            \      '*': 'xclip -quiet -i -selection primary',
            \    },
            \   'paste': {
            \      '+': 'xclip -o -selection clipboard',
            \      '*': 'xclip -o -selection primary',
            \   },
            \   'cache_enabled': 1,
            \ }
nmap <Leader>y "+y "*y
nmap <Leader>p "+p "*p
nmap <Leader>d "+d "*d
nmap <Leader>Y "+y "*y
nmap <Leader>P "+p "*p
nmap <Leader>D "+D "*D

let g:ycm_use_clangd = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_goto_buffer_command = 'new-buffer'
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_max_num_candidates = 500
let g:ycm_max_num_identifier_candidates = 35
nmap <F2> :YcmCompleter GoToInclude<CR>
nmap <F3> :YcmCompleter GoToDefinition<CR>
nmap <F4> :YcmCompleter GoToDeclaration<CR>
nmap <F5> :YcmCompleter GoToReferences<CR>
nmap <F12> :YcmCompleter GetDoc<CR>

if !(&diff)
    set termguicolors
    colorscheme miramare
else
    set t_Co=256
    colorscheme darkness
endif

syntax on
set wildmenu
set wrap wrapmargin=160 textwidth=160
set linebreak showbreak=~ breakindent breakindentopt=shift:4 
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

nnoremap <S-k> :bnext<CR>
nnoremap <S-j> :bprev<CR>
nnoremap <S-d> :bd<CR>

map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>

set lcs+=space:•
nmap <S-l> :set invlist<CR>

if !(&diff)
    nmap <F5> :TagbarToggle<CR>
    autocmd BufNewFile,BufRead *.[ch]   :TagbarOpen<CR>
    autocmd BufNewFile,BufRead *.[ch]pp :TagbarOpen<CR>
endif

hi DiffText   cterm=none ctermfg=Red ctermbg=Black gui=none guifg=Red guibg=Black
hi DiffChange cterm=none ctermfg=Yellow ctermbg=Black gui=none guifg=Yellow guibg=Black
hi DiffAdd    cterm=none ctermfg=Black ctermbg=Green gui=none guifg=Black guibg=Green
hi DiffDelete cterm=none ctermfg=Grey ctermbg=Green gui=none guifg=Grey guibg=Green

set wildcharm=<C-z>
cnoremap <expr> <up>    wildmenumode() ? "\<left>"      : "\<up>"
cnoremap <expr> <down>  wildmenumode() ? "\<right>"     : "\<down>"
cnoremap <expr> <left>  wildmenumode() ? "\<up>"        : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-z>" : "\<right>"

let g:Hexokinase_highlighters = [
            \   'virtual',
            \   'foreground'
            \ ]

let g:Hexokinase_optInPatterns = [
            \     'full_hex',
            \     'triple_hex',
            \     'rgb',
            \     'rgba',
            \     'hsl',
            \     'hsla'
            \ ]

let g:Hexokinase_ftOptInPatterns = {
            \     'css': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
            \     'html': 'full_hex,rgb,rgba,hsl,hsla,colour_names'
            \ }

let g:miramare_transparent_background = 1
