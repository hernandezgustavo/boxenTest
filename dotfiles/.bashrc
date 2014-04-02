bash_profile=~/.bash_profile

ulimit -n 3000

if [ -h $bash_profile ]
  then
    source $bash_profile
fi

PATH=$PATH:$HOME/.rvm/bin:$HOME/src/scripts # Add RVM to PATH for scripting

source /opt/boxen/env.sh

export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
alias spaprod='grunt build-ci --production $@'

