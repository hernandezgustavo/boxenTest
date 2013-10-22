# Ensure that boxen environment is set up upon shell start
# /etc/profile is loaded by all login shell starts
class daptiv::environment::etc_profile {
  file { '/etc/profile':
    ensure => present
  } ->
  file_line { 'source_boxen':
    line => 'source /opt/boxen/env.sh',
    path => '/etc/profile',
  }
}
