# Replace name of all the "drewburlingame" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::drewburlingame {

  $home = "/Users/${::boxen_user}"

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this drewburlingame profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/drewburlingame/.bash_profile"
  }

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/drewburlingame/VagrantVMWareFusionLicense_dburlingame_aschmitt.lic"
  }

  #trial
  #---------------------------------------------------
  #include textual
  #---------------------------------------------------

  include chrome::canary
  include dropbox
  include iterm2::dev
  include lastpass
  include royaltsx
  include tmux
  include zsh

  include apps::googledrive

  #class { 'intellij': edition => 'ultimate', version => '13.0.1' }

  nodejs::module { 'typescript-tools':
    node_version => 'v0.10',
    ensure => '0.2.2-1'
  }

  # install tree (awesome terminal tree command for viewing folder structure
  exec { "brew install tree":
  }

  #atom
  #---------------------------------------------------
  include atom

  #thanks for nothing park
  #repository{
  #  'my atom config':
  #  source   => 'git@github.com:park9140/atom-config', #short hand for github repos
  #  provider => 'git',
  #  path => "${home}/.atom",
  #  force => true
  #}
  #---------------------------------------------------

  #sublime
  #---------------------------------------------------
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

  #thanks park
  repository{
    'my sublime config':
    source   => 'git@github.com:park9140/sublimeconfig', #short hand for github repos
    provider => 'git',
    path => "${home}/sublimeconfig",
    force => true
  }
  #---------------------------------------------------

  #git
  #---------------------------------------------------
  include apps::git::difftools::p4merge
  include apps::git::aliases
  include apps::git::completion
  include apps::git::prompt
  git::config::global { 'user.email':
    value  => 'drewburlingame@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'drewburlingame'
  }
  #---------------------------------------------------

  #daptiv
  #---------------------------------------------------
  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard
  #---------------------------------------------------

  #osx
  #---------------------------------------------------
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

  include osx::dock::clear_dock
  include osx::dock::dim_hidden_apps
  include osx::dock::hide_indicator_lights
  #---------------------------------------------------
}
