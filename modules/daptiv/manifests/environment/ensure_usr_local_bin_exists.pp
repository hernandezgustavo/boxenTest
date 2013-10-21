class daptiv::environment::ensure_usr_local_bin_exists {

  exec { 'Ensure /usr/local/bin exists':
  	command => 'mkdir -p /usr/local/bin',
    unless => 'grep /usr/local/bin',
  	user => root
  }
}
