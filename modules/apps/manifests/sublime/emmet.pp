class apps::sublime::emmet {
  sublime_text::package { 'emmet-sublime':
    source => 'git@github.com:sergeche/emmet-sublime'
  }
}
