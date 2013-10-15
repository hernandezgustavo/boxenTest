class daptiv::sublime3 {
  # default ruby versions
  include sublime_text_3
  sublime_text_3::package { 'SublimeLinter':
    source => 'git@github.com:SublimeLinter/SublimeLinter',
    branch => 'origin/sublime-text-3'
  }
}
