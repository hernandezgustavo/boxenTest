# Replace name of all the "ebonphoenix" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::ebonphoenix {
  #add apps
  include java
  
  include gitx::dev
  include iterm2::dev
  
  include apps::webstorm
  include apps::git::difftools::p4merge

  $home = "/Users/${::boxen_user}"

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/ebonphoenix/VagrantVMWareFusionLicense_cbradley_svacher.lic"
  }

  git::config::global { 'user.email':
    value  => 'svacher@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'ebonphoenix'
  }

  
  include apps::sublime::ensure_settings_links_exist
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme
  
  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this ebonphoenix profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/ebonphoenix/.bash_profile"
  }
}
