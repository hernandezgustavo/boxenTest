class daptiv::environment::ensure_usr_local_bin_exists {
  file { [ "/usr", "/usr/local", "/usr/local/bin" ]:
      ensure => "directory",
      owner => "root",
      group => "wheel"
  }
}
