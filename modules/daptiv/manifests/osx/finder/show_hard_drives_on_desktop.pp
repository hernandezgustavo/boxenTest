# Public: Show internal drives on the desktop.
class daptiv::osx::finder::show_hard_drives_on_desktop {
  include daptiv::osx::finder

  boxen::osx_defaults { 'Show internal drives on the desktop':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'ShowHardDrivesOnDesktop',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
