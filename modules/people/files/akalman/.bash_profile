export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=/opt/nodes/4.2.4/bin:~/bin:/opt/local/bin:$PATH
export EDITOR='vim';
export DB_SERVER_NAME='WIN-2012R2'
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
export HOMEBREW_GITHUB_API_TOKEN=fd2b363bb059998dc8b66700f75b09219ea2e5dc

source ~/.git-completion.sh
source ~/.git-prompt.sh

PS1='$(printf "%$((`tput cols`-1))s\r")$(stat -f "\e[1;32m%Sp \e[0;33m%Su:%Sg\e[0;39m" .)$(__git_ps1 " \e[0;94m%s\e[0;37m")\n\w: '

#live write history
export PROMPT_COMMAND="history -a;"
