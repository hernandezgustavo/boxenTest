class apps::sublime::linter {
  sublime_text::package { 'SublimeLinter':
    source => 'git@github.com:SublimeLinter/SublimeLinter3.git'
  }
  sublime_text::package { 'SublimeLinter-jshint':
    source => 'git@github.com:SublimeLinter/SublimeLinter-jshint.git'
  }
  sublime_text::package { 'SublimeLinter-puppet':
    source => 'git@github.com:mac10/SublimeLinter-puppet-lint.git'
  }
  sublime_text::package { 'SublimeLinter-pylint':
    source => 'git@github.com:SublimeLinter/SublimeLinter-pylint.git'
  }
  sublime_text::package { 'SublimeLinter-ruby':
    source => 'git@github.com:SublimeLinter/SublimeLinter-ruby.git'
  }
  sublime_text::package { 'SublimeLinter-json':
    source => 'git@github.com:SublimeLinter/SublimeLinter-json.git'
  }
  sublime_text::package { 'SublimeLinter-html-tidy':
    source => 'git@github.com:SublimeLinter/SublimeLinter-html-tidy.git'
  }
  sublime_text::package { 'SublimeLinter-contrib-tslint':
    source => 'git@github.com:daptiv/SublimeLinter-contrib-tslint.git'
  }
}
