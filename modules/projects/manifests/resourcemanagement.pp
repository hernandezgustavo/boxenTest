class projects::resourcemanagement {
  include boxen::config

  host { 'devrm.daptiv.com':
    name    => 'devrm.daptiv.com',
    comment => 'routing for resourcemanagement',
    ip      => '127.0.0.1'
  }

  boxen::project { 'resourcemanagement':
    nginx  => "${boxen::config::repodir}/modules/projects/templates/resourcemanagement.api.nginx.conf.erb",
    source => 'git@github.com:daptiv/Daptiv.Services.ResourceManagement.git'
  }
}
