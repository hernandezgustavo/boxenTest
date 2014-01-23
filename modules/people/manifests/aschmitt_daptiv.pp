class people::aschmitt_daptiv {

  include chrome::canary

  #------------------------
  # Git
  #------------------------
  git::config::global { 'user.email':
    value  => 'aschmitt@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'aschmitt-daptiv'
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

  #------------------------
  # Sublime Customizations
  #------------------------
  include apps::sublime::ensure_settings_links_exist
  include apps::sublime::wombat_theme
  include apps::sublime::bracket_highlighter


  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/aschmitt_daptiv/.bash_profile"
  }


}
