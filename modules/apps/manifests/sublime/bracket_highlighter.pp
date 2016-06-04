class apps::sublime::bracket_highlighter {
  sublime_text::package { 'BracketHighlighter':
    source => 'git@github.com:facelessuser/BracketHighlighter'
  }
}

