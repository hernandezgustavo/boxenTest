class apps::sublime::puppet {
  sublime_text_3::package { 'sublime-puppet':
    source => 'git@github.com:russCloak/SublimePuppet'
  }
}
