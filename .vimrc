set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'heavenshell/vim-jsdoc'

filetype plugin on

let mapleader=' '

let g:neocomplcache_enable_at_startup=1

let g:airline_theme='understated'
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0

inoremap <expr><C-g>    neocomplcache#undo_completion()
inoremap <expr><C-l>    neocomplcache#complete_common_string()
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"

nmap <silent><leader>gb :.Gblame<cr>
vmap <silent><leader>gb :Gblame<cr>
nmap <silent><leader>gd :Gdiff<cr>
nmap <silent><leader>td :TernDef<cr>
nmap <silent><leader>tr :TernRefs<cr>
nmap <silent><leader>f :NERDTreeFind<cr>
nmap <silent><leader>nt :tabnew<cr>

let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_quit_key='<Esc>'

let g:jsdoc_allow_input_prompt=1

"let javascript_enable_domhtmlcss=1
"let g:javascript_conceal=1
set laststatus=2

syntax enable
set autoread
set ttyfast
set encoding=utf-8
set termencoding=utf-8
set t_Co=256
set tabstop=4
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

let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
