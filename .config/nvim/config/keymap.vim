" Key Bindings
let mapleader=" "

" Basic Commands
nnoremap <silent><leader>. :vsplit<CR>
nnoremap <silent><leader>, :split<CR>
nnoremap <silent><leader>x :x<CR> 
nnoremap <silent><leader>; $
nnoremap <silent><leader>c ~h
nnoremap <silent><leader>ww :write<CR> 
nnoremap <silent><leader>w :write<CR> 
nnoremap <silent><leader>q :q!<CR> 
nnoremap <silent><leader>n :tabnew<CR>:CocCommand explorer<CR>
nnoremap <silent><leader>o o<Esc>k
nnoremap <silent><leader>O O<Esc>j
nnoremap <silent><leader><BS> :tabclose<CR>
nnoremap <silent><leader>t :tabnext<CR>
nnoremap <silent>U :redo<CR>
nnoremap <silent>J 10j
nnoremap <silent>K 10k
nnoremap <silent>H 10h
nnoremap <silent>L 10l
nnoremap <silent><C-l> :5winc ><CR>
nnoremap <silent><C-h> :5winc <<CR>
nnoremap <silent><C-[> <C-w>+
nnoremap <silent><C-]> <C-w>-
nnoremap <silent><leader>se :set spell<CR>
nnoremap <silent><leader>sd :set nospell<CR>
nnoremap <C-s> :wa<CR> :echo 'write all'<CR>
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

" Move to window with Space + Vim movement
nnoremap <silent><leader>j <C-W>j
nnoremap <silent><leader>k <C-W>k
nnoremap <silent><leader>h <C-W>h
nnoremap <silent><leader>l <C-W>l

nnoremap <leader>st :Startify<CR>
nnoremap <leader>ss :SSave<CR>

" Remove highlight on enter
nnoremap <silent><ESC> :noh<CR>

" Move multiple lines with capital K J
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Coc 
" Explorer
nnoremap <silent><leader>e :CocCommand explorer<CR>
nnoremap <leader>E coc#refresh()
" Prettier
nnoremap <leader>p :Prettier<CR>
vnoremap <leader>p :Prettier<CR>
nnoremap <silent><leader>d :call <SID>show_documentation()<CR>
" tsserver
nnoremap <leader>2 :CocCommand tsserver.restart<CR>

" Comments
nnoremap <silent><leader>/ :Commentary<CR>
vnoremap <silent><leader>/ :Commentary<CR>

" control jk for moveing through autocomplete
inoremap <silent><expr> <C-j> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <silent><expr> <C-k> pumvisible() ? "\<C-p>" : coc#refresh()

" Scrolling
nnoremap <silent> <C-j> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(-100)<CR>

" CtrlP Fuzzy Finder
nnoremap <silent><leader>r :FZFMru<CR>

noremap <ScrollWheelDown> :call comfortable_motion#flick(100)<CR>
noremap <ScrollWheelUp>   :call comfortable_motion#flick(-100)<CR>

" Buffer 
nnoremap <silent><leader>bb :Buffers<CR>
nnoremap <silent><leader>bn :bnext<CR>
nnoremap <silent><leader>bp :bprevious<CR>
nnoremap <silent><leader>bk :bdelete<CR>

" Goneovim 
nnoremap <silent><leader>m :GonvimMiniMap<CR>
nnoremap <silent><leader>1 :GonvimMarkdown<CR>

" Whichkey  
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

function! ToggleSpell()
  if !exists("g:showingSpell")
    let g:showingSpell=0
  endif
  if g:showingSpell==0
    execute "hi SpellBad cterm=underline ctermfg=red"
    let g:showingSpell=1
  else
    execute "hi clear SpellBad"
    let g:showingSpell=0
  endif
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:which_key_map =  {}
let g:which_key_sep = '=>'
let g:which_key_use_floating_win = 0

highlight default link WhichKeySeperator Operator
highlight default link WhichKey          DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['.'] = [ ':vsplit'                          , 'vertical split']
let g:which_key_map[','] = [ ':split'                           , 'horizontal split']
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'        , 'comment line(s)' ]
let g:which_key_map['c'] = [ '~h'                               , 'capitalize' ]
let g:which_key_map[';'] = [ '$'                                , 'end of line' ]
let g:which_key_map['bn'] = [ ':bnext'                          , 'buffer next' ]
let g:which_key_map['bk'] = [ ':bk'                             , 'buffer kill' ]
let g:which_key_map['bp'] = [ ':bprevious'                      , 'buffer previous' ]
let g:which_key_map['bb'] = [ ':Buffers'                        , 'search buffers' ]
let g:which_key_map['d'] = [ 'd :call <SID>show_documentation()<CR>'    , 'show documentation' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'             , 'coc-explorer' ]
let g:which_key_map['E'] = [ 'coc#refresh()'                    , 'coc-explorer refresh' ]
let g:which_key_map['j'] = [ '<C-W>j'                           , 'window up' ]
let g:which_key_map['k'] = [ '<C-W>k'                           , 'window down' ]
let g:which_key_map['h'] = [ '<C-W>h'                           , 'window left' ]
let g:which_key_map['l'] = [ '<C-W>l'                           , 'window right' ]
let g:which_key_map['m'] = [ ':GonvimMiniMap'                   , 'mini map' ]
let g:which_key_map['1'] = [ ':GonvimMarkdown'                  , 'markdown preview' ]
let g:which_key_map['2'] = [ ':CocCommand tsserver.restart'     , 'restart tsserver' ]
let g:which_key_map['n'] = [ ':tabnew'                          , 'new tab' ]
let g:which_key_map['t'] = [ ':tabnext'                         , 'next tab' ]
let g:which_key_map['o'] = [ 'o<CR>k'                           , 'new line below' ]
let g:which_key_map['O'] = [ 'O<CR>j'                           , 'new line above' ]
let g:which_key_map['p'] = [ ':Prettier'                        , 'prettier' ]
let g:which_key_map['q'] = [ ':q!'                              , 'quit (no-write)' ]
let g:which_key_map['so'] = [ ':source %'                       , 'source init' ]
let g:which_key_map['ss'] = [ ':SSave'                          , 'save session' ]
let g:which_key_map['st'] = [ ':Startify'                       , 'start screen' ]
let g:which_key_map['ww'] = [ ':write'                          , 'write file' ]
let g:which_key_map['w'] = [ ':write'                          , 'write file' ]
let g:which_key_map['x'] = [ ':x'                               , 'write quit' ]
let g:which_key_map[';'] = [ '$'                                , 'end of line' ]
let g:which_key_map['f'] = [ ':Files ~/'                        , 'search home' ]   
let g:which_key_map['F'] = [ ':Files'                           , 'search files' ]
let g:which_key_map['r'] = [ ':FZFMru'                           , 'search recent' ]
let g:which_key_map['g'] = [ ':Rg'                              , 'search text' ]

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
