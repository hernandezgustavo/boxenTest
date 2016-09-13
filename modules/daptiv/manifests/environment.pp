class daptiv::environment ($include_teammember = true) {

  osx::recovery_message { 'If this Mac is found, please call 206-239-7424': }

  include daptiv::environment::etc_profile
  include daptiv::environment::set_ulimit_to_max
  include daptiv::environment::localhost_daptiv_com

  #--------------------------------
  # Apps that everyone gets
  #--------------------------------
  include chrome
  include virtualbox

  include daptiv::dotfiles
  include daptiv::npm::registry

  include apps::git
  include apps::git::aliases
  include apps::git::completion
  include apps::git::prompt

  include apps::rdp
  include apps::ruby
  include apps::sublime
  include apps::java

  include projects::devdashboard
  include projects::ppm
  include projects::ppmspa

  if ($include_teammember) {
    include projects::teammember
  }
}
