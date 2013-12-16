# Replace name of all the "sweitzel74" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::sweitzel74 {

  #add projects chefclient, ppm, ppmspa and dev dashboard
  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'sweitzel74@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Default Person'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this sweitzel74 profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/sweitzel74/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/sweitzel74/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/sweitzel74/git-prompt.sh"
  }
}
