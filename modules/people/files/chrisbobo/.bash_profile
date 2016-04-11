source ~/.git-prompt.sh

#PS1='[\w$(__git_ps1 " (%s)")]\$ '

#----------------------------------
# Exported Env Vars
#----------------------------------

# Use ANSI color sequences to distinguish file types
# Docs: http://bit.ly/165uGk5
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH=~/bin:$PATH
alias subl='subl3'
export EDITOR='subl3 -w'

export BOXEN_GITHUB_LOGIN=chrisbobo@gmail.com
