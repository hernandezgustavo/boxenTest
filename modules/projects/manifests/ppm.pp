class projects::ppm {
  include projects::chefclient
  include apps::vagrant

  file_line { 'ppm_hosts':
    line => '192.168.56.101 devppm.daptiv.com devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com',
    path => '/etc/hosts'
  }

  boxen::project { 'chef-repo':
    source        => 'git@github.com:daptiv/chef-repo'
  }
}
