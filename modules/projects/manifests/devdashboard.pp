class projects::devdashboard {
  include boxen::config
  include daptiv::nodejs
  include daptiv::phantomjs

  boxen::project { 'DevDashboard':
    mongodb       => true,
    nginx         => "${boxen::config::repodir}/modules/projects/templates/devdashboard.nginx.conf.erb",
    source        => 'git@github.com:daptiv/DevDashboard'
  }
}
