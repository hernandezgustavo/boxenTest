class people::park9140 {
  include daptiv::fishShell
  include daptiv::sublime
  
  include projects::ppmspa
  include projects::devdashboard

  file { [ "${home}/.config/", "${home}/.config/fish/" ]:
      ensure => "directory",
  }

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/park9140/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  git::config::global { 'user.email':
    value  => 'jpark@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Jonathan Park'
  }


  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/git-prompt.sh"
  }
}
