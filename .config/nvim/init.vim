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
autocmd VimEnter * :CocCommand explorer 

" Theme
augroup colorset
    autocmd!
        let s:white = { "gui": "#bacfd4", "cterm": "145", "cterm16" : "7" }
        let s:black = { "gui": "#232323", "cterm": "234", "cterm16" : "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white, "bg": s:black }) " `bg` will not be styled since there is no `bg` setting
augroup END

set termguicolors
colorscheme onedark

" Installed Colors
" ayu, onedark, nord, sonokai

" The configuration options should be placed before `colorscheme sonokai`.
" let g:sonokai_style = 'shusia'
" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1

" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme

