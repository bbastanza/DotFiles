" Plug
call plug#begin('~/.vim/plugged')

" Theme
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'mg979/vim-visual-multi'
Plug 'jiangmiao/auto-pairs'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Syntax
Plug 'yuezk/vim-js'
Plug 'vim-scripts/fountain.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-markdown'
Plug 'tbastos/vim-lua'

" Other
Plug 'liuchengxu/vim-which-key'
Plug 'christoomey/vim-system-copy' 
Plug 'yuttie/comfortable-motion.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/Tabmerge'


call plug#end()
"***************************

