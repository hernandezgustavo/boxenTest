class projects::teammember () {
  include boxen::config
  include apps::nodejs
  include apps::phantomjs
  include projects::consul
  include projects::featureflag

  host { 'teammember-client':
    name         => 'devttm.daptiv.com',
    comment      => 'routing for teammember client',
    ip           => '127.0.0.1'
  }

  host { 'teammember-api':
    name         => 'devttmapi.daptiv.com',
    comment      => 'routing for teammember api',
    ip           => '127.0.0.1'
  }

  boxen::project { 'teammember-client':
    nginx         => "${boxen::config::repodir}/modules/projects/templates/teammember.client.nginx.conf.erb",
    source        => 'git@github.com:daptiv/teammember-client.git'
  }

  boxen::project { 'teammember-api':
    nginx         => "${boxen::config::repodir}/modules/projects/templates/teammember.api.nginx.conf.erb",
    source        => 'git@github.com:daptiv/teammember-api.git'
  }
}
