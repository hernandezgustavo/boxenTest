class people::johnsontroye1 {
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

  #git
  git::config::global { 'user.email': value => 'troy.johnson@changepoint.com' }
  git::config::global { 'user.name': value => 'Troy Johnson' }

  #vmware
  include vmware_fusion
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${boxen::config::repodir}/modules/people/files/johnsontroye1/LICENSE-2-vagrant-vmware-provider-license_20_seats.lic"
  }

  #terminal
  include iterm2::dev
  include apps::fishshell
  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${boxen::config::repodir}/modules/people/files/johnsontroye1/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${boxen::config::repodir}/modules/people/files/johnsontroye1/.bash_profile"
  }

  #nodejs
  include apps::nodejs::typescript_tools
  include apps::nodejs::pullquester
}
