# Replace name of all the "default" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::jreynolds_daptiv {
  include iterm2::dev
  include projects::ppm
  include projects::chefclient
  include projects::ppm
  include projects::ppmspa
  include projects::devdashboard

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'jreynolds@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Jared Reynolds'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this jreynolds_daptiv profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jreynolds_daptiv/.bash_profile"
  }

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/shared/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/shared/git-prompt.sh"
  }
}
