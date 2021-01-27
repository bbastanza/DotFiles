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
set number relativenumber
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
Plug 'sheerun/vim-polyglot'
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
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-commentary'

call plug#end()
"***************************

" Colors
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"***************************

" Key Bindings
let mapleader=" "
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
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
nnoremap <leader>v :Vifm<CR>
nnoremap <leader>. :vsplit ../<CR>
nnoremap <leader>wq :x<CR> " write quit
nnoremap <leader>w :write<CR> " write
nnoremap <leader>qq :q<CR> " quit
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : coc#refresh()
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
"***************************

