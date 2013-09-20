class people::park9140 {
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

  $home = "/Users/${::boxen_user}"

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  git::config::global { 'user.email':
    value  => 'jpark@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Jonathan Park'
  }


  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/git-prompt.sh"
  }
  repository{
    'my sublime config':
      source   => 'park9140/sublimeconfig', #short hand for github repos
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
  
#used to share editing at floobits.com
  sublime_text_3::package { 'Floobits':
    source => 'Floobits/floobits-sublime'
  }
  sublime_text_3::package { 'Wombat Theme':
    source => 'sheerun/sublime-wombat-theme'
  }
  sublime_text_3::package { 'BracketHighlighter':
    source => 'facelessuser/BracketHighlighter'
  }
  sublime_text_3::package { 'sublime-jsdocs':
    source => 'spadgos/sublime-jsdocs'
  }
  sublime_text_3::package { 'emmet-sublime':
    source => 'sergeche/emmet-sublime'
  }
  sublime_text_3::package { 'ts3':
    source => 'Railk/T3S'
  }
}

