class apps::sublime::powershell {
  sublime_text_3::package { 'sublime-powershell':
    source => 'git@github.com:SublimeText/PowerShell'
  }
}
