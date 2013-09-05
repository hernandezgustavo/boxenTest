class projects::ppm {
  include daptiv::vagrant

  boxen::project { 'daptiv_dev_ppm_workstation':
    source        => 'daptiv/daptiv_dev_ppm_workstation'
  }
  boxen::project { 'chef-repo':
    source        => 'daptiv/chef-repo'
  }
}
