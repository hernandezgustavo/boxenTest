#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


echo "Setting up windows VM"

PathToVagrantBox="/Users/$SUDO_USER/src/dev_ppm"
PathToJar="/opt/boxen/repo/modules/daptiv/files/windows-init/setup-host-only-adapter.jar"

su $SUDO_USER <<EOF
	vagrant box add http://artrepo.daptiv.com:8081/artifactory/api/vagrant/vagrant-local/dev_ppm
	echo "Running against $PathToVagrantBox"
	mkdir $PathToVagrantBox
	cd $PathToVagrantBox
	vagrant init dev_ppm
	vagrant up
	vagrant halt
EOF

java -jar $PathToJar $PathToVagrantBox 
