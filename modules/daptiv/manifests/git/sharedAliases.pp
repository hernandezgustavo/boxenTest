class daptiv::git::sharedAliases {

    git::config::global { 'alias.cam':
      value  => 'commit -a -m'
    } ->

    git::config::global { 'alias.cm':
      value  => 'commit -m'
    } ->

    git::config::global { 'alias.co':
      value  => 'checkout'
    } ->

    git::config::global { 'alias.cob':
      value  => 'checkout -b'
    } ->

    git::config::global { 'alias.dc':
      value  => 'diff --staged'
    } ->

    git::config::global { 'alias.dw':
      value  => 'diff --word-diff'
    } ->

    git::config::global { 'alias.dwc':
      value  => 'diff --color-words'
    } ->

    git::config::global { 'alias.listconf':
      value  => 'config --global --list'
    } ->

    git::config::global { 'alias.logsl':
      value  => 'log --oneline --decorate'
    } ->

    git::config::global { 'alias.logfg':
      value  => 'log --pretty=oneline --abbrev-commit --graph --decorate --all'
    } ->

    git::config::global { 'alias.logg':
      value  => 'log --graph'
    } ->

    git::config::global { 'alias.puo':
      value  => 'push -u origin'
    } ->

    git::config::global { 'alias.s':
      value  => 'status -u -s'
    } ->

    git::config::global { 'alias.scrub':
      value  => '!git reset --hard && git clean -fd'
    } ->

    git::config::global { 'alias.who':
      value  => 'shortlog -s'
    }

}
