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
"***************************

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
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()
"***************************

" Colors
colorscheme onedark
"***************************

" Lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }
"***************************

" NerdTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"***************************

" COC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-css', 
  \ ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"***************************

" Key Bindings
let mapleader=" "
nnoremap <leader>. :vsplit ~/.config/nvim/init.vim<CR>
nmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)
" Remove highlight on enter
nnoremap <silent><CR> :noh<CR><CR>
" Move to window with Ctrl + Vim movement
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap U :redo<CR>
" Move mutiple lines with capital KJ
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
" More
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>v :Vifm<CR>
map <C-s> :write<CR>
"***************************

