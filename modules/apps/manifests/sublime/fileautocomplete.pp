class apps::sublime::fileautocomplete {
  sublime_text::package { 'AutoFileName':
    source => 'git@github.com:BoundInCode/AutoFileName'
  }
}
