class osx::dock::orientation($orientation = 'left') {
  include osx::dock

  validate_re($orientation, '^(left|right|bottom)$', "osx::dock::orientation must be left, right, or bottom but is ${ensure}")

  boxen::osx_defaults { 'Set dock orientation':
    user   => $::boxen_user,
    key    => 'orientation',
    domain => 'com.apple.dock',
    value  => $orientation,
    notify => Exec['killall Dock'];
  }
}
