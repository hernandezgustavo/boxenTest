# Shell and live code execution within a sublime buffer
class apps::sublime::repl {
  sublime_text_3::package { 'SublimeREPL':
    source => 'git@github.com:wuub/SublimeREPL'
  }
}
