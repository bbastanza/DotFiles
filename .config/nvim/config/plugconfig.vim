" Plugin Config
"
" Ctrl-P => disable default mapping
let g:ctrlp_map = ''

" MRU Recent Files
let MRU_Open_File_Use_Tabs = 0

" Lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" start Nerdtree on startup 
autocmd VimEnter * :CocCommand explorer 

" COC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-emmet',
  \ 'coc-prettier',
  \ 'coc-vimlsp',
  \ 'coc-explorer',
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ 'coc-css', 
  \ ]

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

" GitGutter
let g:gitgutter_map_keys = 0

" Comfortable Motion
let g:comfortable_motion_no_default_key_mappings = 1 

" Startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ ]
let g:startify_bookmarks = [
            \ { 'g': '~/Dev/git' },
            \ { 's': '~/Dev/git/sortit/Sort-It/src' },
            \ { 'n': '~/.config/nvim' },
            \ { 'a': '~/.config/awesome' },
            \ { 't': '~/.config/kitty/kitty.conf' },
            \ { 'f': '~/.config/fish/config.fish' },
            \ { 'f': '~/.config/compton/compton.conf' },
            \ { 'c': '~/.config' },
            \ ]
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_custom_header = [
        \ '',
        \ '',
        \ '',
        \ '',
        \ '          ███╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗    ███╗',
        \ '          ██╔╝    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║    ╚██║',
        \ '          ██║     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     ██║',
        \ '          ██║     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ██║',
        \ '          ███╗    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    ███║',
        \ '          ╚══╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚══╝',
        \ '',
        \]
      
