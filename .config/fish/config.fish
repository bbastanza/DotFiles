# fish greeting
set -g -x fish_greeting ' '

# alias
alias nvade="ninvaders"
alias frus="sudo surfshark-vpn down"
alias cm="cmatrix -a"

alias respull="git reset --hard && git pull"
alias gg="cd /home/stanzu10/Dev/git"
alias gs="git status"
alias add="git add"
alias commit="git commit -m"
alias push="git push"

alias remove="sudo apt remove"
alias install="sudo apt install"
alias fd="br"
alias fh="br -h"
alias dot="dotnet watch run"
alias audit="npm audit fix"

alias ls="exa -l"
alias la="exa -a"
alias ll="exa -la"
alias lss="exa"

alias evil="emacs -nw"
alias ..="cd .."

alias cfa="config add -u"
alias cfc="config commit -m"
alias cfp="config push"

alias dotadd="/home/stanzu10/bin/dotpush"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# editor
set EDITOR "vim"

# kitty completion
kitty + complete setup fish | source
