" Key Bindings
let mapleader=" "

" Basic Commands
nnoremap <leader>. :vsplit<CR>
nnoremap <leader>, :split<CR>
nnoremap <leader>x :x<CR> 
nnoremap <leader>w :write<CR> 
nnoremap <C-s> :wa<CR> 
nnoremap <leader>q :q!<CR> 
nnoremap <leader><space> :tabnew<CR>
nnoremap <leader><BS> :tabclose<CR>
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>

" Move to window with Space + Vim movement
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

" Remove highlight on enter
nnoremap <silent><CR> :noh<CR><CR>

" capital U for redo
nnoremap <C-s> :wa<CR> 
nnoremap U :redo<CR>

" Move mutiple lines with capital KJ
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" open nerdtree in pwd
nnoremap <leader>t :call NERDTreeTogglePwdAndRefresh()<cr>

" comments
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" control jk for moveing through autocomplete
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : coc#refresh()

" Scrolling
nnoremap <silent> <C-j> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(-100)<CR>

noremap <ScrollWheelDown> :call comfortable_motion#flick(100)<CR>
noremap <ScrollWheelUp>   :call comfortable_motion#flick(-100)<CR>

" Buffers
nnoremap <leader>b :ls<CR>
nnoremap <leader>n :bn<CR>

" ALE Linter
nnoremap <leader>e :ALEToggle<CR>
vnoremap <leader>e :ALEToggle<CR>

" CtrlP Fuzzy Finder
nnoremap <leader>f :CtrlP<CR>
vnoremap <leader>f :CtrlP<CR>

" Coc Prettier
nnoremap <leader>p :Prettier<CR>
vnoremap <leader>p :Prettier<CR>
nnoremap <leader>d :call <SID>show_documentation()<CR>

" MiniMap 
nnoremap <leader>m :GonvimMiniMap<CR>

" MRU Recent Files 
nnoremap <leader>r :MRU<CR>

" Vifm
nnoremap <leader>v :Vifm<CR>

" Whichkey  
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
