class daptiv::environment::docker_machine_set {
  $home = "/Users/${::boxen_user}"

  # Link docker-machine-set.bash into user home
  file { "${home}/docker-machine-set.bash":
    ensure  => link,
    target  => "${dotfiles_dir}/docker-machine-set.bash"
  }

  # Ensure that docker-machine-set.bash is loaded when you execute any bash shell
  file_line { 'docker_machine_set_file':
    path => "${home}/.bashrc",
    line => 'source ~./docker-machine-set.bash'
  }
}
