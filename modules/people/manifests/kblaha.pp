class people::kblaha {

  include apps::fishShell
  include iterm2::dev

  include apps::sublime

  #add projects chefclient, ppm, ppmspa and dev dashboard
  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'kblaha@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Karel Blaha'
  }

  $home = "/Users/${::boxen_user}"

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/kblaha/.bash_profile"
  }


}
