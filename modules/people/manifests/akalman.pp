class people::akalman {
  $home = "/Users/${::boxen_user}"

  include apps::fishShell

  include chrome::canary

  include dropbox
  include apps::googledrive

  include apps::webstorm
  include apps::git::difftools::p4merge


  #git config
  git::config::global { 'user.email':
    value  => 'akalman@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Adam Kalman'
  }


  #files setup
  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/akalman/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/akalman/.bash_profile"
  }


  #sublime config
  include apps::sublime::ensure_settings_links_exist
  include apps::sublime::wombat_theme
  include apps::sublime::bracket_highlighter
  include apps::sublime::jsdocs
  include apps::sublime::grunt

  #hosts update
  file_line { 'ppm_hosts_ppmspa_remove':
    line => '192.168.56.101 devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com localvm.daptiv.com',
    path => '/etc/hosts',
    subscribe => File_Line['ppm_hosts_ppmspa']
  }

  #nodejs
  nodejs::module { 'typescript-tools':
    node_version => 'v0.10',
    ensure => '0.2.2-1'
  }
}

