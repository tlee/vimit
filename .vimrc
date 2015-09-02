
" Disable vi compatibility
set nocompatible

" Use Pathogen to load bundles
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

source /Library/Python/2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

filetype on
filetype plugin indent on

" Preferences
" -----------------------------------------------------------------------------
set colorcolumn=120
set modelines=0
set encoding=utf-8
set scrolloff=3
set sidescrolloff=3
set autoindent
set cursorline
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set vb t_vb=
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set title
set laststatus=2
set splitbelow splitright
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set nowrap
set list
set listchars=tab:▸\ ,eol:¬,trail:·
nnoremap <Space> za
set foldmethod=syntax
set foldlevelstart=99
let javaScript_fold=1
set formatoptions=tcq
set autowrite

if has("mouse")
 set mouse=a
endif

" Backups
set history=1000
set undolevels=1000
set nobackup
set directory=~/.vim/tmp/swap/

" Searching
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
set grepprg=ack

let mapleader = ','

command! -nargs=* Wrap set wrap linebreak nolist

" Plugin configurations
" -----------------------------------------------------------------------------
let NERDSpaceDelims=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes = ['scss']
let g:syntastic_javascript_checkers = ['jshint']
let g:miniBufExplBRSplit = 0   " Put new window above
let g:gundo_playback_delay = 1000

" Popup menu behavior
set completeopt=longest,menu
set pumheight=20

" Setup supertab to be a bit smarter about it's usage
" let g:SuperTabDefaultCompletionType = 'context'
" let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 0 " prevent remap from breaking supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
set wildmode=list:longest,full
let g:SuperTabClosePreviewOnPopupClose = 1 " close scratch window on autocompletion"

" Tell snipmate to pull it's snippets from a custom directory
let g:snippets_dir = $HOME.'/.vim/snippets/'

let g:tlist_javascript_settings = 'javascript;r:var;s:string;a:array;o:object;u:function'
let g:yankring_history_dir=$HOME.'/.vim/tmp/yankring/'
let g:RefreshRunningBrowserDefault = 'chrome'

" CtrlP Custom Ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/](\.(git|svn|))|(node_modules|CVS)$'

" Commands and helper functions
" -----------------------------------------------------------------------------

" Sort CSS properties between the braces alphabetically
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort | :noh

" -----------------------------------------------------------------------------
" Better placement
inoremap jj <ESC> l

" Move between splits

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Block movement
nmap <tab> %
vmap <tab> %

" Insert/append a single character
nmap ,, i_<esc>r

" Clear the search highlight
map <silent> \ :silent nohlsearch<cr>

nnoremap <F2> :GundoToggle<cr>
nnoremap <silent> <F3> :TlistToggle<cr>
nnoremap <silent> <F4> :YRShow<cr>
ino <silent> <F5> <c-r>=ShowAvailableSnips()<cr>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Bubble single lines (requires unimpaired.vim)
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines (requires unimpaired.vim)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" copy paste
vmap <leader>1 :!pbcopy<CR>
vmap <leader>2 :!pbcopy<BAR>pbpaste<CR>
vmap <leader>3 :r !pbpaste<CR>


" Leader mapping
" -----------------------------------------------------------------------------
map <leader>a :Ack

" Toggle wrapping in the current buffer
nmap <silent> <leader>wt :set wrap!<cr>

" Collapse all multi-line occurrences of whitespace into one line
map <leader>CN :%s/^\n\+/\r//<cr>:let @/=''<cr>

" Clean whitespace
map <leader>CW :%s/\s\+$//<cr>:let @/=''<cr>

" Open current buffer in a new split
map <leader>v <C-w>v<C-w>l
map <leader>s <C-w>s<C-w>l

" Toggle spelling hints
nmap <silent> <leader>ts :set spell!<cr>

" Opens an edit command with the path of the currently edited file filled in
map <leader>e :e <C-R>=expand("%:p:h") . "/" <cr>

" Inserts the path of the currently edited file into a command - Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Closes the window showing the location list from sytastic errors
map <silent><leader>lc :lcl<cr>

" Window movement
map <leader>wk <C-w>K
map <leader>wj <C-w>J
map <leader>wl <C-w>L
map <leader>wh <C-w>H
map <leader>wr <C-w>r
map <leader>wR <C-w>R
map <leader>wx <C-w>x

"Resizing
map <leader>> <C-w>>10
map <leader>< <C-w><10
map <leader>+ <C-w>+10
map <leader>- <C-w>-10
map <leader>= <C-w>=

"Mini Buffer
map <silent> <leader>mbe :MBEToggle<cr>
map <silent> <leader>mbn :MBEbn<cr>
map <silent> <leader>mbp :MBEbp<cr>
map <silent> <leader>mbu :MBEbun<cr>

"CtrlP
map <silent> <leader>cpc :CtrlPCurWD<cr>
map <silent> <leader>cpb :CtrlPBuffer<cr>
map <silent><leader>r :RRB<cr>

nnoremap th  :tabfirst<CR>
nnoremap tn  :tabnext<CR>
nnoremap tp  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" File handling and settings
" -----------------------------------------------------------------------------

if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  " Reload .vimrc after it or vimrc.local been saved
  au! BufWritePost .vimrc source %
  au! BufWritePost .vimrc.local source ~/.vimrc

  " File type settings on load
  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.m*down set filetype=markdown
  au BufRead,BufNewFile *.json set filetype=json
  au BufRead,BufNewFile *.slim set filetype=slim
  " Refresh on save

  " Reload all snippets when creating new ones.
  au! BufWritePost *.snippets call ReloadAllSnippets()

  " Enable omnicomplete for supported filetypes
  autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
  autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif

  " Remove auto commenting - annoying
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

endif


" Themes and GUI settings
" -----------------------------------------------------------------------------
set term=xterm-256color
syntax on
colorscheme hemisu
set background=light
