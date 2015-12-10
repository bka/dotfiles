set nocompatible
filetype off

" security
set modelines=0

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'VundleVim/vundle'
Plugin 'noah/molokai'
Plugin 'kien/ctrlp'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'joonty/vdebug'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

call vundle#end()
filetype plugin indent on

:set nu
let mapleader=","
:set expandtab ts=2 sw=2 ai
autocmd BufWritePre * :%s/\s\+$//e

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set colorcolumn=80  "Highlight column 80
set nowrap " Do wrap
set autoindent  "Copy indent from previous line
set smartindent "Do smart indenting when starting a new line

" searching
set hlsearch  "Highlight matches
set incsearch  "Incremental searching
set showmatch
set ignorecase "ignore case when searching
set smartcase  "search with case possible
set gdefault " :%s/foo/bar/g -> :%s/foo/bar/

"leader + space to clear search
nnoremap <leader><space> :noh<cr>

" This allows buffers to be hidden if you've modified a buffer.
" " This is almost a must if you wish to use buffers in this way.
set hidden

set encoding=utf-8

set relativenumber

au FocusLost * :wa
set undodir=~/tmp/vim/undo//
set backupdir=~/tmp/vim/backup//
set directory=~/tmp/vim/swap//
set backup
set noswapfile

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <C-t> :enew<cr>

" Move to the next buffer
map <C-i> :bnext<CR>

" Move to the previous buffer
" exe 'set t_kB=' . nr2char(27) . '[Z'
map <S-Tab> :bprevious<CR>

" close current buffer CTRL+x
nmap <C-x> :bp <BAR> bd #<CR>

" close current split pane with ALT+q
execute "set <M-q>=\eq"
map <M-q> :q<CR>

" Move to previous edited buffer
map <C-z> :e#<CR>

" map crtl-movement key
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" trigger SnipMate
imap <C-k> <esc>a<Plug>snipMateNextOrTrigger
smap <C-k> <Plug>snipMateNextOrTrigger

" trigger save with CTRL+s
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" enable pasting - omg this breaks all mappings ;(
" set paste
" set pastetoggle=<F10>

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'php'

let g:snips_author='Bernhard Katzmarski'
let g:author='Bernhard Katzmarski'
let g:snips_email='bkatzmarski@neusta.de'
let g:email='bkatzmarski@neusta.de'
let g:snips_github='https://github.com/bka'
let g:github='https://github.com/bka'

" vdebug config

let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<F9>",
\    "step_over" : "<F2>",
\    "step_into" : "<F3>",
\    "step_out" : "<F4>",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F8>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e"
\}

let g:vdebug_options = {
\    "break_on_open" : 0,
\    "path_maps" : {"/vagrant/src/magento2": "/home/bernd/work/vagrant-lamp/src/magento2"},
\    "watch_window_style" : "compact",
\    "debug_file" : "~/vdebug.log",
\    "debug_file_level" : "2",
\    "timeout" : 300
\}

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

colorscheme molokai
