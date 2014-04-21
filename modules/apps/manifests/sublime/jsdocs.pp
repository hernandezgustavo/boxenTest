class apps::sublime::jsdocs {
  sublime_text_3::package { 'sublime-jsdocs':
    source => 'git@github.com:spadgos/sublime-jsdocs'
  }
}
