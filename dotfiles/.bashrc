bash_profile=~/.bash_profile

ulimit -n 3000

if [ -h $bash_profile ]
  then
    source $bash_profile
fi

PATH=$PATH:$HOME/.rvm/bin:$HOME/src/scripts # Add RVM to PATH for scripting
PATH=$PATH:$HOME/bin

source /opt/boxen/env.sh


# allow override of default provider to virtualbox in .bash_profile
if [ -z "$VAGRANT_DEFAULT_PROVIDER" ]
  then export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
fi

export VAGRANT_SERVER_URL=http://vagrantboxes.hq.daptiv.com


# Aliases
alias dir='ls -ba'
alias ll='ls -la'


docker-machine-set()
    {
      local machine_name=$1
      docker-machine start $machine_name
      eval "$(docker-machine env $machine_name)"
      echo Docker machine ip is "$(docker-machine ip $machine_name)"
    }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

docker-machine-set()
    {
      local machine_name=$1
      docker-machine start $machine_name
      eval "$(docker-machine env $machine_name)"
      echo Docker machine ip is "$(docker-machine ip $machine_name)"
    }
