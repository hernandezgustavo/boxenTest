require boxen::environment

class projects::spa {
  nodejs::module { 'bower':
    node_version => 'v0.10'
  }
}
