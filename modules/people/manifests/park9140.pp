class people::park9140 {
  include daptiv::fishShell

  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${$boxen::config::repodir}/dotfiles"

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${dotfiles_dir}/park9140/personal.fish"
  }

  git::config::global { 'user.email':
    value  => 'jpark@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Jonathan Park'
  }
}
