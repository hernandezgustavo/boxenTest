class projects::ppmspa {
  include boxen::config
  boxen::project { 'ppmspa':
    nginx         => "${boxen::config::repodir}/modules/projects/files/ppmspa.nginx.conf.erb",
    source        => 'daptiv/PpmSpa'
  }
}
