" Key Bindings
let mapleader=" "

" Basic Commands
nnoremap <silent><leader>. :vsplit<CR>
nnoremap <silent><leader>, :split<CR>
nnoremap <silent><leader>x :x<CR> 
nnoremap <silent><leader>; $
nnoremap <leader>w :write<CR> 
nnoremap <silent><leader>q :q!<CR> 
nnoremap <silent><leader><leader>t :tabnew<CR>
nnoremap <silent><leader><BS> :tabclose<CR>
nnoremap <silent><leader>t :tabnext<CR>
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><C-l> :5winc ><CR>
nnoremap <silent><C-h> :5winc <<CR>
nnoremap <silent><C-[> <C-w>+
nnoremap <silent><C-]> <C-w>-
nnoremap <C-s> :wa<CR> 
nnoremap <silent>U :redo<CR>

" Move to window with Space + Vim movement
nnoremap <silent><leader><leader>j <C-W>j
nnoremap <silent><leader><leader>k <C-W>k
nnoremap <silent><leader>h <C-W>h
nnoremap <silent><leader>l <C-W>l
nnoremap <silent><leader>j :norm 10j<CR>
nnoremap <silent><leader>k :norm 10k<CR>

nnoremap <leader>ss :Startify<CR>
" Remove highlight on enter
nnoremap <silent><CR> :noh<CR><CR>

" Move mutiple lines with capital KJ
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" open nerdtree in pwd
nmap <silent><space>e :CocCommand explorer<CR>

" comments
nnoremap <silent><leader>/ :Commentary<CR>
vnoremap <silent><leader>/ :Commentary<CR>

" control jk for moveing through autocomplete
inoremap <silent><expr> <C-j> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <silent><expr> <C-k> pumvisible() ? "\<C-p>" : coc#refresh()

" Scrolling
nnoremap <silent> <C-j> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(-100)<CR>

noremap <ScrollWheelDown> :call comfortable_motion#flick(100)<CR>
noremap <ScrollWheelUp>   :call comfortable_motion#flick(-100)<CR>

" Buffers
nnoremap <leader>b :ls<CR>
nnoremap <silent><leader>n :bn<CR>

" CtrlP Fuzzy Finder
nnoremap <leader>f :CtrlP<CR>
vnoremap <leader>f :CtrlP<CR>

" Coc Prettier
nnoremap <leader>p :Prettier<CR>
vnoremap <leader>p :Prettier<CR>
nnoremap <silent><leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Goneovim 
nnoremap <silent><leader>m :GonvimMiniMap<CR>
nnoremap <silent><leader>1 :GonvimMarkdown<CR>

" MRU Recent Files 
nnoremap <silent><leader>r :MRU<CR>

" Vifm
nnoremap <silent><leader>v :Vifm<CR>

" Whichkey  
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
