class daptiv::git {
    git::config::global { 'color.ui':
      value  => 'true'
    }
    git::config::global { 'push.default':
      value  => 'simple'
    }
}
