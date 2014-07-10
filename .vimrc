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
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/tComment'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'michalliu/jsruntime.vim'
" Plugin 'michalliu/jsoncodecs.vim'
" Plugin 'michalliu/sourcebeautify.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/vim-bemhtml'
Plugin 'moll/vim-node'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'

filetype plugin on

autocmd BufNewFile,BufReadPost *.bem.tt2 set ft=bemhtml

let mapleader=' '

let g:acp_enableAtStartup=0
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_disable_auto_complete=1

let g:syntastic_javascript_checkers = ['jshint']

" Smart tab Behavior
function! CleverTab()
    " If autocomplete window visible then select next item in there
    if pumvisible()
        return "\<C-n>"
    endif
    " If it's begining of the string then return just tab pressed
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        " If not begining of the string, and autocomplete popup is not visible
        " Open this popup
        return "\<C-x>\<C-u>"
    endif
endfunction
inoremap <expr><TAB> CleverTab()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

let g:airline_theme='understated'
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0

set completeopt-=preview

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
set t_Co=256

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

let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
