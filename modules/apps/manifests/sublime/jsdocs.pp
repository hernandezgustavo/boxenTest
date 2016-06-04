class apps::sublime::jsdocs {
  sublime_text::package { 'sublime-jsdocs':
    source => 'git@github.com:spadgos/sublime-jsdocs'
  }
}
