# Replace name of all the "drewburlingame" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::drewburlingame {
  $home = "/Users/${::boxen_user}"

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => '${$boxen::config::repodir}/modules/people/files/drewburlingame/LICENSE_FILENAME.lic'
  }

  include apps::git::aliases
  include apps::git::completion
  include apps::git::prompt
  git::config::global { 'user.email':
    value  => 'GITHUB_EMAIL'
  }
  git::config::global { 'user.name':
    value  => 'drewburlingame'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this drewburlingame profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/drewburlingame/.bash_profile"
  }
}
