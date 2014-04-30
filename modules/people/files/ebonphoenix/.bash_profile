export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
tabname () { printf "\e]1;$1\a"; }
export PATH=~/bin:$PATH
export DB_SERVER_NAME=WIN-NI110EA88RO

source ~/.git-completion.sh
source ~/.git-prompt.sh

PS1='$(printf "%$((`tput cols`-1))s\r")$(stat -f "\e[1;32m%Sp \e[0;33m%Su:%Sg\e[0;39m" .)$(__git_ps1 " \e[0;94m%s\e[0;37m")\n\w: '
