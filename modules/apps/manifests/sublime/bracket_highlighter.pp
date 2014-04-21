class apps::sublime::bracket_highlighter {
  sublime_text_3::package { 'BracketHighlighter':
    source => 'git@github.com:facelessuser/BracketHighlighter'
  }
}

