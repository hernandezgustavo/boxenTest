class apps::sublime::less {
  sublime_text_3::package { 'LESS-sublime':
    source => 'git@github.com:danro/LESS-sublime'
  }
}
