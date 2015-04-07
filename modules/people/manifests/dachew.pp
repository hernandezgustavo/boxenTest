class people::dachew {

  $home = "/Users/${::boxen_user}"
  $vmare_key = "M069M-6HL82-M8L63-0898H-803KN"

  repository{
    'configuration':
      source   => 'git@github.com:dachew/configuration', #short hand for github repos
      provider => 'git',
      path => "${home}/src/configuration",
      force => true
  }

  file { "${home}/.bash_profile":
    ensure => link,
    target => "${home}/src/configuration/changepoint/macos/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure => link,
    target => "${home}/src/configuration/changepoint/macos/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure => link,
    target => "${home}/src/configuration/changepoint/macos/git-prompt.sh"
  }

  #add projects ppm, ppmspa and dev dashboard
  include apps::googledrive
  include apps::sublime
  include apps::sublime::bracket_highlighter
  include apps::flowdock
  include projects::ppm
  include projects::devdashboard

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

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'matthew.potter@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Matthew McCallum'
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
