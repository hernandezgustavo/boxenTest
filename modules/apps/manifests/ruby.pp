class apps::ruby {
  # default ruby versions

  ruby::version { '1.9.3-p194': }
  
  class {'ruby::global':
    version => '1.9.3'
  }

  $version = '1.9.3'
  
  ruby_gem { "bundler for ${version}":
    gem          => 'bundler',
    ruby_version => $version
  }

  ruby_gem { "berkshelf for ${version}":
    gem          => 'berkshelf',
    ruby_version => $version
  }
}
