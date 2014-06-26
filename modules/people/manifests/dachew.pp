# Replace name of all the "dachew" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::dachew {

  $home = "/Users/${::boxen_user}"

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this drewburlingame profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/dachew/.bash_profile"
  }

  #add projects chefclient, ppm, ppmspa and dev dashboard
  include dropbox
  include apps::googledrive
  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard
  include projects::devscripts

  vagrant::plugin { 'vmware-fusion':
    license => "${boxen::config::repodir}/modules/people/files/dachew/VagrantVMWareFusionLicense-mpotter.lic"
  }

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'matthew@synapseware.com'
  }
  git::config::global { 'user.name':
    value  => 'Matthew Potter'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this dachew profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/dachew/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/dachew/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/dachew/git-prompt.sh"
  }

  #------------------------
  # Osx Customizations
  #------------------------
  include osx::dock::clear_dock
  include osx::disable_app_quarantine
  include osx::no_network_dsstores

  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

  include osx::finder::show_all_on_desktop
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library
}
