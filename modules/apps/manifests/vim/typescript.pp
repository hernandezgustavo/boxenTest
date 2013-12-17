class apps::vim::typescript {
  require apps::vim
  require nodejs::v0_10

  $node_version = 'v0.10'
  $tsvimrc = "${$boxen::config::repodir}/modules/apps/files/vim/.tsvimrc"

  file { "${tsvimrc}":
    ensure => present
  }

  file_line { 'add_typescript_tools_plugin_to_vim_run_time_path':
    line => "set rtp+=${::nodejs::params::nodenv_root}/versions/${node_version}/lib/node_modules/typescript-tools/",
    path => "${::vim::vimrc}",
    require => [
      File["${::vim::vimrc}"],
      Nodejs::Module['typescript-tools']
    ]
  }

  file_line { 'source_typescript_vimrc':
    line => ":so ${tsvimrc}",
    path => "${::vim::vimrc}",
    require => [
      File["${tsvimrc}"]
    ]
  }

  vim::bundle { [
    'leafgarland/typescript-vim'
  ]: }

  nodejs::module { 'typescript-tools':
     node_version => "${node_version}",
     ensure => '0.2.2-1'
  }

  nodejs::module { 'typescript':
    node_version => "${node_version}",
    ensure => '0.9.1-1'
  }
}
