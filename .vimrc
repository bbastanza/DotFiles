syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set mouse=a		
set ignorecase		
set colorcolumn=80
set showcmd		
set showmatch		

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'skammer/vim-css-color'
Plug 'christoomey/vim-system-copy'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'vifm/vifm.vim'


call plug#end()

colorscheme onedark
set background=dark
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
