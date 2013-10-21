class daptiv::osx::system::menu::date_format($date_format = 'EEE MMM d  h:mm a') {

  boxen::osx_defaults { 'Date Format':
    domain => 'com.apple.menuextra.clock',
    key    => 'DateFormat',
    type   => 'string',
    value  => $date_format,
    user   => $::boxen_user
  }

}