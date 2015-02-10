# CONFIGURATION
#
# Change this to your username.
GITHUB_USERNAME="delta62"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# tabname () { printf "\e]1;$1\a"; }
export PATH=~/bin:$PATH

# General aliases
alias l="ls"
alias ls="ls -lA"
alias grep="grep -i --colour"

export DB_SERVER_NAME="WIN-2008R2SP1"

# Use this to get at scripts & stuff from this repo
export BOXEN_USER_FILES="$BOXEN_HOME/repo/modules/people/files/$GITHUB_USERNAME"

# Add custom scripts to $PATH
export PATH="$PATH:$BOXEN_USER_FILES/bin"

# I still really need to change this...
PS1='$(printf "%$((`tput cols`-1))s\r")$(stat -f "\e[1;32m%Sp \e[0;33m%Su:%Sg\e[0;39m" .)$(__git_ps1 " \e[0;94m%s\e[0;37m")\n\w: '

# VMWare headless mode
VMWARE_CMD="vmrun -T fusion start"
VMWARE_BASE="$HOME/src/dev_ppm/.vagrant/machines/default/vmware_fusion"
VMWARE_GUID="f0e640c2-a217-4b63-a5f1-244d3ca08d4d"
VMWARE_IMAGE="packer-vmware-vmx-1411665448.vmx"
alias startvm="$VMWARE_CMD $VMWARE_BASE/$VMWARE_GUID/$VMWARE_IMAGE nogui"


# Git bindings

delta62_git_alias() {
    alias $2="$1"
    if [ "$3" ]
    then
        __git_complete $2 $3
    fi
}

# These need to be copied from git's installation directory.
# I symlinked mine to boxen/../people/files/shared/
source ~/.git-completion.sh
source ~/.git-prompt.sh

delta62_git_alias "git status"   gs
delta62_git_alias "git branch"   gb   _git_branch
delta62_git_alias "git diff"     gd   _git_diff
delta62_git_alias "git commit"   gc   _git_commit
delta62_git_alias "git pull"     gpl  _git_pull
delta62_git_alias "git push"     gp   _git_push
delta62_git_alias "git add"      ga   _git_add
delta62_git_alias "git log"      gl   _git_log
delta62_git_alias "git checkout" gco  _git_checkout
