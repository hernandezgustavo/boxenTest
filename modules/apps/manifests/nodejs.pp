class apps::nodejs {
  # node versions
  include nodejs::v0_10

  #some tools expect node to be in a particular directory on mac, symlink this instead
  file { "/usr/local/bin/node":
    ensure  => link,
    target  => "/opt/boxen/nodenv/shims/node"
  }

  class {'nodejs::global':
    version => 'v0.10'
  }

  nodejs::module { 'grunt-cli':
    node_version => 'v0.10',
    ensure => '0.1.9'
  }
}
