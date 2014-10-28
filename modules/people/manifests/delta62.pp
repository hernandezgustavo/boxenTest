class people::delta62 {
  $home = "/Users/${::boxen_user}"

  # Programs
  include firefox
  include chrome::canary
  include iterm2::dev
  include screen
  include apps::webstorm

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.

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
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/delta62/.bash_profile"
  }

  file { "${home}/.screenrc":
    ensure => link,
    target => "${boxen::config::repodir}/modules/people/files/delta62/.screenrc"
  }
}
