class daptiv::dotFiles {
  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${$boxen::config::repodir}/dotfiles"

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${dotfiles_dir}/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${dotfiles_dir}/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${dotfiles_dir}/git-prompt.sh"
  }
}
