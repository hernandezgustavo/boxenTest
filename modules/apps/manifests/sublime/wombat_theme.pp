class apps::sublime::wombat_theme {
  sublime_text_3::package { 'Wombat Theme':
    source => 'git@github.com:sheerun/sublime-wombat-theme'
  }
}

