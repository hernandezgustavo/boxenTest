class people::chrisbobo {
  $home = "/Users/${::boxen_user}"

  include dropbox
#  include daptiv::apps::googledrive
#  include daptiv::apps::vmware

#  include chrome::canary
#  include daptiv::apps::webstorm
#  include iterm2::dev


  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/chrisbobo/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/shared/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/shared/git-prompt.sh"
  }


  #------------------------
  # Fish Shell
  #------------------------
#  include daptiv::fishShell
#  file { "${home}/.config/fish/personal.fish":
#    ensure  => link,
#    target  => "${$boxen::config::repodir}/modules/people/chrisbobo/personal.fish",
#    subscribe => File["${home}/.config/fish/"]
#  }


  #------------------------
  # Git
  #------------------------
  include daptiv::git::shared_aliases
  
  git::config::global { 'user.email':
    value  => 'chrisbobo@gmail.com'
  }
  
  git::config::global { 'user.name':
    value  => 'Chris Bobo'
  }


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

  sublime_text_3::package { 'sublime-jsdocs':
    source => 'git@github.com:spadgos/sublime-jsdocs'
  }

  sublime_text_3::package { 'sublime-grunt':
    source => 'git@github.com:tvooo/sublime-grunt'
  }

  repository{
    'my sublime config':
      source   => 'git@github.com:chrisbobo/sublimeconfig', #short hand for github repos
      provider => 'git',
      path => "${home}/src/sublimeconfig",
      force => true
  }


  #------------------------
  # Osx Customizations
  #------------------------
  include daptiv::osx::dialogs::expand_print_dialog
  include daptiv::osx::dialogs::expand_save_dialog

  include daptiv::osx::system::disable_app_quarantine

  include daptiv::osx::dock::autohide
  include daptiv::osx::dock::orientation
  class { 'daptiv::osx::dock::icon_size':
    size => 64
  }

  include daptiv::osx::finder::show_all_on_desktop
  include daptiv::osx::finder::show_hidden_files
  include daptiv::osx::finder::unhide_library

  include daptiv::osx::keyboard::enable_keyboard_control_access
  include daptiv::osx::keyboard::use_standard_function_keys

  include daptiv::osx::system::menu::date_format
  include daptiv::osx::system::menu::show_battery_percentage

  include daptiv::osx::mouse::enable_right_click

  include daptiv::osx::no_network_dsstores

  include daptiv::osx::terminal::default_directory
  include daptiv::osx::terminal::profile

}

