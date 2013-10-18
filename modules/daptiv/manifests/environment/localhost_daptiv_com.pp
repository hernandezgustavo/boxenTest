class daptiv::environment::localhost_daptiv_com {
  file_line { 'localhost_daptiv_com':
    line => '127.0.0.1 localhost.daptiv.com',
    path => '/etc/hosts',
  }
}
