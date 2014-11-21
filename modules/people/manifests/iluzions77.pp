class people::iluzions77 {

#-------------VmWare License------------------------

#Dont forget to copy license key into my people file directory first--
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/iluzions77/VagrantVMWareFusionLicense_snoedel_jschnur.lic"
}
#-------------End VmWare License------------------------

  include gcc
  include chrome::canary
  include firefox
  include dropbox
  include apps::googledrive
  include gitflow
  include flowdock
  include homebrew
  include homebrewcask
  include iterm2::dev
  include apps::fishShell
  include zsh
  include evernote
  
  # include spotify
  # include caffeine
  # include skitch
  # include webstorm
  # include kindle
  # include lync

#-------------Git Setup---------------------------------

  git::config::global { 'user.email':
    value  => 'jonathan.schnur@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Jonathan Schnur'
  }

#-------------End-Git-Setup---------------------------------

  
  #--------------sublime------------------------------
  include apps::sublime::ensure_settings_links_exist
  include apps::sublime::wombat_theme
  include apps::sublime::bracket_highlighter
  include apps::sublime::jsdocs
  include apps::sublime::grunt
  include apps::sublime::git
  include apps::sublime::history
  include apps::sublime::markdown
  include apps::sublime::fileautocomplete
  include apps::sublime::sidebar
  include sublime_text_3::package_control

  sublime_text_3::package { 'OmniSharpSublimePlugin':
    source => 'git@github.com:PaulCampbell/OmniSharpSublimePlugin.git'
  }
  #--------------end-sublime------------------------------


  #--------------OSX-Settings------------------------------
  #--------------end-OSX-Settings------------------------

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this iluzions77 profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/iluzions77/.bash_profile"
  }
}
