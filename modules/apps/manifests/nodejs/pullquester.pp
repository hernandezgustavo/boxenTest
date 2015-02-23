class apps::nodejs::pullquester {
  nodejs::module { 'pullquester':
    node_version => 'v0.10'
  }
}
