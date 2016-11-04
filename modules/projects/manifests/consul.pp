class projects::consul () {
  include boxen::config

  host { 'consul':
    name         => 'devconsul.daptiv.com',
    comment      => 'dev consul routing',
    ip           => '127.0.0.1'
  }

  boxen::project { 'consul':
    nginx => "${boxen::config::repodir}/modules/projects/templates/consul.nginx.conf.erb"
  }
}
