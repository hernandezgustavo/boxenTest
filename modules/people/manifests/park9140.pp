
class people::park9140 {
  $vmware_key = "EJ695-2QH8J-H8K7C-0Z1R0-88LJ4"
  include apps::fishshell

  include chrome::canary

  include firefox

  include iterm2::dev

  include gitflow
  include flowdock
  include homebrewcask
  include bettertouchtool
  include heroku

  $vmware_license = "${$boxen::config::repodir}/modules/people/files/${$::github_login}/vagrant_vmware_license.lic"

  #if you have a license file in your user dir install vmware-fusion vagrant plugin
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => $vmware_license
  }

  $home = "/Users/${::boxen_user}"

  # License VMWare Fusion
  exec { "license_vmware_fusion":
    command=> "vmware-licenseTool enter ${vmware_key} '' '' '7.1.2' 'VMware Fusion for Mac OS' ''",
    path => '/Applications/VMware Fusion.app/Contents/Library/licenses',
    user => root,
    refreshonly => true,
    subscribe => Package['VMware Fusion']
  }

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  git::config::global { 'user.email':
    value  => 'jonathan.park@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Jonathan Park'
  }
  git::config::global { 'core.editor':
    value  => 'vi'
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/.bash_profile"
  }

  include atom

}
