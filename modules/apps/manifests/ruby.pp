class apps::ruby {
  # default ruby versions

  ruby::version { '2.2.2': }
  
  class {'ruby::global':
    version => '2.2.2'
  }

  $version = '2.2.2'
  
  ruby_gem { "bundler for ${version}":
    gem          => 'bundler',
    ruby_version => $version
  }
}
