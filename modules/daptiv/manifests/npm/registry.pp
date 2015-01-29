class daptiv::npm::registry ($source = "${boxen::config::repodir}/modules/daptiv/files/npm/.npmrc") {
  $home = "/Users/${::boxen_user}"

  file { "npmrc":
    path => "${home}/.npmrc",
    ensure => file,
    mode => "0644",
    source  => $source
  }
}
