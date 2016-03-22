set nocompatible
filetype off

" security
set modelines=0

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'VundleVim/vundle'
Plugin 'noah/molokai'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'joonty/vdebug'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'svermeulen/vim-easyclip'
Plugin 'ervandew/supertab'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'joonty/vim-phpqa.git'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'

:set nu
let mapleader=" "
:set expandtab ts=2 sw=2 ai
autocmd BufWritePre * :%s/\s\+$//e

" set shiftwidth=2
" set softtabstop=2
" set tabstop=2

" for php files 4 spaces
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
" for xml files 4 spaces
autocmd Filetype xml setlocal ts=4 sw=4 sts=0 expandtab

" for ruby files 2 spaces
autocmd Filetype rb setlocal ts=2 sw=2 sts=0 expandtab

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

" map jj to esc
imap jj <Esc>

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

" Use Arrow Keyz to resize window
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" NerdTree Toggle
nmap <silent> <leader><tab> :NERDTreeToggle<CR>

" highlight current buffer in NERDTREE
map <leader>r :NERDTreeFind<CR>

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


" Easy Motion Config
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s)
" Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

" easyclip config
" let g:EasyClipAutoFormat = 1
set clipboard=unnamedplus
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipShareYanks = 1

let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-f> <plug>EasyClipRotateYanksForward
nmap <c-d> <plug>EasyClipRotateYanksBackward

nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs <plug>XEasyClipPaste

nnoremap gm m

" PDV
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
" nnoremap <buffer> <leader>m :call pdv#DocumentCurrentLine()<CR>
nmap <leader>c :call pdv#DocumentCurrentLine()<CR>
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
\    "path_maps" : {
\     },
\    "watch_window_style" : "compact",
\    "debug_file" : "~/vdebug.log",
\    "debug_file_level" : "2",
\    "timeout" : 300
\}

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

colorscheme gruvbox
set background=dark

" highlight Normal term=none cterm=none ctermfg=White ctermbg=Black gui=none guifg=White guibg=Black
" highlight DiffChange cterm=none ctermfg=black ctermbg=LightGreen gui=none guifg=bg guibg=LightGreen
" highlight DiffText cterm=none ctermfg=black ctermbg=LightRed gui=none guifg=bg guibg=Red

" Autocomplete for php
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

set completeopt=longest,menuone

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Ultisnip Config
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" phpqa
" https://github.com/joonty/vim-phpqa
" <Leader>qa  " Show/hide code sniffer and mess detector violations
" <Leader>qc  " Show/hide code coverage markers
let g:phpqa_codesniffer_args = "--standard=PSR2"
let g:phpqa_messdetector_ruleset = "~/.vim/php/phpmd-ruleset.xml"

" allow per project vimrc
set exrc
set secure

" FZF as CTRL-P Replacement
nmap <C-p> :FZF<CR>

" Goto Defintion switch default; open first match automatically if there is
" only one
" http://stackoverflow.com/questions/7640663/use-tjump-instead-of-tag-vim-on-pressing-ctrl
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" goto definition with leader
nmap <leader>g g<c-]>

" autogenerate tag file
au BufWritePost *.php silent! !ctags -R --fields=+aimS --languages=php --exclude=var --exclude=pub &

" au BufWritePost *.md silent! !rake &
