class apps::sublime::linter {
  sublime_text_3::package { 'SublimeLinter':
    source => 'git@github.com:SublimeLinter/SublimeLinter3.git'
  }
  sublime_text_3::package { 'SublimeLinter-jshint':
    source => 'git@github.com:SublimeLinter/SublimeLinter-jshint.git'
  }
  sublime_text_3::package { 'SublimeLinter-pylint':
    source => 'git@github.com:SublimeLinter/SublimeLinter-pylint.git'
  }
  sublime_text_3::package { 'SublimeLinter-ruby':
    source => 'git@github.com:SublimeLinter/SublimeLinter-ruby.git'
  }
  sublime_text_3::package { 'SublimeLinter-json':
    source => 'git@github.com:SublimeLinter/SublimeLinter-json.git'
  }
  sublime_text_3::package { 'SublimeLinter-html-tidy':
    source => 'git@github.com:SublimeLinter/SublimeLinter-html-tidy.git'
  }
  sublime_text_3::package { 'SublimeLinter-contrib-tslint':
    source => 'git@github.com:daptiv/SublimeLinter-contrib-tslint.git'
  }
}
