class apps::sublime::ensure_settings_links_exist {
  $home = "/Users/${::boxen_user}"

  file { "${home}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings":
    ensure  => link,
    target  => "${home}/sublimeconfig/Preferences.sublime-settings"
  }

  file { "${home}/Library/Application Support/Sublime Text 3/Packages/User/SublimeLinter.sublime-settings":
    ensure  => link,
    target  => "${home}/sublimeconfig/SublimeLinter.sublime-settings"
  }
}
