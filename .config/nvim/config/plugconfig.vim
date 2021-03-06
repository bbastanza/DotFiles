" Plugin Config

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" GitGutter
let g:gitgutter_map_keys = 0

" Comfortable Motion
let g:comfortable_motion_no_default_key_mappings = 1 

" Lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'mode_map': {
        \ 'n' : 'Normal',
        \ 'i' : 'Insert',
        \ 'R' : 'Replace',
        \ 'v' : 'Visual',
        \ 'V' : 'V Line',
        \ "\<C-v>": 'V Block',
    \ },
    \ }

function! LightlineFileformat()
  return winwidth(0) > 150 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 150 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
 
" COC
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-emmet',
    \ 'coc-prettier',
    \ 'coc-json', 
    \ 'coc-html', 
    \ 'coc-css', 
    \ 'coc-vimlsp',
    \ 'coc-explorer',
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

" Startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Files']            },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ ]

let g:startify_bookmarks = [
    \ { 'g': '~/Dev/git' },
    \ { 'ch': '~/Dev/challenges' },
    \ { 'w': '~/vimwiki/index.wiki' },
    \ { 'n': '~/.config/nvim' },
    \ { 'a': '~/.config/awesome' },
    \ { 'cp': '~/Dev/git/artist' },
    \ { 't': '~/.config/kitty/kitty.conf' },
    \ { 'f': '~/.config/fish/config.fish' },
    \ { 'co': '~/.config/compton/compton.conf' },
    \ { 'cc': '~/.config' },
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
              
let g:fzf_tags_command = '*'
