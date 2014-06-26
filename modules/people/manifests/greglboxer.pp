# Replace name of all the "greglboxer" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::greglboxer {
  $home = "/Users/${::boxen_user}"

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/greglboxer/VagrantVMWareFusionLicense_gboxer.lic"
  }

  include iterm2::dev
  include chrome::canary
  include zsh
  
  git::config::global { 'user.email':
    value  => 'gboxer@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'greglboxer'
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/greglboxer/.bash_profile"
  }
  
  repository{
    'oh my zsh':
      source   => 'git@github.com:robbyrussell/oh-my-zsh', #short hand for github repos
      provider => 'git',
      path => "${home}/.oh-my-zsh",
      force => true
  }
  
  include apps::googledrive

  include apps::sublime
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme
  include apps::sublime::jsdocs
  include apps::sublime::grunt
  include apps::sublime::git
  include apps::sublime::history
  include apps::sublime::markdown
  include apps::sublime::fileautocomplete
  include apps::sublime::sidebar
  include sublime_text_3::package_control

  nodejs::module { 'typescript-tools':
    node_version => 'v0.10',
    ensure => '0.2.2-1'
  }
  
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

  include osx::dock::dim_hidden_apps
  #---------------------------------------------------
}
