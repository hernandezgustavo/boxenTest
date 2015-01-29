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
    license => "${$boxen::config::repodir}/modules/people/files/akalman/VagrantVMWareFusionLicense_dvanbuskirk_akalman.lic"
  }

  #terminal
  include iterm2::dev
  include apps::fishShell
  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/akalman/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/akalman/.bash_profile"
  }

  #hosts update
  file_line { 'ppm_hosts_ppmspa_remove':
    line => '192.168.56.101 devsso.daptiv.com devapi.daptiv.com devadminapi.daptiv.com devsso.daptiv.com localvm.daptiv.com',
    path => '/etc/hosts',
    subscribe => File_Line['ppm_hosts_ppmspa']
  }

  #npmrc update
  file_line { 'npm_publish_settings':
    path => "${home}/.npmrc",
    line =>
'
_auth = YWthbG1hbjp7REVTZWRlfWVUN2ZKWExqbzVpaCtNc0Nqd2NWdUE9PQ==
always-auth = true
email = akalman@daptiv.com
'
  }

  #nodejs
  nodejs::module { 'typescript-tools':
    node_version => 'v0.10',
    ensure => '0.2.2-1'
  }
}
