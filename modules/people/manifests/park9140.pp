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
      source   => 'git@github.com:park9140/sublimeconfig', #short hand for github repos
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
    source => 'git@github.com:Floobits/floobits-sublime'
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

  #hosts update
  file_line { 'ppm_hosts_ppmspa_remove':
    line => '192.168.56.101 devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com localvm.daptiv.com',
    path => '/etc/hosts',
    ensure => 'absent',
    subscribe => File_Line['ppm_hosts_ppmspa']
  }
  file_line { 'ppm_hosts_ppmspa_park9140':
    line => '192.168.57.130 devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com localvm.daptiv.com',
    path => '/etc/hosts',
    subscribe => File_Line['ppm_hosts_ppmspa_remove']
  }
}

