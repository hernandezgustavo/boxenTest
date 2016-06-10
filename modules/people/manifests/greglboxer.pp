# Replace name of all the "greglboxer" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::greglboxer {
  $home = "/Users/${::boxen_user}"

  #vmware
  include vmware_fusion
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${boxen::config::repodir}/modules/people/files/greglboxer/LICENSE-2-vagrant-vmware-provider-license_20_seats.lic"
  }

  include iterm2::dev
  include chrome::canary
  include zsh

  git::config::global { 'user.email':
    value  => 'greg.boxer@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'greglboxer'
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/greglboxer/.bash_profile"
  }

  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/greglboxer/.zshrc"
  }

  repository{
    'oh my zsh':
      source   => 'git@github.com:robbyrussell/oh-my-zsh', #short hand for github repos
      provider => 'git',
      path => "${home}/.oh-my-zsh",
      force => true
  }

  repository{
    'my dotfiles':
      source   => 'git@github.com:olivierverdier/zsh-git-prompt', #better zsh git prompt
      provider => 'git',
      path => "${home}/.zsh/git-prompt",
      force => true
  }

  include apps::googledrive

  include apps::nodejs::typescript_tools

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
