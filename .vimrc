" Use Pathogen to load bundles
call pathogen#infect()
call pathogen#helptags()

" Baseline, cause TPope says so.
runtime! plugin/sensible.vim

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

set colorcolumn=120
set cursorline

set nu
set nowrap
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set showmode
set hidden
set wildmode=list:longest
set vb t_vb=
set ttyfast
set autowrite

set ignorecase
set smartcase
set hlsearch
set showmatch

set history=1000
set undolevels=1000
set nobackup
set directory=~/.vim/tmp/swap/

" Misc
" -----------------------------------------------------------------------------

" Block movement
nmap <tab> %
vmap <tab> %

" Better placement
inoremap jj <ESC> l

" Insert/append a single character
nmap ,, i_<esc>r

" Leader
let mapleader = ','

" Clear the search highlight
map <silent> \ :silent nohlsearch<cr>

" Split movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Resizing
map <leader>> <C-w>>10
map <leader>< <C-w><10
map <leader>+ <C-w>+10
map <leader>- <C-w>-10
map <leader>= <C-w>=

" Window movement
map <leader>wk <C-w>K
map <leader>wj <C-w>J
map <leader>wl <C-w>L
map <leader>wh <C-w>H
map <leader>wr <C-w>r
map <leader>wR <C-w>R
map <leader>wx <C-w>x

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Bubble single lines (requires unimpaired.vim)
nmap <C-Up> [e
nmap <C-Down> ]e

" Plugin configuration
" -----------------------------------------------------------------------------
"
" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" IndentLine
let g:indentLine_char = '┊'

" Yankring
let g:yankring_history_dir='~/.vim/tmp/yankring/'

" JSHint
let jshint2_save = 1

" Leader mapping
" -----------------------------------------------------------------------------

" Toggle wrapping in the current buffer
nmap <silent> <leader>wt :set wrap!<cr>

" Collapse all multi-line occurrences of whitespace into one line
map <leader>CN :%s/^\n\+/\r//<cr>:let @/=''<cr>

" Clean whitespace
map <leader>CW :%s/\s\+$//<cr>:let @/=''<cr>

" Open current buffer in a new split
map <leader>v <C-w>v<C-w>l
map <leader>s <C-w>s<C-w>l


"Some autocommands
" -----------------------------------------------------------------------------

if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  " Reload .vimrc after it or vimrc.local been saved
  au! BufWritePost .vimrc source %
  au! BufWritePost .vimrc.local source ~/.vimrc
endif

" Themes and GUI settings
" -----------------------------------------------------------------------------
set term=xterm-256color
syntax on
colorscheme hemisu
set background=light
