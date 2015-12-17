bash_profile=~/.bash_profile

ulimit -n 3000

if [ -h $bash_profile ]
  then
    source $bash_profile
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source /opt/boxen/env.sh


# allow override of default provider to virtualbox in .bash_profile
if [ -z "$VAGRANT_DEFAULT_PROVIDER" ]
  then export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
fi

export VAGRANT_SERVER_URL=http://vagrantboxes.hq.daptiv.com
