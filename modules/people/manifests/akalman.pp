class people::akalman {

  include daptiv::fishShell
  include daptiv::sublime
  include daptiv::rdp

  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard

  file { [ "${home}/.config/", "${home}/.config/fish/" ]:
    ensure => "directory",
  }

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/akalman/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }
  
  git::config::global { 'user.email':
    value  => 'akalman@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'akalman'
  }

  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/akalman/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/akalman/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/akalman/git-prompt.sh"
  }
}
