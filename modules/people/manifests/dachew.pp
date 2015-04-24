class people::dachew {

  $home = "/Users/${::boxen_user}"
  $cfg = "${home}/src/configuration/changepoint"
  $vmare_key = "M069M-6HL82-M8L63-0898H-803KN"

  include apps::googledrive
  include apps::sublime
  include apps::sublime::bracket_highlighter
  include projects::ppm
  include projects::devdashboard
  include apps::git::aliases
  include apps::git::completion
  include chrome
  include firefox
  include vmware_fusion
  include flowdock

  # License VMWare Fusion  
  exec { "license_vmware_fusion":
    command=> "vmware-licenseTool enter ${vmware_key} '' '' '6.0' 'VMware Fusion for Mac OS' ''",
    path => '/Applications/VMware Fusion.app/Contents/Library',
    user => root,
    refreshonly => true,
    subscribe => Package['VMware Fusion']
  }

  vagrant::plugin { 'vmware-fusion':
    license => "${boxen::config::repodir}/modules/people/files/dachew/VagrantVMWareFusionLicense-mpotter.lic"
  }

  vagrant::plugin { 'vagrant-chefconfig': }
  vagrant::plugin { 'vagrant-berkshelf': }

  repository { 'configuration':
      source   => 'git@github.com:dachew/configuration', #short hand for github repos
      provider => 'git',
      path     => '/Users/mpotter/src/configuration/',
      force    => true
  }

  file { "${home}/.bash_profile":
    ensure => link,
    target => "${cfg}/macos/.bash_profile"
  }
  file { "${home}/.vimrc":
    ensure => link,
    target => "${cfg}/macos/.vimrc"
  }

  file { "${home}/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings":
    ensure => file,
    target => "${cfg}/sublime-text/Package Control.sublime-settings"
  }

  file { "${home}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings":
    ensure => file,
    target => "${cfg}/sublime-text/Preferences.sublime-settings"
  }

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'matthew.potter@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Ramun McCallum'
  }
  git::config::global { 'core.editor':
    value  => 'vim'
  }

  # Create a symlink for starting Sublime Text from the terminal
  file { '/usr/local/bin/subl':
    ensure  => link,
    target  => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
  }


  #------------------------
  # Osx Customizations
  #------------------------
  include osx::disable_app_quarantine
  include osx::no_network_dsstores

  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
}
