filetype off

syntax on
" Default config {{{
set t_Co=256
set ruler
set ts=2 sts=2 sw=2
set nocompatible
set autoindent
set number
set backspace=2
set ignorecase
set incsearch
set cursorline
set expandtab
set wildmenu
set hid
set lazyredraw
set autoread
set history=700
"set relativenumber

set encoding=utf8
set fileencoding=utf8

set backupdir=~/.vim/swp
set directory=~/.vim/swp

set shell=/bin/bash

set hidden

map ; :

set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set undofile

let &colorcolumn="80,".join(range(120,999),",")
" }}}

" Shortcuts {{{

let mapleader = ','

map <F12> :buffers<CR>
map H :tabp<CR>
map L :tabn<CR>

map <Leader>S :Ag! <cword><CR>

set pastetoggle=<F3>

map <C-E> :VimFilerExplorer<CR>

map <Leader>g :Gstatus<CR>
map <Leader>c :Gcommit<CR>

map <Leader>ig :IndentGuidesToggle<CR>
map <C-p> :CtrlP<CR>
map <Leader>p :CtrlP .<CR>

map <Leader>/ <Plug>(easymotion-sn)

map <Leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>
map <Leader>H :s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" }}}

call plug#begin('~/.vim/plugged')

" Autocomplete {{{
Plug 'Valloric/YouCompleteMe'
"
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" }}}

Plug 'jpo/vim-railscasts-theme'

Plug 'dkprice/vim-easygrep'

Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }

Plug 'exu/pgsql.vim', { 'for': 'sql' }

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'duggiefresh/vim-easydir'

Plug 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'Lokaltog/vim-easymotion'

Plug 'tpope/vim-surround'

Plug 'edkolev/tmuxline.vim'

Plug 'ntpeters/vim-better-whitespace'

Plug 'terryma/vim-multiple-cursors'

" Nerd {{{
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFilerExplorer' }

Plug 'scrooloose/nerdcommenter'
" }}}
"
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
set wildignore+=*/.gem/*,*/vendor/Plug/*,*/tmp/*,log/*,*/tmp/*,*/public/system*,*.orig,*.o,*/public/assets*

Plug 'wikitopian/hardmode'

" RAILS {{{
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-rails'
Plug 'grzlus/sass.snippet', { 'for': 'sass' }
Plug 'tpope/vim-cucumber'

Plug 'thoughtbot/vim-rspec'
Plug 'benmills/vimux'

let g:rspec_command = 'call VimuxRunCommand("bundle exec spring rspec {spec}")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>t :call RunAllSpecs()<CR>

" }}}

Plug 'heartsentwined/vim-emblem', { 'for': 'emblem' }

" GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'mattn/webapi-vim', { 'on': 'Gist' }

call plug#end()
filetype plugin indent on

let g:solarized_termcolors=256
colorscheme railscasts
set background=dark

" VIM Flod {{{
augroup vimrc
  au BufReadPre * setlocal foldmethod=marker
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" }}}

" Remember line {{{
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%
" }}}

autocmd VimEnter,BufNewFile,BufReadPost * if !strlen(&buftype) | silent! call HardMode() | endif
autocmd FileType css,scss,sass setlocal iskeyword+=-
autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,coffee setlocal omnifunc=javascriptcomplete#CompleteJS

autocmd BufWritePre * StripWhitespace
