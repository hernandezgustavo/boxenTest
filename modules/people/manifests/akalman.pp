class people::akalman {
  $home = "/Users/${::boxen_user}"

  #browsers
  include chrome
  include firefox

  #ides
  include apps::webstorm
  include atom

  #communication
  include flowdock

  #utilities
  include spectacle
  include trailer

  #git
  git::config::global { 'user.email': value => 'akalman@daptiv.com' }
  git::config::global { 'user.name': value => 'Adam Kalman' }

  #vmware
  include vmware_fusion
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${boxen::config::repodir}/modules/people/files/akalman/LICENSE-2-vagrant-vmware-provider-license_20_seats.lic"
  }

  #terminal
  include iterm2::dev
  include apps::fishshell
  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${boxen::config::repodir}/modules/people/files/akalman/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${boxen::config::repodir}/modules/people/files/akalman/.bash_profile"
  }

  #nodejs
  include apps::nodejs::typescript_tools
  include apps::nodejs::pullquester
}
