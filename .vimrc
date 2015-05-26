set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'tpope/vim-fugitive'
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

Plugin 'Shougo/neosnippet'
Plugin 'honza/vim-snippets'

Plugin 'mileszs/ack.vim'

Plugin 'airblade/vim-gitgutter'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'christoomey/vim-tmux-navigator'

filetype plugin on

autocmd BufNewFile,BufReadPost *.bem.tt2 set ft=bemhtml

let mapleader=' '

let g:acp_enableAtStartup=0
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_disable_auto_complete=1

let g:syntastic_javascript_checkers = ['jsxhint', 'jscs']
let g:syntastic_aggregate_errors = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

let g:airline_theme='understated'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0

set completeopt-=preview

if exists('$TMUX')
    set term=screen-256color
endif
let &t_Co=256

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

nmap <silent><leader>gb :.Gblame<cr>
vmap <silent><leader>gb :Gblame<cr>
nmap <silent><leader>gd :Gdiff<cr>
nmap <silent><leader>td :TernDef<cr>
nmap <silent><leader>tr :TernRefs<cr>
nmap <silent><leader>f :NERDTreeFind<cr>
nmap <silent><leader>nt :tabnew<cr>

let g:jsdoc_allow_input_prompt=1

let javascript_enable_domhtmlcss=1
let g:javascript_conceal=1
let b:javascript_fold=1

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
set autoread
set ttyfast
set encoding=utf-8
set termencoding=utf-8

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

"-------------------------
"" neosnippets
"
"
" Enable snipMate compatibility
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"
" Disables standart snippets. We use vim-snippets bundle instead
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
"
"  Expand snippet and jimp to next snippet field on Enter key.
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"

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
