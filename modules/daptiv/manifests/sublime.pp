class daptiv::sublime {
  # default ruby versions
  include sublime_text_3
  sublime_text_3::package { 'SublimeLinter':
    source => 'git@github.com:park9140/SublimeLinter',
    branch => 'origin/sublime-text-3'
  }
}
