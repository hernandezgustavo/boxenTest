class projects::devdashboard {
  include boxen::config
  include apps::nodejs
  include apps::phantomjs

  boxen::project { 'DevDashboard':
    mongodb       => true,
    nginx         => "${boxen::config::repodir}/modules/projects/templates/devdashboard.nginx.conf.erb",
    source        => 'git@github.com:daptiv/DevDashboard'
  }
}
