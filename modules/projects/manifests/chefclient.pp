class projects::chefclient {
  package { 'GPGTools':
    ensure   => installed,
    source   => "${$boxen::config::repodir}/modules/projects/files/GPGTools-20120318.dmg",
    provider => 'pkgdmg'
  }

  file { [ "${home}/.chef/"]:
      ensure => "directory",
  }

  boxen::project { 'OS-X-Workstation':
    source => 'git@github.com:daptiv/OS-X-Workstation'
  }
}
