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
nnoremap <leader>t :call NERDTreeTogglePwdAndRefresh()<cr>

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
nnoremap <leader>x :x<CR> 
nnoremap <leader>w :write<CR> 
nnoremap <leader>q :q!<CR> 
nnoremap <leader><BS> :tabclose<CR>
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>r :MRU<CR>
nnoremap <leader>m :GonvimMiniMap<CR>
nnoremap <leader>b :ls<CR>
nnoremap <leader>n :bn<CR>
"***************************

" coc prettier
nnoremap <leader>p :Prettier<CR>
vnoremap <leader>p :Prettier<CR>
nnoremap <leader>d :call <SID>show_documentation()<CR>

" ALE
nnoremap <leader>e :ALEToggle<CR>
" nnoremap <leader>d :ALEHover<CR>
vnoremap <leader>e :ALEToggle<CR>

" CtrlP
nnoremap <leader>f :CtrlP<CR>
vnoremap <leader>f :CtrlP<CR>
