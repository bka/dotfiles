" ----------------------------------------------------------------------------
" Initial stuff
" ----------------------------------------------------------------------------
set nocompatible
filetype off
set encoding=utf-8

" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
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
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'

call vundle#end()
filetype plugin indent on

Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'

" ----------------------------------------------------------------------------
" Basic stuff
" ----------------------------------------------------------------------------
" security
set modelines=0
" this allows buffers to be hidden if you've modified a buffer.
set hidden
" display line numbers
:set nu
" make them relative
set relativenumber
" allow per project vimrc
set exrc
set secure
" highlight column 80
set colorcolumn=80
set nowrap
" copy indent from previous line
set autoindent
" do smart indenting when starting a new line
set smartindent
au FocusLost * :wa
set undodir=~/tmp/vim/undo//
set backupdir=~/tmp/vim/backup//
set directory=~/tmp/vim/swap//
set backup
set noswapfile

:set expandtab ts=2 sw=2 ai
autocmd BufWritePre * :%s/\s\+$//e

" for php files 4 spaces
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
" for xml files 4 spaces
autocmd Filetype xml setlocal ts=4 sw=4 sts=0 expandtab
" for ruby files 2 spaces
autocmd Filetype rb setlocal ts=2 sw=2 sts=0 expandtab
" autogenerate tag file when saving
au BufWritePost *.php silent! !ctags -R --fields=+aimS --languages=php --exclude=var --exclude=pub &

" styling
colorscheme gruvbox
set background=dark

" ----------------------------------------------------------------------------
" Key Bindings
" ----------------------------------------------------------------------------
" use space as leader key
let mapleader=" "

" map jj to esc
imap jj <Esc>
" map F1 to ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" goto definition with leader; <Space>+g
nmap <leader>g g<c-]>
" Goto Defintion switch default; open first match automatically if there is
" only one
" http://stackoverflow.com/questions/7640663/use-tjump-instead-of-tag-vim-on-pressing-ctrl
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" FZF as CTRL-P replacement: so used to Ctrl+P, so open FZF instead
nmap <C-p> :FZF<CR>

" ----------------------------------------------------------------------------
" Searching
" ----------------------------------------------------------------------------
set hlsearch  "Highlight matches
set incsearch  "Incremental searching
set showmatch
set ignorecase "ignore case when searching
set smartcase  "search with case possible
set gdefault " :%s/foo/bar/g -> :%s/foo/bar/
" leader + space to clear search
nnoremap <leader><space> :noh<cr>

" ----------------------------------------------------------------------------
" Buffer Management
" ----------------------------------------------------------------------------
" open a new empty buffer with Ctrl+t
nmap <C-t> :enew<cr>
" move to the next buffer with Tab
map <C-i> :bnext<CR>
" move to the previous buffer with Shift+Tab
map <S-Tab> :bprevious<CR>
" close current buffer with CTRL+x
nmap <C-x> :bp <BAR> bd #<CR>
" Move to previous edited buffer
map <C-z> :e#<CR>

" ----------------------------------------------------------------------------
" Split Pane Management
" ----------------------------------------------------------------------------
" close current split pane with ALT+q
execute "set <M-q>=\eq"
map <M-q> :q<CR>
" map crtl-movement key for navigation
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Use Arrow Keyz to resize window
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" ----------------------------------------------------------------------------
" Airline Config
" ----------------------------------------------------------------------------
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" ----------------------------------------------------------------------------
" NerdTree Config
" ----------------------------------------------------------------------------
" NerdTree Toggle
nmap <silent> <leader><tab> :NERDTreeToggle<CR>
" highlight current buffer in NERDTREE
map <leader>r :NERDTreeFind<CR>
" trigger save with CTRL+s
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" ----------------------------------------------------------------------------
" SnipMate Config
" ----------------------------------------------------------------------------
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'php'

let g:snips_author='Bernhard Leers'
let g:author='Bernhard Leers'
let g:snips_email='b.leers@neusta.de'
let g:email='b.leers@neusta.de'
let g:snips_github='https://github.com/bka'
let g:github='https://github.com/bka'
" trigger SnipMate, it also gets trigger on <tab> because of supertab
imap <C-k> <esc>a<Plug>snipMateNextOrTrigger
smap <C-k> <Plug>snipMateNextOrTrigger

" ----------------------------------------------------------------------------
" Easy Motion Config
" ----------------------------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s)

" ----------------------------------------------------------------------------
" easyclip config
" ----------------------------------------------------------------------------
set clipboard=unnamedplus
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
" let g:EasyClipShareYanks = 1
let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-f> <plug>EasyClipRotateYanksForward
nmap <c-d> <plug>EasyClipRotateYanksBackward
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs <plug>XEasyClipPaste
nnoremap gm m

" ----------------------------------------------------------------------------
" PDV config
" ----------------------------------------------------------------------------
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
nmap <leader>c :call pdv#DocumentCurrentLine()<CR>

" ----------------------------------------------------------------------------
" vdebug config
" ----------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------
" phpcomplete config
" ----------------------------------------------------------------------------
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" don't auto-insert first item, show menu even with only one entry
set completeopt=longest,menuone

" ----------------------------------------------------------------------------
" SuperTab Config
" ----------------------------------------------------------------------------
" navigate completion menu from top to bottom
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" ----------------------------------------------------------------------------
" Ultisnip Config
" ----------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ----------------------------------------------------------------------------
" phpqa config
" ----------------------------------------------------------------------------
" https://github.com/joonty/vim-phpqa
" <Leader>qa  " Show/hide code sniffer and mess detector violations
" <Leader>qc  " Show/hide code coverage markers
let g:phpqa_codesniffer_args = "--standard=PSR2"
let g:phpqa_messdetector_ruleset = "~/.vim/php/phpmd-ruleset.xml"

" ----------------------------------------------------------------------------
" ack config
" ----------------------------------------------------------------------------
" spawn in background, thanks to vim.dispatch
let g:ack_use_dispatch = 1
" space+f start project search
nmap <leader>f :Ack <space>
