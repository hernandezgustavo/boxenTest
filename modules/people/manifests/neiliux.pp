# Replace name of all the "neiliux" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::neiliux {
  $home = "/Users/${::boxen_user}"

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/neiliux/VagrantVMWareFusionLicense_pliewsrisuk_nbreeden.lic"
  }

  git::config::global { 'user.email':
    value  => 'neil.breeden@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Neil Breeden III'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this neiliux profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/neiliux/.bash_profile"
  }
  
  file { "${home}/bin/e":
    ensure => link,
    target => "${$boxen::config::repodir}/modules/people/files/neiliux/bin/e"
  }
  
  file { "${home}/bin/np":
   ensure => link,
   target => "${boxen::config::repodir}/modules/people/files/neiliux/bin/np"
  }
  
  file { "${home}/.config/fish/personal.fish":
   ensure => link,
   target => "${boxen::config::repodir}/modules/people/files/neiliux/personal.fish",
   subscribe => File["${home}/.config/fish/"]
  }

  file { "${home}/Library/Preferences/com.googlecode.iterm2.plist":
   ensure => link,
   target => "${boxen::config::repodir}/modules/people/files/neiliux/com.googlecode.iterm2.plist",
   #subscribe => File["${home}/Library/Preferences/"]
  }

  #include java
  include firefox
  include iterm2::stable
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark
  include chrome::canary
  include apps::webstorm
  include atom
  # TODO: Need to figure out how to download from sourceforge or find a direct link to download package.
  #include apps::filezilla
  include apps::fishShell
}
