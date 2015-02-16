export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
tabname () { printf "\e]1;$1\a"; }
export EDITOR='subl3 -w'
export PATH=~/bin:$PATH
export DB_SERVER_NAME='WIN-2008R2SP1'
# search for vmware vmx file for dev_ppm box and store path
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

source ~/.git-completion.sh
source ~/.git-prompt.sh

PS1='$(printf "%$((`tput cols`-1))s\r")$(stat -f "\e[1;32m%Sp \e[0;33m%Su:%Sg\e[0;39m" .)$(__git_ps1 " \e[0;94m%s\e[0;37m")\n\w: '

#live write history
export PROMPT_COMMAND="history -a;"
