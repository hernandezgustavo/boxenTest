# Replace name of all the "devopsdevine" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::devopsdevine {
  $home = "/Users/${::boxen_user}"

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.
  #vagrant::plugin { 'vagrant-vmware-fusion':
  #  license => '${$boxen::config::repodir}/modules/people/files/devopsdevine/LICENSE_FILENAME.lic'
  #}

  git::config::global { 'user.email':
    value  => 'devopsdevine@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'devopsdevine'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this devopsdevine profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/devopsdevine/.bash_profile"
  }
}
