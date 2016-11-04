class projects::feature_flag () {
  include boxen::config

  host { 'feature-flag-api':
    name         => 'devflag.daptiv.com',
    comment      => 'dev feature flag routing',
    ip           => '127.0.0.1'
  }

  boxen::project { 'feature-flag-api':
    nginx => "${boxen::config::repodir}/modules/projects/templates/feature-flag-api.nginx.conf.erb",
    source => 'git@github.com:daptiv/feature-flag-api.git'
  }
}
