class daptiv::nodejs {
  # node versions
  include nodejs::v0_10

  class {'nodejs::global':
    version => 'v0.10'
  }

  nodejs::module { 'grunt-cli':
    node_version => 'v0.10'
  }
}
