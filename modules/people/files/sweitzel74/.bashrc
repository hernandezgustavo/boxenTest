function add_to_path ()
{
    if [[ "$PATH" =~ (^|:)"$1"(:|$) ]]
    then
        return 0
    fi
    export PATH=$1:$PATH
}

ulimit -n 3000

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
tabname () { printf "\e]1;$1\a"; }
export EDITOR='subl -w'

export GOPATH=~/src/gocode

source /opt/boxen/env.sh

add_to_path "~/.cabal/bin"
add_to_path "~/bin"
add_to_path "~/.chefdk/gem/ruby/2.1.0/bin"
add_to_path "$GOPATH/bin"

# allow override of default provider to virtualbox in .bash_profile
if [ -z "$VAGRANT_DEFAULT_PROVIDER" ]
  then export VAGRANT_DEFAULT_PROVIDER=virtualbox
fi

export VAGRANT_SERVER_URL=http://vagrantboxes.hq.daptiv.com
export CHEF_DATA_BAGS=~/src/chef-repo/data_bags
export CHEF_SECRET_FILE=~/.chef/ops_encrypted_data_bag_secret

source ~/.git-completion.sh
source ~/.git-prompt.sh

PS1='$(printf "%$((`tput cols`-1))s\r")$(stat -f "\e[1;32m%Sp \e[0;33m%Su:%Sg\e[0;39m" .)$(__git_ps1 " \e[0;94m%s\e[0;37m")\n\w: '
