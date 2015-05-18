export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
tabname () { printf "\e]1;$1\a"; }
export PATH=~/bin:$PATH
export EDITOR='atom'

source ~/.git-completion.sh
source ~/.git-prompt.sh

PS1='$(printf "%$((`tput cols`-1))s\r")$(stat -f "\e[1;32m%Sp \e[0;33m%Su:%Sg\e[0;39m" .)$(__git_ps1 " \e[0;94m%s\e[0;37m")\n\w: '

# PpmEndpointTests Configuration
export DB_SERVER_NAME=WIN-2008R2SP1

# search for vmware vmx file for dev_ppm box and store path
export VM_VMX=`find ~/src/dev_ppm -name '*.vmx'`
# run vmrun command with first argument ($1) for the current vm ($VM_VMX)
vm()
{
    vmrun -T fusion $1 $VM_VMX nogui
}
