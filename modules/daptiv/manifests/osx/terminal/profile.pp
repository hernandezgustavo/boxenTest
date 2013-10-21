class daptiv::osx::terminal::profile($profile = 'Pro') {

  boxen::osx_defaults { 'Default Terminal Profile':
    domain => 'com.apple.Terminal',
    key    => 'Default Window Settings',
    type   => 'string',
    value  => $profile,
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'Startup Window Settings':
    domain => 'com.apple.Terminal',
    key    => 'Startup Window Settings',
    type   => 'string',
    value  => $profile,
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'DefaultProfilesVersion':
    domain => 'com.apple.Terminal',
    key    => 'DefaultProfilesVersion',
    type   => 'number',
    value  => 1,
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'HasMigratedDefaults':
    domain => 'com.apple.Terminal',
    key    => 'HasMigratedDefaults',
    type   => 'boolean',
    value  => true,
    user   => $::boxen_user
  }
  
}