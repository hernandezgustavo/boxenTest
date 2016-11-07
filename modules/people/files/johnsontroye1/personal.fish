set -x EDITOR 'vim'

alias ls="ls -al"
alias "gitbranchclean"="git branch -D (git branch | trim)"

function trim; sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'; end
