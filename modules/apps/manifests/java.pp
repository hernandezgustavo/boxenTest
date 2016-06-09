class apps::java {
  include brewcask

  $pkgInstaller = '/usr/sbin/installer'

  # HACK: The following two resources can be removed once the augeas sudoers lens is fixed
  file { '/usr/local/share/augeas/lenses/dist/sudoers.aug':
    ensure => present,
  }->
  file_line { 'Hack sudoers lens':
    path    => '/usr/local/share/augeas/lenses/dist/sudoers.aug',  
    line    => '   in let non_alias = /(!?[\/a-z]([^,:#()\n]|\\\\[=:,\\])*[^,=:#() \t\n\\])|[^,=:#() \t\n\\]/',
    match   => '^\s.*in let non_alias ='
  }->
  augeas { 'allow sudo install of java without pwd':
    context => '/files/etc/sudoers',
    changes => [
      "rm spec[user = '$::boxen_user'][host_group/command = '$pkgInstaller']",
      "set spec[last() +1]/user '$::boxen_user'",
      "set spec[last()]/host_group/host 'ALL'",
      "set spec[last()]/host_group/command '$pkgInstaller'",
      "set spec[last()]/host_group/command/runas_user 'ALL'",
      "set spec[last()]/host_group/command/tag[1] 'NOPASSWD'",
      "set spec[last()]/host_group/command/tag[2] 'SETENV'"
    ]
  } ->
  package { 'java':
    ensure   => installed,
    provider => 'brewcask'
  } ->
  augeas { 'remove allow sudo install of java without pwd':
    context => '/files/etc/sudoers',
    changes => [
      "rm spec[user = '$::boxen_user'][host_group/command = '$pkgInstaller']"
    ]
  }
}
