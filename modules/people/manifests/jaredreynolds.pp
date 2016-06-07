class people::jaredreynolds {

  include apps::nodejs::pullquester
  include apps::sublime::bracket_highlighter
  include apps::sublime::markdown
  include apps::sublime::powershell
  include apps::sublime::puppet
  include apps::sublime::t-sql
  include apps::vagrant
  include apps::vmware_fusion
  include apps::webstorm
  include brewcask
  include firefox
  include flowdock
  include iterm2::dev
  include spectacle
  include trailer

  $home = "/Users/${::boxen_user}"
  $boxenFiles = "${boxen::config::repodir}/modules/people/files/${boxen::config::login}"

  package { 'evernote': provider => 'brewcask' }

  #TODO: figure out how to install packages with root access
  #package { 'paragon-ntfs': provider => 'brewcask' }


  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'jared.reynolds@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Jared Reynolds'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this default profile is updated as they
  #are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${boxenFiles}/.bash_profile"
  }

  file { "${home}/Library/KeyBindings/":
    ensure => directory
  }
  file { "${home}/Library/KeyBindings/DefaultKeyBinding.dict":
    ensure  => file,
    source  => "${boxenFiles}/DefaultKeyBinding.dict",
    require => File["${home}/Library/KeyBindings/"]
  }

  file { "${boxen::config::bindir}/edit":
    ensure => link,
    target => "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl",
    require => Class['apps::sublime']
  }
}
