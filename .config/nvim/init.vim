"      _                        _  ___  
"  ___| |_ __ _ _ __  _____   _/ |/ _ \ 
" / __| __/ _` | '_ \|_  / | | | | | | |
" \__ \ || (_| | | | |/ /| |_| | | |_| |
" |___/\__\__,_|_| |_/___|\__,_|_|\___/ 
"                                      
" full stack web developer
" www.brianbastanza.me
" https://github.com/bbastanza 
"
" Vim Settings
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set smartindent
set colorcolumn=81
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ic
set mouse=a		
set ignorecase		
set showcmd		
set showmatch		
set background=dark
set cursorline
set laststatus=2
set cmdheight=1

" Plug
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'skammer/vim-css-color'
Plug 'christoomey/vim-system-copy'
Plug 'ap/vim-css-color'
Plug 'vifm/vifm.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/fountain.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Colors
colorscheme onedark

" Lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" Key Bindings
let mapleader=" "
nnoremap <leader>. :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
map <C-n> :source ~/.config/nvim/init.vim<CR>
map <C-v> :Vifm<CR>
map <C-s> :write<CR>

