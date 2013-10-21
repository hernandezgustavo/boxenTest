# Public: Sets the icons's size
class daptiv::osx::dock::icon_size($size = 36) {
  include daptiv::osx::dock

  boxen::osx_defaults { 'icon size':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'tilesize',
    type   => 'int',
    value  => $size,
    notify => Exec['killall Dock'];
  }
}