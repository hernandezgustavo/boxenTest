class apps::sublime::history {
  sublime_text_3::package { 'Local History':
    source => 'git@github.com:vishr/local-history'
  }
}
