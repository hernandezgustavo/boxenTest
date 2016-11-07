class projects::projecttaskboard () {
  include boxen::config
  include apps::nodejs

  host { 'project-task-board':
    name         => 'devptb.daptiv.com',
    comment      => 'routing for project task board client',
    ip           => '127.0.0.1'
  }

  host { 'project-task-board-api':
    name         => 'devptbapi.daptiv.com',
    comment      => 'routing for project task board api',
    ip           => '127.0.0.1'
  }

  boxen::project { 'project-task-board':
    nginx         => "${boxen::config::repodir}/modules/projects/templates/projecttaskboard.client.nginx.conf.erb",
    source        => 'git@github.com:daptiv/project-task-board.git'
  }

  boxen::project { 'project-task-board-api':
    nginx         => "${boxen::config::repodir}/modules/projects/templates/projecttaskboard.api.nginx.conf.erb",
    source        => 'git@github.com:daptiv/project-task-board-api.git'
  }
}
