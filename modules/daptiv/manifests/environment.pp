class daptiv::environment {
  file { '/usr/local/bin':
    ensure => directory,
    mode => 0644
  }

  include daptiv::environment::etc_profile
  include daptiv::environment::increase_ulimit
  include daptiv::environment::localhost_daptiv_com


  #--------------------------------
  # Apps that everyone gets
  #--------------------------------
  include chrome
  include daptiv::apps::p4merge
  include daptiv::apps::sublime

  include virtualbox

  include daptiv::dotFiles
  include daptiv::git
  include daptiv::rdp
  include daptiv::ruby

  include projects::chefclient
  include projects::devdashboard
  include projects::ppm
  include projects::ppmspa

}
