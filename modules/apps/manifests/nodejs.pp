class apps::nodejs {
  # node versions
  nodejs::version { '4.2.4': }

  #some tools expect node to be in a particular directory on mac, symlink this instead
  file { '/usr/local/bin/node':
    ensure  => link,
    group => 'wheel',
    owner => 'root',
    target  => '/opt/boxen/nodenv/shims/node'
  }

  class { 'nodejs::global':
    version => '4.2.4'
  }

  npm_module { 'grunt-cli':
    module => 'grunt-cli',
    node_version => '*',
    version => '0.1.13'
  }

  npm_module { 'gulp-cli':
    module => 'gulp-cli',
    node_version => '*',
    version => '0.3.0'
  }

  npm_module { 'npm':
    module => 'npm',
    node_version => '*',
    version => '3.3.12'
  }
}
