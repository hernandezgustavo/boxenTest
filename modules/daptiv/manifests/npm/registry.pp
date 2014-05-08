class daptiv::npm::registry {
  $home = "/Users/${::boxen_user}"

  file { "npmrc":
    path => "${home}/.npmrc",
    ensure => file,
    replace => false,
    mode => "0644",
    source  => "${$boxen::config::repodir}/modules/daptiv/files/npm/.npmrc"
  }
}
