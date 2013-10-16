class daptiv::sublime {
  include sublime_text_3

  sublime_text_3::package { 'SublimeLinter':
    source => 'git@github.com:park9140/SublimeLinter',
    branch => 'origin/sublime-text-3'
  }

  # TypeScript Code-Completion
  sublime_text_3::package { 'T3S':
    source => 'git@github.com:Railk/T3S'
  }

  # HTML shortcuts
  sublime_text_3::package { 'emmet-sublime':
    source => 'git@github.com:sergeche/emmet-sublime'
  }

  # Shell and live code execution within a sublime buffer
  sublime_text_3::package { 'SublimeREPL':
    source => 'git@github.com:wuub/SublimeREPL'
  }

}
