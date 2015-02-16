class apps::git ($default_push_strategy = 'simple') {
  git::config::global { 'color.ui':
    value  => 'true'
  }

  git::config::global { 'push.default':
    value  => $default_push_strategy
  }
}
