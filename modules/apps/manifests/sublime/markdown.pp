class apps::sublime::markdown {
  sublime_text_3::package { 'sublime-markdown-extended':
    source => 'git@github.com:jonschlinkert/sublime-markdown-extended'
  }
  sublime_text_3::package { 'sublime-monokai-extended':
    source => 'git@github.com:jonschlinkert/sublime-monokai-extended'
  }
  sublime_text_3::package { 'MarkdownTOC':
    source => 'git@github.com:naokazuterada/MarkdownTOC.git'
  }
}
