"      _                        _  ___  
"  ___| |_ __ _ _ __  _____   _/ |/ _ \ 
" / __| __/ _` | '_ \|_  / | | | | | | |
" \__ \ || (_| | | | |/ /| |_| | | |_| |
" |___/\__\__,_|_| |_/___|\__,_|_|\___/ 
"                                      
" full stack web developer
" www.brianbastanza.me
" https://github.com/bbastanza 
"
" Nvim Settings
source $HOME/.config/nvim/config/vanilla.vim
source $HOME/.config/nvim/config/plug.vim
source $HOME/.config/nvim/config/plugconfig.vim
source $HOME/.config/nvim/config/keymap.vim
source $HOME/.config/nvim/config/fzf.vim

autocmd BufCreate * :wshada!
" autocmd VimEnter * :CocCommand explorer 

" Theme
set termguicolors

let g:onedark_termcolors = 256  
let g:onedark_terminal_italics = 0

augroup colorset
    autocmd!
        let s:white = { "gui": "#b6efeb", "cterm": "145", "cterm16" : "7" }
        let s:black = { "gui": "#31312c", "cterm": "234", "cterm16" : "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white, "bg": s:black }) " `bg` will not be styled since there is no `bg` setting
augroup END

colorscheme onedark 


highlight ColorColumn guibg=#424242
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal


