# Replace name of all the "cliffburger.pp" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::cliffburger {

  #add projects chefclient, ppm, ppmspa and dev dashboard
  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'cliffburger@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Cliff Burger'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this cliffburger profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/cliffburger/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/cliffburger/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/cliffburger/git-prompt.sh"
  }

  file { "${home}/.vimrc":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/cliffburger/.vimrc"
  }
  #
  package { 'wget':
    ensure => present
  }
}
