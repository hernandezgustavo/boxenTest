class apps::sublime::less {
  sublime_text::package { 'LESS-sublime':
    source => 'git@github.com:danro/LESS-sublime'
  }
}
