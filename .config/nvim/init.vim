set splitright
set hidden
set nocompatible
set showmatch
set ignorecase
set hlsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set relativenumber
set wildmode=longest,list
set hid
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
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Theme stuff
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'


call plug#end()
let g:airline_theme = "minimalist"
colorscheme tokyonight-night
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
nnoremap <leader>gp :Git push -u origin HEAD<cr>

" Buffer Maps "
nmap <leader>h <c-w>h
nmap <leader>l <c-w>l
nmap <leader>j <c-w>j
nmap <leader>k <c-w>k
nmap <leader>vs :vsp<cr>
nmap <leader>hs :split<cr>
nmap <leader>bo <c-w>_ <c-w><bar>
nmap <leader>be <c-w>=

" Custom theme "
" source ~/.config/nvim/sw-background.vim

" Markdown Preview Settings "
let g:mkdp_browser = '/bin/true'
let g:mkdp_port = '3001'

" Terminal Mode Maps "
nmap <leader>vt :vsp<cr>:term<cr>
nmap <leader>ht :split<cr>:term<cr>
tnoremap <Esc> <C-\><C-n>

" Terminal Mode Commands "
autocmd TermOpen * setlocal nonumber norelativenumber
autocmd TermOpen * startinsert

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
