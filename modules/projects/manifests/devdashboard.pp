class projects::devdashboard {
  include boxen::config
  boxen::project { 'devdashboard':
    mongodb       => true,
    nginx         => "${boxen::config::repodir}/modules/projects/files/devdashboard.nginx.conf.erb",
    source        => 'daptiv/DevDashboard'
  }
}
