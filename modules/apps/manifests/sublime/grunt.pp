class apps::sublime::grunt {
  sublime_text::package { 'sublime-grunt':
    source => 'git@github.com:tvooo/sublime-grunt'
  }
}
