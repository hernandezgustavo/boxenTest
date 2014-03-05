# Replace name of all the "SQLBob" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::SQLBob {
<<<<<<< HEAD
  $home = "/Users/${::boxen_user}"

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.
  #vagrant::plugin { 'vagrant-vmware-fusion':
  #  license => '${$boxen::config::repodir}/modules/people/files/SQLBob/LICENSE_FILENAME.lic'
  #}

  git::config::global { 'user.email':
    value  => 'GITHUB_EMAIL'
  }
  git::config::global { 'user.name':
    value  => 'SQLBob'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this SQLBob profile is updated as they
  # are symlinked into your home directory.
=======

  #add projects chefclient, ppm, ppmspa and dev dashboard
  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'SQLBob@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Default Person'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this SQLBob profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
>>>>>>> 5bd84e048496a28454162e71f066727b55e21df6
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/SQLBob/.bash_profile"
  }
<<<<<<< HEAD
=======

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/SQLBob/git-completion.sh"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/SQLBob/git-prompt.sh"
  }
>>>>>>> 5bd84e048496a28454162e71f066727b55e21df6
}
