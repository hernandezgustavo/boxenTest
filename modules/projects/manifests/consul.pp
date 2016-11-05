class projects::consul () {
  include boxen::config
  include nginx::config
  include nginx

  host { 'consul':
    name         => 'devconsul.daptiv.com',
    comment      => 'dev consul routing',
    ip           => '127.0.0.1'
  }

  file { "${nginx::config::sitesdir}/${name}.conf":
    content => template("${boxen::config::repodir}/modules/projects/templates/consul.nginx.conf.erb"),
    require => File[$nginx::config::sitesdir],
    notify  => Service['dev.nginx'],
  }
}
