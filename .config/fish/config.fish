# fish greeting
set -g -x fish_greeting ' '

# alias
alias nvade="ninvaders"
alias frus="sudo surfshark-vpn down"
alias cm="cmatrix -a"

alias respull="git reset --hard && git pull"
alias gg="cd /home/stanzu10/Dev/git"
alias gs="git status"

alias remove="sudo apt remove"
alias install="sudo apt install"
alias fd="br"
alias fh="br -h"
alias dot="dotnet watch run"
alias audit="npm audit fix"

alias ls="exa -l"
alias la="exa -a"
alias ll="exa -la"

alias evil="emacs -nw"
alias ..="cd .."

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# editor
set -x EDITOR vim

# kitty completion
kitty + complete setup fish | source
