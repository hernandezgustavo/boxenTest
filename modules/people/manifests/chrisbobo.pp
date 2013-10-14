class people::chrisbobo {
  include daptiv::fishShell
  include daptiv::sublime3

  include daptiv::rdp
  include chrome
  include chrome::canary

  include iterm2::dev

  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard

  include webstorm

  $home = "/Users/${::boxen_user}"

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/chrisbobo/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  include daptiv::git::sharedAliases

  git::config::global { 'user.email':
    value  => 'chrisbobo@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'Chris Bobo'
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/chrisbobo/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/chrisbobo/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/chrisbobo/git-prompt.sh"
  }
  repository{
    'my sublime config':
      source   => 'git@github.com:chrisbobo/sublimeconfig', #short hand for github repos
      provider => 'git',
      path => "${home}/src/sublimeconfig",
      force => true
  }
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
  sublime_text_3::package { 'emmet-sublime':
    source => 'git@github.com:sergeche/emmet-sublime'
  }
  sublime_text_3::package { 'T3S':
    source => 'git@github.com:Railk/T3S'
  }
  sublime_text_3::package { 'sublime-grunt':
    source => 'git@github.com:tvooo/sublime-grunt'
  }

}

