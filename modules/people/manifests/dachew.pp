class people::dachew {

  $home = "/Users/${::boxen_user}"

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this dachew profile is updated as they
  #are symlinked into your home directory.

  repository{
    'windows-setup':
      source   => 'git@github.com:dachew/configuration', #short hand for github repos
      provider => 'git',
      path => "${home}/src/configuration",
      force => true
  }

  file { "${home}/.bash_profile":
    ensure => link,
    target => "${home}/src/configuration/changepoint/macos/.bash_profile"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${home}/src/configuration/changepoint/macos/git-prompt.sh"
  }


  #add projects chefclient, ppm, ppmspa and dev dashboard
  include apps::googledrive
  include apps::sublime
  include apps::sublime::bracket_highlighter
  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard

  vagrant::plugin { 'vmware-fusion':
    license => "${boxen::config::repodir}/modules/people/files/dachew/VagrantVMWareFusionLicense-mpotter.lic"
  }

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'matthew.potter@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Matthew McCallum'
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
