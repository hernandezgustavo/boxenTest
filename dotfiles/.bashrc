bash_profile=~/.bash_profile
source /opt/boxen/env.sh
ulimit -n 3000
if [ -h $bash_profile ]
    then
        source $bash_profile
fi
