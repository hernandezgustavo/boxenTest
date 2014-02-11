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

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/sweitzel74/VagrantVMWareFusionLicense_sweitzel_jpark.lic"
  }

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'sweitzel@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Shawn Weitzel'
  }

  #Creates a symlink to your personal dot file in the people/files dir
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/sweitzel74/.bash_profile"
  }

  #Create a symlink for starting Sublime Text from the terminal
  file { '/usr/local/bin/subl':
    ensure  => link,
    target  => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
  }

}