class daptiv::sublime3 {
  # default ruby versions
  include sublime_text_3
  sublime_text_3::package { 'Linter':
    source => 'SublimeLinter/SublimeLinter'
  }
}
