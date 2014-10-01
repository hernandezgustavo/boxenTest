class projects::chefclient {
  package { 'GPGTools':
    source   => "https://github.com/downloads/GPGTools/GPGTools/GPGTools-20120318.dmg",
    provider => 'appdmg'
  }

  file { [ "${home}/.chef/"]:
      ensure => "directory",
  }

  boxen::project { 'OS-X-Workstation':
    source => 'git@github.com:daptiv/OS-X-Workstation'
  }
}
