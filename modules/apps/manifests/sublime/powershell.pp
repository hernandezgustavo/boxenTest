class apps::sublime::powershell {
  sublime_text::package { 'sublime-powershell':
    source => 'git@github.com:SublimeText/PowerShell'
  }
}
