export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
tabname () { printf "\e]1;$1\a"; }
export PATH=~/bin:$PATH

source ~/.git-completion.sh
source ~/.git-prompt.sh

# General aliases
alias l="ls"
alias ls="ls -lA"
alias grep="grep -i --colour"

export DB_SERVER_NAME="WIN-2008R2SP1"

PS1='$(printf "%$((`tput cols`-1))s\r")$(stat -f "\e[1;32m%Sp \e[0;33m%Su:%Sg\e[0;39m" .)$(__git_ps1 " \e[0;94m%s\e[0;37m")\n\w: '

# Git bindings

delta62_git_alias() {
    alias $2="$1"
    if [ "$3" ]
    then
        __git_complete $2 $3
    fi
}

delta62_git_alias "git status"   gs  
delta62_git_alias "git branch"   gb   _git_branch
delta62_git_alias "git diff"     gd   _git_diff
delta62_git_alias "git commit"   gc   _git_commit
delta62_git_alias "git pull"     gpl  _git_pull
delta62_git_alias "git push"     gp   _git_push
delta62_git_alias "git add"      ga   _git_add
delta62_git_alias "git log"      gl   _git_log
delta62_git_alias "git checkout" gco  _git_checkout
