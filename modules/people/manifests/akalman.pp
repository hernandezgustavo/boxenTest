class people::akalman {
  $home = "/Users/${::boxen_user}"

  #browsers
  include chrome
  include chrome::canary
  include firefox

  #ides
  include apps::webstorm
  include apps::sublime
  include atom

  #sublime config
  include apps::sublime::ensure_settings_links_exist
  include apps::sublime::wombat_theme
  include apps::sublime::bracket_highlighter
  include apps::sublime::jsdocs
  include apps::sublime::grunt

  #communication
  include flowdock
  #include lync
  include adium

  #utilities
  include spectacle
  include apps::git::difftools::p4merge

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
  include apps::fishShell
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
