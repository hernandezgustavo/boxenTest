class apps::sublime::puppet {
  sublime_text::package { 'sublime-puppet':
    source => 'git@github.com:russCloak/SublimePuppet'
  }
}
