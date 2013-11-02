class daptiv::environment::localhost_daptiv_com {
  file_line { 'Add hosts entry for 127.0.0.1 localhost.daptiv.com':
    line => '127.0.0.1 localhost.daptiv.com',
    path => '/etc/hosts'
  }
}
