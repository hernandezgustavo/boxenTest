bash_profile=~/.bash_profile
source /opt/boxen/env.sh
if [ -h $bash_profile ]
    then
        source $bash_profile
fi
