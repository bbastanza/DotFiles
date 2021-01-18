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

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfadd="config add -u"
alias cfcommit="config commit -m"
alias cfpush="config push"

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

alias wolf="/home/stanzu10/Setup/AppImages/LibreWolf-84.0.2-1.x86_64.AppImage"

alias moc="mocp"
alias mok="mocp -x"
# editor
set EDITOR "vim"

# kitty completion
kitty + complete setup fish | source
