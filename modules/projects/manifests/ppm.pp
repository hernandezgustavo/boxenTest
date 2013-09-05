class projects::ppm {
  include daptiv::vagrant

  file_line { 'ppm_hosts': 
    line => '192.168.56.101 devppm.daptiv.com devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com', 
    path => '/etc/hosts', 
  }

  boxen::project { 'daptiv_dev_ppm_workstation':
    source        => 'daptiv/daptiv_dev_ppm_workstation'
  }
  boxen::project { 'chef-repo':
    source        => 'daptiv/chef-repo'
  }
}
