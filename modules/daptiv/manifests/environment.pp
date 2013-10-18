class daptiv::environment {
  include daptiv::environment::etc_profile
  include daptiv::environment::increase_ulimit
  include daptiv::environment::localhost_daptiv_com

  #--------------------------------
  # Apps that everyone gets
  #--------------------------------
  include chrome
  include dropbox
  include virtualbox

  include daptiv::apps::googledrive
  include daptiv::apps::p4merge
  include daptiv::apps::sublime
  include daptiv::apps::vmware

  include daptiv::dotFiles
  include daptiv::git
  include daptiv::nodejs
  include daptiv::phantomjs
  include daptiv::rdp
  include daptiv::ruby

  include projects::all

}
