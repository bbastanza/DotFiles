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

alias slock="xautolock -detectsleep -time 10 -locker slock"
alias kit="kitty -e"

alias fd="br"
alias fh="br -h"
alias dot="dotnet watch run"
alias audit="npm audit fix"

alias ls="exa -l --group-directories-first"
alias la="exa -a --group-directories-first"
alias ll="exa -la --group-directories-first"
alias lss="exa --group-directories-first"
alias ..="cd .."

alias moc="mocp"
alias mok="mocp -x"

alias vv="vifm ."
alias vim="nvim"
alias svim="sudoedit"
alias evil="emacs -nw"

alias compton="compton --config ~/.config/compton/compton.conf"

# editor
set EDITOR "nvim"

# kitty completion
kitty + complete setup fish | source
