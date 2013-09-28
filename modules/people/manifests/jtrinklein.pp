class people::park9140 {
  include daptiv::fishShell
  include daptiv::sublime3

  include daptiv::rdp

  include iterm2::dev

  include projects::ppm
  include projects::chefclient
  include projects::devdashboard

  $home = "/Users/${::boxen_user}"

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jtrinklein/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  git::config::global { 'user.email':
    value  => 'jtrinklein@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'James Trinklein'
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jtrinklein/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jtrinklein/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jtrinklein/git-prompt.sh"
  }
  repository{
    'my dotfiles':
      source   => 'git@github.com:jtrinklein/dotfiles', #short hand for github repos
      provider => 'git',
      path => "${home}/src/dotfiles",
      force => true
  }
  file { "${home}/.vimrc":
    ensure  => link,
    target  => "${home}/src/dotfiles/.vimrc"
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
  sublime_text_3::package { 'ts3':
    source => 'git@github.com:Railk/T3S'
  }
  sublime_text_3::package { 'sublime-grunt':
    source => 'git@github.com:tvooo/sublime-grunt'
  }

  #hosts update
  #file_line { 'ppm_hosts_ppmspa_remove':
  #  line => '192.168.56.101 devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com localvm.daptiv.com',
  #  path => '/etc/hosts',
  #  ensure => 'absent',
  #  subscribe => File_Line['ppm_hosts_ppmspa']
  #}
  #file_line { 'ppm_hosts_ppmspa_park9140':
  #  line => '192.168.56.130 devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com localvm.daptiv.com',
  #  path => '/etc/hosts',
  #  subscribe => File_Line['ppm_hosts_ppmspa_remove']
  #}
}

