# Replace name of all the "creg" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::creg {
  $home = "/Users/${::boxen_user}"

  include apps::googledrive
  include chrome::canary
  include iterm2::dev
  include atom
  include apps::atom_symlink
  include flux
  include dropbox
  include spectacle
  include projects::projecttaskboard

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Update the path below to point to the license that has your name associated with it at and uncomment this section.
  # Licenses are found at https://sites.google.com/a/daptiv.com/portal/Daptiv-Engineering-Wiki/tools-utlities#TOC-Vagrant-VMWare-7-Provider-
  #vagrant::plugin { 'vagrant-vmware-fusion':
  license => "${$boxen::config::repodir}/modules/people/files/creg/LICENSE-1-vagrant-vmware-provider-license_21_seats.lic"
  #}

  git::config::global { 'user.email':
    value  => 'creg.bradley@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'creg'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this creg profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/creg/.bash_profile"
  }
}
