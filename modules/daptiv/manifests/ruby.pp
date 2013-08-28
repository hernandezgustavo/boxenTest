class daptiv::ruby {
  # default ruby versions

  include ruby::1_9_3
  class {'ruby::global':
    version => '1.9.3'
  }

  ruby::gem { "bundler for ${version}":
    gem     => 'bundler',
    ruby    => $version
  }
}
