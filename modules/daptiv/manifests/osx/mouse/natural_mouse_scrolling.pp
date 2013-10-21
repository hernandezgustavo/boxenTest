# Public: Modify 'natural' mouse scrolling (enable or disable). Requires re-login.
class daptiv::osx::mouse::natural_scrolling($enabled = true) {
  boxen::osx_defaults { 'Disable natural mouse scrolling':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.swipescrolldirection',
    type   => 'boolean',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
