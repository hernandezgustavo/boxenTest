class daptiv::fishShell {
    # Install fish,set it as the default shell
  class { 'fish':
    chsh => true,
  }

  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${$boxen::config::repodir}/dotfiles"
  file { [ "${home}/.config/", "${home}/.config/fish/" ]:
      ensure => "directory",
  }
  file { "${home}/.config/fish/config.fish":
    ensure  => link,
    target  => "${dotfiles_dir}/config.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  file { "${home}/.config/fish/prompt.fish":
    ensure  => link,
    target  => "${dotfiles_dir}/prompt.fish",
    subscribe => File["${home}/.config/fish/"]
  }
}
