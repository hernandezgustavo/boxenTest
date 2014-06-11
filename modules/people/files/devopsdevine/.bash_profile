source ~/git-completion.sh
source ~/git-prompt.sh

export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH
export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"
export SOURCEDIR=~/src
export PRIVATESOURCEDIR=~/psrc
export OPSCODE_USER=mdevine-daptiv
export gh_email=DevOpsDevine@gmail.com
export gh_password=i7F2OCrPcFOc
export VAGRANT_ELASTICSEARCH_NODE_COUNT=3
export DB_SERVER_NAME=WIN-NI110EA88R0

tabname () { printf "\e]1;$1\a"; }

#navigation
alias src="cd ${SOURCEDIR}"
alias psrc="cd ${PRIVATESOURCEDIR}"

alias berkshelf="cd ${HOME}/.berkshelf"
alias chefrepo="cd ${SOURCEDIR}/chef-repo"
alias cookbooks="cd ${SOURCEDIR}/chef-repo/cookbooks"
alias dev="cd ${SOURCEDIR}/daptiv_dev_ppm_workstation"
alias gendzume="cd ${SOURCEDIR}/gendzume"
alias help="cd ${SOURCEDIR}/PpmHelpSource"
alias membase="cd ${SOURCEDIR}/daptiv_membase"
alias ppm="cd ${SOURCEDIR}/Ppm"
alias ppmapp="cd ${SOURCEDIR}/PpmApp"
alias ppmlib="cd ${SOURCEDIR}/PpmLib"
alias osx="cd ${SOURCEDIR}/OS-X-Workstation"
alias site="cd ${SOURCEDIR}/daptiv_site"
alias test="cd ${SOURCEDIR}/daptiv_test_ppm_workstation"
alias winsetup="cd ${SOURCEDIR}/daptiv_winsetup"
 
#execution shortcuts
alias be="bundle exec"
alias bsi="be berks install --path ${SOURCEDIR}/chef-repo/cookbooks"
alias bsu="be berks update"
alias bsv="bsu&&bsi"

alias gstat="git status"
alias gdiff="git diff"
alias gcom="git commit -a -m"
alias gmas="git checkout master"
alias gadd="git add ."
alias gpush="git push origin head"
alias gpull="git pull"
alias gprune="git fetch -p"

alias vinf="VAGRANT_LOG=INFO"
alias vdbg="VAGRANT_LOG=DEBUG"
alias vstat="vagrant status"
alias vup="vagrant up"
alias vdup="vdbg vagrant up"
alias vpro="vagrant provision"
alias vdpro="vdbg vagrant provision"
alias vdown="vagrant halt"
alias vhalt=vdown
alias vsusp="vagrant suspend"
alias vrel="vagrant reload"
alias vdrel="vdbg vagrant reload"
alias vlist="vagrant box list"
alias exterminate="vagrant destroy -f"

#change to source directory, clone a repo, then get oouuuut
gclone() { src&&git clone git@github.com:daptiv/"$@".git&&cd -; }
pclone() { psrc&&git clone git@github.com:DevOpsDevine/"$@".git&&cd -; }
gtag() { git tag -a "$1" -m "version $1" $2; }

#remove a vagrant box
vremove() { vagrant box remove "$@" virtualbox; }

#make these shell functions available to child processes, like in an xargs call
export -f gclone
export -f pclone
export -f vremove
export -f gtag

#speaking of which...
#vagrant box remove all base boxes
alias vlistcol="vlist | cut -d' ' -f 1" 
alias vnuke='vlist | cut -d" " -f 1 | xargs -n 1 bash -c '"'"'vremove '"\"\$@\"'"' _ ;'
