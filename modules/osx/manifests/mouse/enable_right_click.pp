class osx::mouse::enable_right_click {
  boxen::osx_defaults { 'Enable mouse right click':
    ensure => present,
    domain => 'com.apple.driver.appleBluetoothMultitouch.mouse',
    key    => 'MouseButtonMode',
    type   => 'string',
    value  => 'TwoButton',
    user   => $::boxen_user;
  }
}
