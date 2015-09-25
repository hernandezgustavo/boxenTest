class apps::nodejs::typescript_tools {
  npm_module { 'typescript-tools':
     module => 'typescript-tools',
     node_version => '*',
     version => '0.3.1'
  }
}
