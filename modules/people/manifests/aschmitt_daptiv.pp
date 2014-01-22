class people::aschmitt_daptiv {

  include chrome::canary

  #------------------------
  # Git
  #------------------------
  include apps::git::aliases

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'aschmitt@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'aschmitt-daptiv'
  }

  #------------------------
  # Osx Customizations
  #------------------------
  include osx::dialogs::expand_print_dialog
  include osx::dialogs::expand_save_dialog

  include osx::disable_app_quarantine

  include osx::finder::show_hidden_files
  include osx::finder::unhide_library

  include osx::keyboard::enable_keyboard_control_access
  include osx::keyboard::use_standard_function_keys

  include osx::mouse::enable_right_click

  include osx::no_network_dsstores

  include osx::terminal::default_profile

  #------------------------
  # Sublime Customizations
  #------------------------
  file { "${home}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings":
    ensure  => link,
    target  => "${home}/src/sublimeconfig/Preferences.sublime-settings"
  }

  file { "${home}/Library/Application Support/Sublime Text 3/Packages/User/SublimeLinter.sublime-settings":
    ensure  => link,
    target  => "${home}/src/sublimeconfig/SublimeLinter.sublime-settings"
  }

  sublime_text_3::package { 'Wombat Theme':
    source => 'git@github.com:sheerun/sublime-wombat-theme'
  }

  sublime_text_3::package { 'BracketHighlighter':
    source => 'git@github.com:facelessuser/BracketHighlighter'
  }


  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this default profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/aschmitt_daptiv/.bash_profile"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/shared/git-prompt.sh"
  }
}
