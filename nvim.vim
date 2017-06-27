" config

" syntax on
set ruler
set ts=2 sts=2 sw=2
" set nocompatible
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

let &colorcolumn="80,120"

" config end

let mapleader = ','

map H :tabp<CR>
map L :tabn<CR>

map <Leader>S :exec 'Ag' expand('<cword>')<CR>

call plug#begin('~/.nvim/plugged')

Plug 'wikitopian/hardmode'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

Plug 'jpo/vim-railscasts-theme'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

map <C-p> :FZF<CR>
map <Leader>g :GFiles?<CR>
map <Leader>c :BCommits<CR>
map <Leader>/ :exec 'BLines' expand('<cword>')<CR>
map <Leader>? :exec 'Lines' expand('<cword>')<CR>

Plug 'tpope/vim-fugitive'

Plug 'sheerun/vim-polyglot'

" Completion
Plug 'roxma/nvim-completion-manager'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" pip3 install --user neovim jedi mistune psutil setproctitle

Plug 'Shougo/neco-syntax'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-l>"


Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

Plug 'Shougo/context_filetype.vim'
Plug 'joker1007/vim-ruby-heredoc-syntax'

Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

call plug#end()

set background=dark
colorscheme railscasts
