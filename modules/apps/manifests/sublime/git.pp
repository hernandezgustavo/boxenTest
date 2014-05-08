class apps::sublime::git {
  sublime_text_3::package { 'GitGutter':
    source => 'git@github.com:jisaacks/GitGutter'
  }
}
