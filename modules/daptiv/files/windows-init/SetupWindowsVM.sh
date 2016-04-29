#!/bin/bash

echo "Setting up windows VM"

PATH_TO_VAGRANT_BOX="/Users/$SUDO_USER/src/dev_ppm"
PATH_TO_JAR="/opt/boxen/repo/modules/daptiv/files/windows-init/setup-host-only-adapter.jar"

#SUDO_USER gives the user that called this so the following can be run NOT as root
su $SUDO_USER <<EOF
	vagrant box add http://artrepo.daptiv.com:8081/artifactory/api/vagrant/vagrant-local/dev_ppm
	echo "Running against $PATH_TO_VAGRANT_BOX"
	mkdir $PATH_TO_VAGRANT_BOX
	cd $PATH_TO_VAGRANT_BOX
	vagrant init dev_ppm
	vagrant up
	vagrant halt
EOF

java -jar $PATH_TO_JAR $PATH_TO_VAGRANT_BOX 
