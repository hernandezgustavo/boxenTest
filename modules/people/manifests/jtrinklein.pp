class people::jtrinklein {
  $home = "/Users/${::boxen_user}"

  include iterm2::dev
  #include virtualbox
  include homebrewcask
  include chrome::canary
  include zsh

  $vmware_license = "${$boxen::config::repodir}/modules/people/files/${$::github_login}/VagrantVMWareFusionLicense.lic"

  git::config::global { 'user.email':
    value  => 'james.trinklein@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'James Trinklein'
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jtrinklein/.bash_profile"
  }


  repository{
    'my dotfiles':
      source   => 'git@github.com:jtrinklein/dotfiles', #short hand for github repos
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

  file { "${home}/.vimrc":
    ensure  => link,
    target  => "${home}/src/dotfiles/.vimrc"
  }

  #used to share editing at floobits.com

  include apps::nodejs::typescript_tools
}
