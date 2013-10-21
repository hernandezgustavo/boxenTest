class daptiv::osx::system::menu::show_battery_percentage {

  boxen::osx_defaults { 'Show Battery Percentage':
    domain => 'com.apple.menuextra.battery',
    key    => 'ShowPercent',
    type   => 'bool',
    value  => true,
    user   => $::boxen_user
  }

}