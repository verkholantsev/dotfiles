set nocompatible
filetype off

call plug#begin()
" Plug 'Valloric/YouCompleteMe'
Plug 'kern/vim-es7'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'flowtype/vim-flow'
Plug 'heavenshell/vim-jsdoc'
Plug 'jreybert/vimagit'
Plug 'kien/ctrlp.vim'
Plug 'ternjs/tern'
Plug 'moll/vim-node'
Plug 'neomake/neomake'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/tComment'
Plug 'vim-scripts/vim-bemhtml'
call plug#end()

filetype plugin on

autocmd BufNewFile,BufReadPost *.bem.tt2 set ft=bemhtml
autocmd BufNewFile,BufReadPost *.flow set ft=javascript

let mapleader=' '

let g:acp_enableAtStartup=0
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_disable_auto_complete=1

let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

let g:neomake_javascript_eslint_maker = {
    \ 'args': ['--no-color', '--format'],
    \ 'errorformat': '%f: line %l\, col %c\, %m'
    \ }

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc='flowcomplete#Complete'

set omnifunc='flowcomplete#Complete'

let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'

set completeopt-=preview

if exists('$TMUX')
    if !has('nvim')
        set term=screen-256color
    endif
endif
let &t_Co=256

set background=light
colorscheme solarized

nmap <silent><leader>gb :.Gblame<cr>
vmap <silent><leader>gb :Gblame<cr>
nmap <silent><leader>gd :Gdiff<cr>
nmap <silent><leader>td :TernDef<cr>
nmap <silent><leader>tr :TernRefs<cr>
nmap <silent><leader>f :NERDTreeFind<cr>
nmap <silent><leader>nt :tabnew<cr>

nmap <silent><leader>h :Dash<cr>

let g:jsdoc_allow_input_prompt=1

let g:flow#autoclose = 1

autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

let g:ctrlp_custom_ignore = {
  \  'dir': 'node_modules',
  \ }

set laststatus=2

syntax enable
set synmaxcol=256
set autoread
set ttyfast
set encoding=utf-8
set termencoding=utf-8

set foldmethod=manual
set colorcolumn=119

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

set incsearch
set hlsearch
nnoremap <silent><cr> :nohlsearch<cr><cr>
set noshowmode
set title
set list
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~
set showmatch
set number
set cursorline

set backspace=indent,eol,start

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
