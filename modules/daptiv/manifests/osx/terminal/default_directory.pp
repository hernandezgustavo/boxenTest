class daptiv::osx::terminal::default_directory($default_dir = '~/src') {

  boxen::osx_defaults { 'Shell':
    domain => 'com.apple.Terminal',
    key    => 'Shell',
    type   => 'string',
    value  => $default_dir,
    user   => $::boxen_user
  }

}