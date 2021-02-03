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

"" Theme
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#9acfd1", "cterm": "145", "cterm16" : "7" }
    let s:black = { "gui": "#202020", "cterm": "234", "cterm16" : "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white, "bg": s:black }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark
"***************************






