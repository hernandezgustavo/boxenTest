# Public: Show Hidden Files by default.
class daptiv::osx::finder::show_hidden_files {
  include daptiv::osx::finder

  boxen::osx_defaults { 'Show Hidden Files':
    user   => $::boxen_user,
    key    => 'AppleShowAllFiles',
    domain => 'com.apple.finder',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
