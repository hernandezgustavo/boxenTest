class people::delta62 {
  $home = "/Users/${::boxen_user}"

  # Programs
  include firefox
  include iterm2::dev

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/delta62/VagrantVMWareFusionLicense_snoedel_jschnur.lic"
  }

  git::config::global { 'user.email':
    value  => 'sam.noedel@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Sam Noedel'
  }

  # Dotfiles
  file { "${home/.git-completion.sh":
    ensure => link,
    target => "${boxen::config::repodir}/modules/people/files/shared/git-completion.sh"
  }

  file { "${home/.git-prompt.sh":
    ensure => link,
    target => "${boxen::config::repodir}/modules/people/files/shared/git-prompt.sh"
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/delta62/.bash_profile"
  }

  file { "${home}/.fzf.bash":
    ensure => link,
    target => "${boxen::config::repodir}/modules/people/files/delta62/.fzf.bash"
  }

  file { "${home}/.vimrc":
    ensure => link,
    target => "${boxen::config::repodir}/modules/people/files/delta62/.vimrc"
  }

  file { "${home}/.tmux.conf": {
    ensure => link,
    target => "${boxen::config::repodir}/modules/people/files/delta62/.tmux.conf"
  }

  include osx::no_network_dsstores
  include osx::finder::unhide_library
}
