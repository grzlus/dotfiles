set ruler
set ts=2 sts=2 sw=2
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
set nohlsearch
set relativenumber
set so=999
let mapleader = ','

map H :tabp<CR>
map L :tabn<CR>
"map <Leader>q :tabo|%bd|e#<CR>

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
map <Leader>s :exec 'Ag' expand('<cword>')<CR>

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'dln/avro-vim'
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl

" Completion
"Plug 'roxma/nvim-completion-manager'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" pip3 install --user neovim jedi mistune psutil setproctitle
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/neco-syntax'

Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 0

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-l>"

Plug 'itchyny/lightline.vim'
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }  
      \ }

Plug 'Shougo/context_filetype.vim'
Plug 'joker1007/vim-ruby-heredoc-syntax'

Plug 'w0rp/ale'
let b:ale_ruby_rubocop_executable='docker-compose run --rm rubocop rubocop'
"Plug 'neomake/neomake'
"autocmd! BufWritePost * Neomake

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

Plug 'vimlab/split-term.vim'
set splitbelow

call plug#end()

set background=dark
colorscheme railscasts

command! -bang -nargs=* Tmux
  \ call fzf#complete(
  \   { 'source': 'tmuxinator list'})
