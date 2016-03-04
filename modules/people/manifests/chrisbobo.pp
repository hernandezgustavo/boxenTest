class people::chrisbobo {
  $home = "/Users/${::boxen_user}"

  include dropbox
  include apps::googledrive
  include chrome::canary
  include apps::webstorm
  include iterm2::dev
  include zsh
  include apps::atom_symlink

  vagrant::plugin { 'vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/chrisbobo/LICENSE-2-vagrant-vmware-provider-license_20_seats.lic"
  }

  git::config::global { 'user.email':
    value  => 'chrisbobo@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'Chris Bobo'
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/chrisbobo/.bash_profile"
  }

  repository{
    'my sublime config':
      source   => 'git@github.com:chrisbobo/sublimeconfig', #short hand for github repos
      provider => 'git',
      path => "${home}/sublimeconfig",
      force => true
  }
  include apps::sublime::ensure_settings_links_exist
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme

  repository{
    'my dotfiles':
      source   => 'git@github.com:chrisbobo/dotfiles', #short hand for github repos
      provider => 'git',
      path => "${home}/src/dotfiles",
      force => true
  }

  repository{
    'my git prompt':
      source   => 'git@github.com:olivierverdier/zsh-git-prompt', #better zsh git prompt
      provider => 'git',
      path => "${home}/.zsh/git-prompt",
      force => true
  }

  repository{
    'oh my zsh':
      source   => 'git@github.com:robbyrussell/oh-my-zsh', #short hand for github repos
      provider => 'git',
      path => "${home}/.oh-my-zsh",
      force => true
  }

  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${home}/src/dotfiles/.zshrc"
  }


  #------------------------
  # Osx Customizations
  #------------------------
  include osx::dock::clear_dock
  include osx::disable_app_quarantine

  include osx::finder::show_all_on_desktop
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library


}
