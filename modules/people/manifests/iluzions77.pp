class people::iluzions77 {

  include apps::googledrive
  include apps::fishShell
  include apps::webstorm
  include caffeine
  include chrome::canary
  include dropbox
  include evernote
  include firefox
  include flowdock
  include gitflow
  include homebrewcask
  include iterm2::dev
  include kindle
  include skitch
  include spotify
  include zsh
  # include lync
#-------------VmWare License------------------------
#--Dont forget to copy license key into my people file directory first--
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/iluzions77/VagrantVMWareFusionLicense_snoedel_jschnur.lic"
}
#-------------End VmWare License------------------------
#-------------Git Setup---------------------------------
  include apps::git::difftools::p4merge
  include apps::git::aliases
  include apps::git::completion
  include apps::git::prompt

  git::config::global { 'user.email':
    value  => 'jonathan.schnur@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Jonathan Schnur'
  }
#-------------End-Git-Setup------------------------------
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
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  #include osx::keyboard::use_standard_function_keys
  include osx::finder::show_all_on_desktop
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library
  include osx::finder::enable_quicklook_text_selection
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
