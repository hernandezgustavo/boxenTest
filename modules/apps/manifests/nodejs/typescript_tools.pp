class apps::nodejs::typescript_tools {
  nodejs::module { 'typescript-tools':
     node_version => 'v0.10',
     ensure => '0.2.2-1'
  }
}
