# Replace name of all the "sarudak" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::sarudak {
  $home = "/Users/${::boxen_user}"

include dropbox
include apps::googledrive
include chrome::canary
include iterm2::dev
include atom
include apps::atom_symlink

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/daptiv/files/vagrant/LICENSE-2.lic"
  }

  git::config::global { 'user.email':
    value  => 'sarudak@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'sarudak'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this sarudak profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/sarudak/.bash_profile"
  }
}
