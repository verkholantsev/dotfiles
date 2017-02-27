set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'neomake/neomake'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jreybert/vimagit'
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/tComment'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/vim-bemhtml'
Plugin 'moll/vim-node'
Plugin 'flowtype/vim-flow'
Plugin 'othree/yajs.vim'
Plugin 'metakirby5/codi.vim'
Plugin 'rizzatti/dash.vim'
" Plugin 'Valloric/YouCompleteMe'

Plugin 'mileszs/ack.vim'

Plugin 'airblade/vim-gitgutter'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'christoomey/vim-tmux-navigator'

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
" let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

" let g:neomake_javascript_eslint_maker = {
"     \ 'args': ['--no-color', '--format'],
"     \ 'errorformat': '%f: line %l\, col %c\, %m'
"     \ }

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'

set completeopt-=preview

if exists('$TMUX')
    set term=screen-256color
endif
let &t_Co=256

set background=light
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
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

let javascript_enable_domhtmlcss=1
let g:javascript_conceal=1
let b:javascript_fold=1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

let g:flow#autoclose = 1

autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

let g:ctrlp_custom_ignore = {
  \  'dir': 'node_modules',
  \ }

set foldmethod=syntax
set foldlevelstart=99
let javaScript_fold=1

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

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Cyrillic symbols binding
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
