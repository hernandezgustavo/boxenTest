class people::laynes {
  $vmware_key = "EJ695-2QH8J-H8K7C-0Z1R0-88LJ4"  
  $home = "/Users/${::boxen_user}"

  include projects::chefdk

  include apps::git::difftools::diffmerge
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
  exec { "license_vmware_fusion":
    command=> "vmware-licenseTool enter ${vmware_key} '' '' '7.1' 'VMware Fusion for Mac OS' ''",
    path => '/Applications/VMware Fusion.app/Contents/Library/licenses',
    user => root,
    refreshonly => true,
    subscribe => Package['VMware Fusion']
  }

  # Install Vagrant plugins required for DevOps/Chef development
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/laynes/vagrant_vmware_license.lic"
  }
  vagrant::plugin { 'vagrant-chefconfig': }
  vagrant::plugin { 'vagrant-berkshelf': }

  # Git config
  git::config::global { 'user.email': value  => 'jlaynes@icloud.com' }
  git::config::global { 'user.name': value  => 'Layne Shepherd' }

  # Link to custom bash profile
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/laynes/.bash_profile"
  }

  # Create a symlink for starting Sublime Text from the terminal
#  file { '/usr/local/bin/subl':
#    ensure  => link,
#    target  => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
#  }

  # OS X customizations
  include osx::dock::hot_corners
  include osx::dock::clear_dock
  include osx::dock::autohide
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library

  # Install a modern Ruby
  ruby::version { '2.1.2': }
}
