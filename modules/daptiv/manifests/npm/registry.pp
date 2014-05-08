class daptiv::npm::registry {
  $home = "/Users/${::boxen_user}"

  file { "${home}/.npmrc":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/daptiv/files/npm/.npmrc"
  }
}
