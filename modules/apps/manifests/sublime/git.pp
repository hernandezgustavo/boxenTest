class apps::sublime::git {
  sublime_text::package { 'GitGutter':
    source => 'git@github.com:jisaacks/GitGutter'
  }
}
