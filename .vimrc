set nocompatible
filetype off

call plug#begin()
Plug 'kern/vim-es7'

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

Plug 'airblade/vim-gitgutter'

Plug 'altercation/vim-colors-solarized'

Plug 'editorconfig/editorconfig-vim'

Plug 'flowtype/vim-flow'

Plug 'heavenshell/vim-jsdoc'

Plug 'jreybert/vimagit'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'ternjs/tern'

Plug 'moll/vim-node'

Plug 'sheerun/vim-polyglot'

Plug 'w0rp/ale'
let g:ale_fix_on_save = 0
nmap <silent>]e :ALENext<cr>
nmap <silent>[e :ALEPrevious<cr>
nmap <silent>ff :ALEFix<cr>
let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\   ],
\}

Plug 'rizzatti/dash.vim'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'

Plug 'itchyny/lightline.vim'
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'fileformat', 'fileencoding', 'charvaluehex', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

Plug 'vim-scripts/tComment'

Plug 'vim-scripts/vim-bemhtml'

Plug 'jremmen/vim-ripgrep'

Plug 'artur-shaik/vim-javacomplete2'

Plug 'duganchen/vim-soy'

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

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc='flowcomplete#Complete'

autocmd FileType java setlocal omnifunc=javacomplete#Complete

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
" nmap <silent><leader>nt :tabnew<cr>
nmap <silent><leader>q :bd<cr>
nmap <silent>]b :bnext<cr>
nmap <silent>[b :bprev<cr>

nmap <silent><leader>f :NERDTreeFind<cr>
let g:NERDTreeWinSize=50

nmap <silent><leader>h :Dash<cr>

nmap <silent>q :cclose<cr>
nmap <silent>]q :cnext<cr>
nmap <silent>[q :cprev<cr>

let g:jsdoc_allow_input_prompt=1

let g:flow#autoclose = 1

autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

nmap <silent><C-p> :GFiles<cr>
nmap ; :Buffers<CR>

set laststatus=2

syntax enable
set showtabline=0
set synmaxcol=256
set autoread
set ttyfast
set encoding=utf-8
set termencoding=utf-8

set foldlevelstart=99
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

let g:python_host_prog = "/Users/averkholantcev/.pyenv/versions/2.7.13/bin/python"
let g:python3_host_prog = "/Users/averkholantcev/.pyenv/versions/3.5.3/bin/python"

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
