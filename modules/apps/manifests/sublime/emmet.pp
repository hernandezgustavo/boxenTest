class apps::sublime::emmet {
  sublime_text_3::package { 'emmet-sublime':
    source => 'git@github.com:sergeche/emmet-sublime'
  }
}
