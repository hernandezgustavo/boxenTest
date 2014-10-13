class people::delta62 {
  $home = "/Users/${::boxen_user}"

  include chrome::canary
  include iterm2::dev

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/delta62/VagrantVMWareFusionLicense_snoedel_jschnur.lic"
  }

  git::config::global { 'user.email':
    value  => 'sam@samnoedel.com'
  }
  git::config::global { 'user.name':
    value  => 'Sam Noedel'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this default profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/delta62/.bash_profile"
  }
}
