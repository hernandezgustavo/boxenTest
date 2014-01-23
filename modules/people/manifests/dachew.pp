# Replace name of all the "dachew" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::dachew {
  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'dachew@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Default Person'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this dachew profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/dachew/.bash_profile"
  }

}
