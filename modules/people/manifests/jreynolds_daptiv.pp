# Replace name of all the "default" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::jreynolds_daptiv {

  include firefox
  include flowdock
  include homebrewcask
  include iterm2::dev

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'jreynolds@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Jared Reynolds'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this jreynolds_daptiv profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jreynolds_daptiv/.bash_profile"
  }



  #hosts update
  file_line { 'ppm_hosts_ppmspa_remove':
    line => '192.168.56.101 devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com localvm.daptiv.com',
    path => '/etc/hosts',
    ensure => 'absent',
    subscribe => File_Line['ppm_hosts_ppmspa']
  }
  file_line { 'ppm_hosts_ppmspa_jreynolds_daptiv':
    line => '192.168.132.130 devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com localvm.daptiv.com',
    path => '/etc/hosts',
    subscribe => File_Line['ppm_hosts_ppmspa_remove']
  }
}
