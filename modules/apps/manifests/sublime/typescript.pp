class apps::sublime::typescript {
  sublime_text_3::package { 'T3S':
    source => 'git@github.com:Railk/T3S',
    branch => 'dev'
  }
  sublime_text_3::package { 'SublimeLinter_colors':
    source => 'git@github.com:ericclemmons/sublime-typescript.git'
  }
}
