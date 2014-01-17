class people::chrisbobo {
  $home = "/Users/${::boxen_user}"


  include dropbox
  include apps::googledrive
  include apps::vmware
  include chrome::canary
  include apps::webstorm


#  include apps::git::difftools::p4merge
  include apps::git::aliases
  include apps::git::completion
  include apps::git::prompt
  git::config::global { 'user.email':
    value  => 'chrisbobo@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'Chris Bobo'
  }


  repository{
    'my sublime config':
      source   => 'git@github.com:chrisbobo/sublimeconfig', #short hand for github repos
      provider => 'git',
      path => "${home}/src/sublimeconfig",
      force => true
  }
  include apps::sublime::ensure_settings_links_exist
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme


  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/chrisbobo/.bash_profile"
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

