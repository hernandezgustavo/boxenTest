class people::sneal {
  $home = "/Users/${::boxen_user}"

  include apps::git::difftools::p4merge
  include apps::git::aliases
  include apps::git::completion
  include apps::git::prompt
  include chrome::canary
  include firefox
  include virtualbox
  include vmware_fusion
  include lastpass
  include flowdock

  # License VMWare Fusion
  exec {  "set_vmware_fusion_key_sneal":
    command=> "'/Applications/VMware Fusion.app/Contents/Library/vmware-licenseTool' enter 05233-0H2E6-M8A6C-0J0UK-C1UQJ '' '' '6.0' 'VMware Fusion for Mac OS' ''",
    user => root
  }

  # Install Vagrant plugins required for DevOps/Chef development
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/sneal/vagrant_vmware_license.lic"
  }
  vagrant::plugin { 'vagrant-chefconfig': }
  vagrant::plugin { 'vagrant-berkshelf': }

  # Git config
  git::config::global { 'user.email': value  => 'sneal@sneal.net' }
  git::config::global { 'user.name': value  => 'Shawn Neal' }

  # Link to custom bash profile
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/sneal/.bash_profile"
  }

  # Link to custom knife config
  file { "${home}/.chef":
    ensure  => directory
  }
  file { "${home}/.chef/knife.rb":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/sneal/knife.rb"
  }

  # Create a symlink for starting Sublime Text from the terminal
  file { '/usr/local/bin/subl':
    ensure  => link,
    target  => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
  }

  # OS X customizations
  include osx::dock::clear_dock
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library

  # Install a modern Ruby
  ruby::version { '2.1.2': }
}
