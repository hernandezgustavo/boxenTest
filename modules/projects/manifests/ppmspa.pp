class projects::ppmspa ($vm_ip_address = '192.168.56.101') {
  include boxen::config
  include projects::ppm
  include apps::nodejs
  include apps::phantomjs

  package { 'yarn': }

  host { 'ppm_hosts':
    name         => 'localvm.daptiv.com',
    comment      => 'vm host entries for ppm vm created by boxen',
    host_aliases => ['devsso.daptiv.com', 'devapi.daptiv.com', 'devadminapi.daptiv.com', 'dev.daptiv.com', 'devauth.daptiv.com'],
    ip           => $vm_ip_address
  }

  host { 'ppm_local_rewrite':
    name         => 'devppm.daptiv.com',
    comment      => 'allows devppm.daptiv.com/spa/ to route to ppmspa.dev served content',
    ip           => '127.0.0.1'
  }

  boxen::project { 'PpmSpa':
    nginx         => "${boxen::config::repodir}/modules/projects/templates/ppmspa.nginx.conf.erb",
    source        => 'git@github.com:daptiv/PpmSpa'
  }
}
