" Plugins

call plug#begin()

"Go development
" Plug 'fatih/vim-go'

"Ayu color theme
" Plug 'ayu-theme/ayu-vim'

"Dracula color theme
" Plug 'dracula/vim', {'as': 'dracula'}
" Seoul256 color theme
Plug 'junegunn/seoul256.vim'
"Comments & surround
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'


"" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
"" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
"" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'
" Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"" Linters
Plug 'neomake/neomake'

" Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"relative numbers
Plug 'myusuf3/numbers.vim'

"" Closing parenthesis
Plug 'Townk/vim-autoclose'

""Emmet
Plug 'mattn/emmet-vim'

""Git
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" Just clojure things
" Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'clojure-vim/async-clj-omni'
" Settings

call plug#end()
syntax on
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show line numbers
set nu

" remove ugly vertical lines on window division
set fillchars+=vert:\ 

" use 256 colors when possible
" if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
"         let &t_Co = 256
set termguicolors
set linespace=3
set guifont=Fira\ Code:h12
" let ayucolor="mirage"
" colorscheme ayu
let g:seoul256_background = 236
let g:seoul256_srgb = 1
color seoul256

" deoplete can autoselect first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" set completeopt-=preview
set wildmode=list:longest

" save as sudo
ca w!! w !sudo tee "%"

" during scrollling -cursor 3 lines away from screen border

" clear search result 
nnoremap <silent> // :noh<CR>

"clear empty spaces at the end of the lines on save .py
autocmd BufWritePre *.py :%s/\s\+$//e

set shell=/bin/bash

autocmd! BufWritePost * Neomake

" Check code a python3 by default (neomake)
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'
  
" Deoplete
filetype on
filetype plugin indent on 
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_ignore_case=1
let g:deoplete#enable_smart_case=1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

inoremap <expr><tab> pumvisible() ? "\<c-N>" : "\<tab>"
" complete with words from any opened file 

let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" Jedi
let g:jedi#completions_enabled=0
let g:jedi#goto_command = ',d'
let g:jedi#usages_command = ',o'
let g:jedi#goto_assignments_commmand = ',a'

nmap ,D :tab split<CR>:call jedi#goto()<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-n> :NERDTreeToggle<CR>
" open nerdtree with current file selected
nmap ,t :NERDTreeFind<CR>
"dont show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

nmap ,e :Files<CR>
" tags (symbols) in current file finder mappings
nmap ,g :BTag<CR>
" tags (symbols) in all files finder mappings
nmap ,G :Tag<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" commands finder mapping
nmap ,c :Commands<CR>

let g:airline_theme="lucius"
