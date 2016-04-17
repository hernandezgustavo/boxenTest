# Shell and live code execution within a sublime buffer
class apps::sublime::repl {
  sublime_text::package { 'SublimeREPL':
    source => 'git@github.com:wuub/SublimeREPL'
  }
}
