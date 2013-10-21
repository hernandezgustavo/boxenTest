# Public: Use all F1, F2, etc. keys as standard function keys.
#
# Examples
#
#   # Use function keys as standard function keys
#   include daptiv::osx::keyboard::use_standard_function_keys
#
class daptiv::osx::keyboard::use_standard_function_keys {
  boxen::osx_defaults { 'Use all F1, F2, etc. keys as standard function keys':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.keyboard.fnState',
    type   => 'boolean',
    value  => true,
    user   => $::boxen_user;
  }
}
