class people::foresterh {
  include apps::fishShell
  include iterm2::dev
  include zsh
  include firefox

  $home = "/Users/${::boxen_user}"

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/foresterh/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/foresterh/VagrantVMWareFusionLicense_foresterh_stevehayes.lic"
  }

  git::config::global { 'user.email':
    value  => 'foresterh@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'Jamie Houston'
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/foresterh/.bash_profile"
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
    target  => "${$boxen::config::repodir}/modules/people/files/foresterh/zshrc"
  }

}
