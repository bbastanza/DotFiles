" Plugin Config
"
" Ctrl-P => disable default mapping
let g:ctrlp_map = ''

" MRU Recent Files
let MRU_Open_File_Use_Tabs = 0
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
function! NERDTreeTogglePwdAndRefresh()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
  exe ":NERDTreeRefreshRoot"
endfunction

" nerdtree ignore 
let g:NERDTreeIgnore = ['^build$']
let g:NERDTreeIgnore = ['^node_modules$']

" start Nerdtree on startup 
autocmd VimEnter * NERDTree | wincmd p
"***************************

" COC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json', 
  \ 'coc-css', 
  \ ]

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"***************************

" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⇶'
let g:ale_set_highlights = 1
let g:ale_sign_column_always = 1

" Comfortable Motion
let g:comfortable_motion_no_default_key_mappings = 1 
