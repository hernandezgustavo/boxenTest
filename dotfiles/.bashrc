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

export VAGRANT_SERVER_URL=http://artrepo.daptiv.com:8081/artifactory/installs/
export CONSUL_URL=http://devconsul.daptiv.com
export ENT_ID=eece29e0-2b95-4b28-8965-0bd74afecd27

# Aliases
alias dir='ls -ba'
alias ll='ls -la'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
