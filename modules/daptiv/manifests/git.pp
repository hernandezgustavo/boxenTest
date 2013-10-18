class daptiv::git {
  git::config::global { 'color.ui':
    value  => 'true'
  }

  git::config::global { 'push.default':
    value  => 'simple'
  }

  git::config::global { 'merge.tool':
    value  => 'p4merge'
  }

  git::config::global { 'mergetool.prompt':
    value  => 'false'
  }

  git::config::global { 'mergetool.keepBackup':
    value  => 'false'
  }

  # p4merge is not fully setup yet.
  git::config::global { 'mergetool "p4merge".path':
    value  => '/Applications/p4merge'
  }

}
