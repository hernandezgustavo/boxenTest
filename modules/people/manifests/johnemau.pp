class people::johnemau {
  include daptiv::fishShell
  include daptiv::sublime
  include daptiv::rdp

  include projects::ppm
  include projects::ppmspa
  include projects::devdashboard

  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${$boxen::config::repodir}/dotfiles"

  git::config::global { 'user.email':
    value  => 'jemau@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'John Emau'
  }
}
