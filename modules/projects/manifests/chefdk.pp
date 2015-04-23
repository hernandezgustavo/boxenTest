class projects::chefdk {
  $home = "/Users/${::boxen_user}"
  
  include ::chefdk

  file { [ "${home}/.chef/"]:
    ensure => "directory",
  }

  file { "${home}/.chef/knife.rb":
    ensure  => present,
    source  => "${$boxen::config::repodir}/modules/daptiv/files/chefdk/knife.rb"
  }

  boxen::project { 'daptiv_site':
    source => 'git@github.com:daptiv/daptiv_site'
  }

  boxen::project { 'daptiv_environment':
    source => 'git@github.com:daptiv/daptiv_environment'
  }

  boxen::project { 'daptiv_aspnetserver':
    source => 'git@github.com:daptiv/daptiv_aspnetserver'
  }

  boxen::project { 'daptiv_ppm':
    source => 'git@github.com:daptiv/daptiv_ppm'
  }

  boxen::project { 'daptiv_sso':
    source => 'git@github.com:daptiv/daptiv_sso'
  }

  boxen::project { 'daptiv_api':
    source => 'git@github.com:daptiv/daptiv_api'
  }

  boxen::project { 'daptiv_cognos10api':
    source => 'git@github.com:daptiv/daptiv_cognos10api'
  }

  boxen::project { 'daptiv_admintool':
    source => 'git@github.com:daptiv/daptiv_admintool'
  }

  boxen::project { 'daptiv_deskdocs':
    source => 'git@github.com:daptiv/daptiv_deskdocs'
  }

  boxen::project { 'daptiv_buildagent_ppm_role':
    source => 'git@github.com:daptiv/daptiv_buildagent_ppm_role'
  }

  boxen::project { 'daptiv_dev_ppm_role':
    source => 'git@github.com:daptiv/daptiv_dev_ppm_role'
  }

  boxen::project { 'daptiv_test_ppm_role':
    source => 'git@github.com:daptiv/daptiv_test_ppm_role'
  }

  boxen::project { 'daptiv_buildagent_windows_role':
    source => 'git@github.com:daptiv/daptiv_buildagent_windows_role'
  }

  boxen::project { 'daptiv_buildagent_chef_role':
    source => 'git@github.com:daptiv/daptiv_buildagent_chef_role'
  }

  boxen::project { 'daptiv_buildagent_ppmspa_role':
    source => 'git@github.com:daptiv/daptiv_buildagent_ppmspa_role'
  }

  boxen::project { 'daptiv_elasticsearch_role':
    source => 'git@github.com:daptiv/daptiv_elasticsearch_role'
  }

  boxen::project { 'daptiv_nginx_ppm_proxy':
    source => 'git@github.com:daptiv/daptiv_nginx_ppm_proxy'
  }

  boxen::project { 'daptiv_data_seeding':
    source => 'git@github.com:daptiv/daptiv_data_seeding'
  }

  boxen::project { 'daptiv_ppm_build':
    source => 'git@github.com:daptiv/daptiv_ppm_build'
  }

  boxen::project { 'daptiv_github':
    source => 'git@github.com:daptiv/daptiv_github'
  }

  boxen::project { 'daptiv_java':
    source => 'git@github.com:daptiv/daptiv_java'
  }

  boxen::project { 'daptiv_nodejs':
    source => 'git@github.com:daptiv/daptiv_nodejs'
  }

  boxen::project { 'daptiv_membase':
    source => 'git@github.com:daptiv/daptiv_membase'
  }

  boxen::project { 'daptiv_sql_server':
    source => 'git@github.com:daptiv/daptiv_sql_server'
  }

  boxen::project { 'daptiv_teamcity':
    source => 'git@github.com:daptiv/daptiv_teamcity'
  }

  boxen::project { 'dotnetframework':
    source => 'git@github.com:daptiv/dotnetframework'
  }

  boxen::project { 'daptiv_cookbook_template':
    source => 'git@github.com:daptiv/daptiv_cookbook_template'
  }

  boxen::project { 'daptiv-windows-boxes':
    source => 'git@github.com:daptiv/daptiv-windows-boxes'
  }

  boxen::project { 'daptiv-linux-boxes':
    source => 'git@github.com:daptiv/daptiv-linux-boxes'
  }
}
