class projects::resourcemanagement ($vm_ip_address = '192.168.56.101') {
  include boxen::config

  host { 'devrm.daptiv.com':
    name    => 'devrm.daptiv.com',
    comment => 'routing for resourcemanagement',
    ip      => $vm_ip_address
  }

}
