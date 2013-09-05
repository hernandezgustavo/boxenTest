class daptiv::sublime {
  # default ruby versions
  include sublime_text_2
  sublime_text_2::package { 'Linter':
    source => 'SublimeLinter/SublimeLinter'
  }
}
