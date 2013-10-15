require boxen::environment
require homebrew
require gcc

File {
  group => $boxen_group,
  owner => $boxen_user
}

Exec {
  group       => $boxen_group,
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}


Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  },
  protocol => "git"
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  #ensure that boxen environment is set up upon shell start
  #/etc/profile is loaded by all login shell starts
  file {
    '/etc/profile':
    ensure => present
  }

  file_line { 'source_boxen':
    line => 'source /opt/boxen/env.sh',
    path => '/etc/profile',
  }

  file_line { 'increase_ulimit':
    line => 'ulimit -n 3000',
    path => '/etc/profile',
  }

  file_line { 'localhost_daptiv_com':
    line => '127.0.0.1 localhost.daptiv.com',
    path => '/etc/hosts',
  }

  include daptiv::dotFiles
  include daptiv::git
  include daptiv::nodejs
  include daptiv::phantomjs
  include daptiv::rdp
  include daptiv::ruby

}
