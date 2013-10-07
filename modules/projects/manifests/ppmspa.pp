class projects::ppmspa {
  include boxen::config

  file_line { 'ppm_hosts_remove':
    line => '192.168.56.101 devppm.daptiv.com devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com',
    ensure => absent,
    path => '/etc/hosts',
    subscribe => File_Line['ppm_hosts']
  }

  file_line { 'ppm_hosts_ppmspa':
    line => '192.168.56.101 devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com localvm.daptiv.com',
    path => '/etc/hosts',
    subscribe => File_Line['ppm_hosts_remove']
  }

  file_line { 'ppm_spa_hosts':
    line => '127.0.0.1 devppm.daptiv.com',
    path => '/etc/hosts',
    subscribe => File_Line['ppm_hosts_remove']
  }

  boxen::project { 'PpmSpa':
    nginx         => "${boxen::config::repodir}/modules/projects/files/ppmspa.nginx.conf.erb",
    source        => 'git@github.com:daptiv/PpmSpa'
  }
}
