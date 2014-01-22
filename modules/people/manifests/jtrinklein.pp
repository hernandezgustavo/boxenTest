class people::jtrinklein {
  include apps::fishShell
  include apps::sublime

  include iterm2::dev

  include projects::ppm
  include projects::chefclient
  include projects::devdashboard

  include virtualbox

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

