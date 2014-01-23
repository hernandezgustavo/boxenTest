class apps::sublime::typescript {
  sublime_text_3::package { 'sublime-grunt':
    source => 'git@github.com:tvooo/sublime-grunt'
  }
}
