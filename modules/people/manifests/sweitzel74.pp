# Replace name of all the "sweitzel74" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::sweitzel74 {
  
  #add apps
  include apps::git::difftools::p4merge
  include graphviz
  include iterm2::dev
  include java
  include mercurial
  include sourcetree
  include virtualbox
  include vmware_fusion

  #OSX Config
  include osx::finder::show_hidden_files

  $home = "/Users/${::boxen_user}"
  $vmware_key = "4J08Q-0R055-M8Q76-0J0U4-85P64"

    # License VMWare Fusion  
  exec { "license_vmware_fusion":
    command => "vmware-licenseTool enter ${vmware_key} '' '' '7.0' 'VMware Fusion for Mac OS' ''",
    path => '/Applications/VMware Fusion.app/Contents/Library/licenses',
    user => root,
    refreshonly => true,
    subscribe => Package['VMware Fusion']
  }

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/sweitzel74/LICENSE-2-vagrant-vmware-provider-license_20_seats.lic"
  }

  #add personal git configurations
  git::config::global { 'user.email':
    value => 'shawn.weitzel@changepoint.com'
  }
  git::config::global { 'user.name':
    value => 'Shawn Weitzel'
  }

  #Creates a symlink to your personal dot file in the people/files dir
  file { "${home}/.bash_profile":
    ensure => link,
    target => "${$boxen::config::repodir}/modules/people/files/sweitzel74/.bash_profile"
  }

  file { "${home}/.bashrc":
    ensure => link,
    target => "${$boxen::config::repodir}/modules/people/files/sweitzel74/.bashrc"
  }

  #Create a symlink for starting Sublime Text from the terminal
  file { '/usr/local/bin/subl':
    ensure => link,
    target => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
  }

  #Install and use newer Ruby
  ruby::version { '2.1.2': }

}