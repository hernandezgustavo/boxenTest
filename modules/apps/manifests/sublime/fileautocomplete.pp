class apps::sublime::fileautocomplete {
  sublime_text_3::package { 'AutoFileName':
    source => 'git@github.com:BoundInCode/AutoFileName'
  }
}
