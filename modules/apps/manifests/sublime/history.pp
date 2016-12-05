class apps::sublime::history {
  sublime_text::package { 'Local History':
    source => 'git@github.com:vishr/local-history'
  }
}
