set splitright
set hidden
set nocompatible
set showmatch
set ignorecase
set hlsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set relativenumber
set wildmode=longest,list
filetype plugin indent on
syntax on
filetype plugin on
set ttyfast

" VIM PLUG Plugins "
call plug#begin("~/.vim/plugged")
" Coding helpers
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'habamax/vim-godot'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Theme stuff
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'


call plug#end()
let g:airline_theme = "owo"
" :autocmd BufWritePre * :Prettier
nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <leader>tff <cmd>Telescope find_files<cr>
nnoremap <leader>tlg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>

" Key Remaps "
imap emm <c-y>,
" Fugitive Maps "
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gb :Git branch -m
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gmm :Git merge remotes/origin/master<cr>
nnoremap <leader>gca :Git commit --amend
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k


" Custom theme "
source ~/.config/nvim/sw-background.vim
