# Replace name of all the "boskya" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::boskya {

  include iterm2::dev
  include zsh
  include chrome::canary
  include firefox
  include atom

  $home = "/Users/${::boxen_user}"

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/boskya/vagrant_vmware_license.lic"
  }

  # git
  include apps::git::difftools::p4merge

    git::config::global { 'user.email':
    value  => 'bosky.atlani@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'boskya'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this boskya profile is updated as they
  # are symlinked into your home directory.

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/boskya/.bash_profile"
  }

  repository{
    'oh my zsh':
      source   => 'git@github.com:robbyrussell/oh-my-zsh', #short hand for github repos
      provider => 'git',
      path => "${home}/.oh-my-zsh",
      force => true
  }
  
  # atom
  atom::package {'language-typescript' : }
  atom::package { 'linter-tslint' : }
  atom::package { 'linter' : }
}
