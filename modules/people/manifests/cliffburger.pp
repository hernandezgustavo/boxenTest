# Replace name of all the "cliffburger.pp" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::cliffburger {
  
  include java

  include adobe_reader

  include apps::fishShell
  include apps::googledrive
  include apps::webstorm
  include apps::git::difftools::p4merge

  include chrome::canary
  
  include dropbox
  include evernote
  include iterm2::dev

  include gitflow
  include rubymine
 
   include vmware_fusion
  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'cliffburger@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Cliff Burger'
  }

  $vmware_license = "${$boxen::config::repodir}/modules/people/files/${$::github_login}/VagrantVMWareFusionLicense.lic"

  #if you have a license file in your user dir install vmware-fusion vagrant plugin
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => $vmware_license
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

  file { "${home}/.vimrc":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/cliffburger/.vimrc"
  }
  
  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/cliffburger/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }
  #
  package { 'wget':
    ensure => present
  }
}
