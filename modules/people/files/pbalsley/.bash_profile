export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
tabname () { printf "\e]1;$1\a"; }
export PATH=~/bin:$PATH:~/scripts
export PPM_VM_IP=192.168.56.101
source ~/.git-completion.sh
source ~/.git-prompt.sh

PS1='$(printf "%$((`tput cols`-1))s\r")$(stat -f "\e[1;32m%Sp \e[0;33m%Su:%Sg\e[0;39m" .)$(__git_ps1 " \e[0;94m%s\e[0;37m")\n\w: '

alias spaprod='grunt build-ci --production $@'
docker-machine-set () {
    local env=$1
    eval $(docker-machine env $env)
    echo $DOCKER_HOST
}
docker-machine-set default

