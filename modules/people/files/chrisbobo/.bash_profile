# Which ones are correct?
source ~/.git-completion.sh
source ~/.git-prompt.sh

source ~/.env-credentials


tabname () { printf "\e]1;$1\a"; }


PS1='[\w$(__git_ps1 " (%s)")]\$ '


#----------------------------------
# Exported Env Vars
#----------------------------------

# Use ANSI color sequences to distinguish file types
# Docs: http://bit.ly/165uGk5
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH=~/bin:$PATH
alias subl='subl3'
export EDITOR='subl -w'

#live write history
export PROMPT_COMMAND="history -a;"

# PpmEndpointTests Configuration
export DB_SERVER_NAME=vagrant-2008R2
