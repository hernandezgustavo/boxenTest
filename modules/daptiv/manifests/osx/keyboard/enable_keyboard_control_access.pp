# Public: Enables keyboard access for dialog controls.
class daptiv::osx::keyboard::enable_keyboard_control_access {
  boxen::osx_defaults { 'Enable full keyboard access for all controls':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleKeyboardUIMode',
    value  => 3,
    user   => $::boxen_user;
  }
}

