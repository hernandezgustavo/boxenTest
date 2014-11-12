# Replace name of all the "dizard2001" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::dizard2001 {
  $home = "/Users/${::boxen_user}"

  vagrant::plugin { 'vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/dizard2001/VagrantVMWareFusionLicense_danderson.lic"
  }

  git::config::global { 'user.email':
    value  => 'darrel.anderson@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'dizard2001'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this dizard2001 profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/dizard2001/.bash_profile"
  }
}
