" Plug
call plug#begin('~/.vim/plugged')

" Themes
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'mg979/vim-visual-multi'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lvht/fzf-mru'
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
Plug 'OrangeT/vim-csharp'

" Other
Plug 'liuchengxu/vim-which-key'
Plug 'christoomey/vim-system-copy' 
Plug 'yuttie/comfortable-motion.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/Tabmerge'
Plug 'vimwiki/vimwiki'

call plug#end()
"***************************

