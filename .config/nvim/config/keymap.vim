" Key Bindings
let mapleader=" "

" Basic Commands
nnoremap <silent><leader>. :vsplit<CR>
nnoremap <silent><leader>, :split<CR>
nnoremap <silent><leader>x :x<CR> 
nnoremap <silent><leader>; $
nnoremap <silent><leader>w :write<CR> 
nnoremap <silent><leader>q :q!<CR> 
nnoremap <silent><leader>n :tabnew<CR>
nnoremap <silent><leader><BS> :tabclose<CR>
nnoremap <silent><leader>t :tabnext<CR>
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>
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

nnoremap <leader>st :Startify<CR>
nnoremap <leader>ss :SSave<CR>

" Remove highlight on enter
nnoremap <silent><CR> :noh<CR><CR>

" Move mutiple lines with capital KJ
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Coc Explorer
nmap <silent><space>e :CocCommand explorer<CR>

" Comments
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
nnoremap <silent><leader>bb :ls<CR
nnoremap <silent><leader>bn :bnext<CR>
nnoremap <silent><leader>bp :bprevious<CR>
nnoremap <silent><leader>bk :bdelete<CR>

" CtrlP Fuzzy Finder
nnoremap <silent><leader>r :History<CR>

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

" Whichkey  
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}

" Define a separator
let g:which_key_sep = '=>'

let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment line(s)' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['p'] = [ ':Prettier'       , 'prettier' ]
let g:which_key_map['j'] = [ ':norm 10j'                     , 'down 10 lines' ]
let g:which_key_map['k'] = [ ':norm 10k'                     , 'up 10 lines' ]
let g:which_key_map['h'] = [ ''                     , 'window left' ]
let g:which_key_map['l'] = [ ''                     , 'window right' ]
let g:which_key_map['d'] = [ ''                     , 'show documentation' ]
let g:which_key_map['w'] = [ ':write'                     , 'write file' ]
let g:which_key_map['x'] = [ ':x'                     , 'write quit' ]
let g:which_key_map['bn'] = [ ':bnext'                     , 'buffer next' ]
let g:which_key_map['bk'] = [ ':bk'                     , 'buffer kill' ]
let g:which_key_map['bp'] = [ ':bprevious'                     , 'buffer previous' ]
let g:which_key_map['bb'] = [ ':ls'                     , 'buffers show' ]
let g:which_key_map['b'] = [ ':Buffers'                     , 'search buffers' ]
let g:which_key_map[';'] = [ '$'                     , 'end of line' ]
let g:which_key_map['so'] = [ ':source %'                     , 'source init' ]
let g:which_key_map['ss'] = [ ':SSave'                     , 'save session' ]
let g:which_key_map['q'] = [ ':q!'                     , 'quit (no-write)' ]
let g:which_key_map['m'] = [ ':GonvimMiniMap'                     , 'mini map' ]
let g:which_key_map['1'] = [ ':GonvimMarkdown'                     , 'markdown preview' ]
let g:which_key_map['f'] = [ ':Files ~/'                     , 'search files' ]
let g:which_key_map['st'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['g'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['r'] = [ ':History'                        , 'search recent files' ]
let g:which_key_map['.'] = [ ':vsplit'                     , 'vertical split']
let g:which_key_map[','] = [ ':split'                     , 'horizontal split']
let g:which_key_map['t'] = [ ':tabnext'                       , 'next tab' ]
let g:which_key_map['n'] = [ ':tabnew'                       , 'new tab' ]

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
