class projects::teammember () {
  include boxen::config
  include apps::nodejs
  include apps::phantomjs

  host { 'teammember-client':
    name         => 'tm.daptiv.com',
    comment      => 'routing for teammember client',
    ip           => '127.0.0.1'
  }

  host { 'teammember-api':
    name         => 'tm-api.daptiv.com',
    comment      => 'routing for teammember api',
    ip           => '127.0.0.1'
  }

  boxen::project { 'TeamMemberClient':
    nginx         => "${boxen::config::repodir}/modules/projects/templates/teammember.client.nginx.conf.erb",
    source        => 'git@github.com:daptiv/teammember-client.git'
  }

  boxen::project { 'TeamMemberApi':
    nginx         => "${boxen::config::repodir}/modules/projects/templates/teammember.api.nginx.conf.erb",
    source        => 'git@github.com:daptiv/teammember-api.git'
  }
}
