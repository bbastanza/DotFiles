
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
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/fountain.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Git Gutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

" Colors
colorscheme onedark

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
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
