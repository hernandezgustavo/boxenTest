class apps::nodejs::pullquester {
  npm_module { 'pullquester':
    module => 'pullquester',
    node_version => '*'
  }
}
