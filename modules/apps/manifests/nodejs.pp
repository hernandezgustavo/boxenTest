class apps::nodejs {
  # node versions
  include nodejs::v0_10_21

  #some tools expect node to be in a particular directory on mac, symlink this instead
  file { '/usr/local/bin/node':
    ensure  => link,
    group => 'wheel',
    owner => 'root',
    target  => '/opt/boxen/nodenv/shims/node'
  }

  class { 'nodejs::global':
    version => 'v0.10.26'
  }

  nodejs::module { 'grunt-cli':
    node_version => 'v0.10.26',
    ensure => '0.1.13'
  }
}
