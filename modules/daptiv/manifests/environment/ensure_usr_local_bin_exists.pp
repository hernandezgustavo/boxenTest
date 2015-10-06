class daptiv::environment::ensure_usr_local_bin_exists {
  file { [ "/usr" ]:
      ensure => "directory",
      owner => "root",
      group => "wheel"
  }
}
