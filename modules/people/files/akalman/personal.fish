set -x EDITOR 'subl3 -w'

alias ls="ls -al"
alias "git branch clean"="git branch -D (git branch | trim)"

function trim; sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'; end
