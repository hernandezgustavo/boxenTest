class apps::git::aliases {

    git::config::global { 'alias.who':
      value  => 'shortlog -s'
    }

    git::config::global { 'alias.logg':
      value  => 'log --graph'
    }

    git::config::global { 'alias.logsl':
      value  => 'log --oneline --decorate'
    }

    git::config::global { 'alias.logfg':
      value  => 'log --pretty=oneline --abbrev-commit --graph --decorate --all'
    }

    git::config::global { 'alias.st':
      value  => 'status'
    }

    git::config::global { 'alias.co':
      value  => 'checkout'
    }

    git::config::global { 'alias.cob':
      value  => 'checkout -b'
    }

}
