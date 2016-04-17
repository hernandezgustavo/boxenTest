class apps::sublime::typescript {
  sublime_text::package { 'T3S':
    source => 'git@github.com:Railk/T3S',
    branch => 'origin/dev'
  }
  sublime_text::package { 'SublimeLinter_colors':
    source => 'git@github.com:ericclemmons/sublime-typescript.git'
  }
}
