class apps::sublime::markdown {
  sublime_text::package { 'sublime-markdown-extended':
    source => 'git@github.com:jonschlinkert/sublime-markdown-extended'
  }
  sublime_text::package { 'sublime-monokai-extended':
    source => 'git@github.com:jonschlinkert/sublime-monokai-extended'
  }
  sublime_text::package { 'MarkdownTOC':
    source => 'git@github.com:naokazuterada/MarkdownTOC.git'
  }
}
