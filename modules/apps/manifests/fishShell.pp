class apps::fishShell {
  # Install fish set it as the default shell
  class { 'fish':
    chsh => true,
  }

  include daptiv::dotFiles

  $home = "/Users/${::boxen_user}"

  file { [ "${home}/.config/", "${home}/.config/fish/" ]:
      ensure => "directory",
  }

  file { "${home}/.config/fish/config.fish":
    ensure  => link,
    target  => "${daptiv::dotFiles::dotfiles_dir}/config.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  file { "${home}/.config/fish/prompt.fish":
    ensure  => link,
    target  => "${daptiv::dotFiles::dotfiles_dir}/prompt.fish",
    subscribe => File["${home}/.config/fish/"]
  }
}
