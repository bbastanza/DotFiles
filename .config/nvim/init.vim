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
" Nvim Settings
syntax on
set autochdir
set noerrorbells
set tabstop=4 
set softtabstop=4
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
set laststatus=2
set cmdheight=1
set guifont=Ubuntu\ Mono:h16
"***************************

" Plug
call plug#begin('~/.vim/plugged')

" Theme
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" Nerdtree and Vifm
Plug 'scrooloose/nerdtree'
Plug 'Nopik/vim-nerdtree-direnter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vifm/vifm.vim'
Plug 'ctrlpvim/ctrlp.vim'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-system-copy' 
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'yuezk/vim-js'
Plug 'vim-scripts/fountain.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

call plug#end()
"***************************

" Colors
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#a4fff8", "cterm": "250", "cterm16" : "7" }
    let s:black = { "gui": "#202020", "cterm": "234", "cterm16" : "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white, "bg": s:black }) " `bg` will not be styled since there is no `bg` setting
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
let g:NERDTreeWinSize=30
let NERDTreeMapOpenInTab='<ENTER>'
autocmd BufWinEnter * silent NERDTreeMirror
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
function! NERDTreeTogglePwd()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction
"***************************

" COC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ 'coc-css', 
  \ ]
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:prettier#autoformat = 1
let g:prettier#config#tab_width = 4
let g:coc_snippet_next = '<tab>'
"***************************

" Key Bindings
let mapleader=" "

" Move to window with Space + Vim movement
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

" Remove highlight on enter
nnoremap <silent><CR> :noh<CR><CR>

" capital U for redo
nnoremap U :redo<CR>

" Move mutiple lines with capital KJ
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Whichkey  
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" open nerdtree in pwd
nnoremap <leader>t :call NERDTreeTogglePwd()<cr>

" comments
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" open vifm
nnoremap <leader>v :Vifm<CR>
nnoremap <leader><space> :tabnew<CR>

" control jk for moveing through autocomplete
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : coc#refresh()

" normal ass shit
nnoremap <leader>. :vsplit<CR>
nnoremap <leader>x :x<CR> " write quit
nnoremap <leader>w :write<CR> " write
nnoremap <leader>q :q!<CR> " quit
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
"***************************
"
" start Vifm on startup 
autocmd VimEnter * NERDTree | wincmd p

" coc prettier
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)
