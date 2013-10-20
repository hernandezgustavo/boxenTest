class daptiv::environment {

  include daptiv::environment::etc_profile
  include daptiv::environment::increase_ulimit
  include daptiv::environment::localhost_daptiv_com

  # Hack here: adds /usr/local/bin for us early in the setup
  include projects::chefclient

  #--------------------------------
  # Apps that everyone gets
  #--------------------------------
  include chrome
  include daptiv::apps::p4merge
  include daptiv::apps::sublime

  include daptiv::dotFiles
  include daptiv::git
  include daptiv::rdp
  include daptiv::ruby

  include projects::devdashboard
  include projects::ppm
  include projects::ppmspa

}
