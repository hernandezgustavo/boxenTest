class daptiv::sublime::linter {
  sublime_text_3::package { 'SublimeLinter':
    source => 'git@github.com:park9140/SublimeLinter',
    branch => 'origin/sublime-text-3'
  }
}
