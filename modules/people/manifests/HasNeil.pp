# Replace name of all the "HasNeil" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::hasneil {
  $home = "/Users/${::boxen_user}"

  # Requires vagrant to install plugins:
  include vagrant

  # Using Heath Snow awesome apps list:
  include gitflow
  include flowdock
  include diffmerge
  #include atom

  # Manually to do this outside of boxen = brew install caskroom/cask/brew-cask = brew install cask
  # This works with on tty or with sudo password prompt:
  #include homebrewcask

  #include chefdk
  include bettertouchtool
  include rubymine
  include virtualbox
  include royaltsx


  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.
  #vagrant::plugin { 'vagrant-vmware-fusion':
  #  license => "${$boxen::config::repodir}/modules/people/files/HasNeil/LICENSE_FILENAME.lic"
  #}

  git::config::global { 'user.email':
    value  => 'neil.stelzer@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'HasNeil'
  }
  git::config::global { 'diff.tool':
    value  => 'diffmerge'
  }


  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this HasNeil profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.BOXEN_bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/HasNeil/.bash_profile"
  }
  file { "${home}/.chef":
    ensure  => directory
  }
  ###file { "${home}/.chef/knife.rb":
  ###  ensure  => "present",
  ###  source  => "${$boxen::config::repodir}/modules/people/files/HasNeil/knife.rb"
  ###}
  # install tree (awesome terminal tree command for viewing folder structure
  exec { "brew install tree":
  }
  # install travis lint tool for travis ci things
  exec { "gem install travis-lint":
  }
  #### install knife-vsphere plugin
  ###exec { "chef gem install knife-vsphere":
  ###}
  # install mercurial
  exec { "brew install mercurial":
  }
  exec { "vagrant plugin install vagrant-chefconfig":
  }
}
