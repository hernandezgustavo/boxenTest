class projects::ppmspa {
  include boxen::config
  boxen::project { 'PpmSpa':
    nginx         => "${boxen::config::repodir}/modules/projects/files/ppmspa.nginx.conf.erb",
    source        => 'daptiv/PpmSpa'
  }
}
