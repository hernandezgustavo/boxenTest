# Replace name of all the "sqlbob" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::sqlbob {

  $home = "/Users/${::boxen_user}"

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this sqlbob profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/sqlbob/.bash_profile"
  }

  include dropbox
  include apps::googledrive
  include apps::fishshell

  include apps::sublime
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme

  #class { 'intellij': edition => 'ultimate', version => '13.0.1' }

  include apps::nodejs::typescript_tools

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/sqlbob/VagrantVMWareFusionLicense_rglass_gmann.lic"
  }

  #git
  #---------------------------------------------------
  include apps::git::difftools::p4merge
  include apps::git::aliases
  include apps::git::completion
  include apps::git::prompt
  git::config::global { 'user.email':
    value  => 'robert.glass@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Bob Glass'
  }
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
