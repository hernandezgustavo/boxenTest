class apps::sublime::wombat_theme {
  sublime_text::package { 'Wombat Theme':
    source => 'git@github.com:sheerun/sublime-wombat-theme'
  }
}

