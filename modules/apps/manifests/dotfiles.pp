class apps::dotfiles {
  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${$boxen::config::repodir}/dotfiles"

  # Ensure that .bash_profile is loaded when you execute any bash shell
  file { "${home}/.bashrc":
    ensure  => link,
    target  => "${dotfiles_dir}/.bashrc"
  }
}
