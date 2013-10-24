class daptiv::environment {

  include daptiv::environment::ensure_usr_local_bin_exists
  include daptiv::environment::etc_profile
  include daptiv::environment::set_ulimit_to_max
  include daptiv::environment::localhost_daptiv_com

  #--------------------------------
  # Apps that everyone gets
  #--------------------------------
  include chrome
  include apps::sublime

  include daptiv::dotFiles
  include apps::git
  include apps::rdp
  include apps::ruby

  include projects::chefclient
  include projects::devdashboard
  include projects::ppm
  include projects::ppmspa

}
