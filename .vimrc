set nocompatible
filetype off

" List of plugins --- {{{
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'flowtype/vim-flow'
Plug 'heavenshell/vim-jsdoc'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ternjs/tern'
Plug 'moll/vim-node'
Plug 'w0rp/ale'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/tComment'
Plug 'jremmen/vim-ripgrep'
Plug 'duganchen/vim-soy'
Plug 'mattn/emmet-vim'
Plug 'galooshi/vim-import-js'
call plug#end()
" }}}

filetype plugin on

" pangloss/vim-javascript --- {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
" }}}

" nathanaelkane/vim-indent-guides --- {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
"
" see
" 1. https://github.com/dracula/vim/blob/master/colors/dracula.vim
" 2. https://commons.wikimedia.org/wiki/File:Xterm_256color_chart.svg
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237
" }}}

" flowtype/vim-flow --- {{{
let g:flow#enable = 1
let g:flow#autoclose = 1
" }}}

" junegunn/fzf.vimw --- {{{
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
" }}}

" moll/vim-node --- {{{
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif
" }}}

" w0rp/ale --- {{{
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_javascript_prettier_use_local_config = 1
nmap <silent>]e :ALENext<cr>
nmap <silent>[e :ALEPrevious<cr>
nmap <silent>ff :ALEFix<cr>
nmap <silent>ar :ALEDisable<cr>:ALEEnable<cr>
let g:ale_fixers = {
\   'javascript': [
\       'prettier',
\       'eslint',
\       'importjs',
\   ],
\   'css': [
\       'prettier',
\   ],
\   'less': [
\       'prettier',
\   ]
\}
" }}}

" itchyny/lightline.vim --- {{{
let g:lightline = {
\ 'colorscheme': 'Dracula',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'gitbranch', 'filetype', 'modified']],
\   'right': [['fileformat', 'fileencoding'], ['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
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
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
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
" }}}

" mattn/emmet-vim --- {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}}

" Settings --- {{{
syntax enable
set showtabline=0
set synmaxcol=256
set ttyfast
set termencoding=utf-8

set colorcolumn=119

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set hlsearch
set noshowmode
set title
set list
set showmatch
set number
set cursorline
set linebreak

set foldlevelstart=99
set foldmethod=manual

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
let &t_Co=256
set termguicolors
set background=dark
colorscheme dracula
" }}}

" Mappings --- {{{
let mapleader=' '

nmap <silent><leader>gb :.Gblame<cr>
vmap <silent><leader>gb :Gblame<cr>
nmap <silent><leader>gd :Gdiff<cr>
nmap <silent><leader>gst :Gstatus<cr>
nmap <silent><leader>gc :Gcommit<cr>
nmap <silent><leader>td :TernDef<cr>
nmap <silent><leader>tr :TernRefs<cr>
" nmap <silent><leader>nt :tabnew<cr>
nmap <silent><leader>q :bd<cr>
nmap <silent>]b :bnext<cr>
nmap <silent>[b :bprev<cr>
nmap <silent>' :!jest %<cr>

nmap <silent><leader>f :NERDTreeFind<cr>
" let g:NERDTreeWinSize=50

nmap <silent><leader>h :Dash<cr>

nmap <silent>q :cclose<cr>
nmap <silent>]q :cnext<cr>
nmap <silent>[q :cprev<cr>
nnoremap <silent><cr> :nohlsearch<cr><cr>

nmap <silent><C-p> :Files<cr>
nmap ; :Buffers<CR>
" }}}

" Autocommands for filetypes --- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim execute "normal zM"
augroup END

augroup filetype_javascript
    autocmd!
    autocmd BufNewFile,BufReadPost *.flow set ft=javascript
    autocmd FileType javascript setlocal foldmethod=syntax
augroup END
" }}}

" Cursor in tmux --- {{{
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

nmap \r :!tmux send-keys -t 0 C-p C-j <CR><CR>
