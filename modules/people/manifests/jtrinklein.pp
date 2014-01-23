class people::jtrinklein {
  include apps::fishShell

  include iterm2::dev

  include virtualbox

  $home = "/Users/${::boxen_user}"

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jtrinklein/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  git::config::global { 'user.email':
    value  => 'jtrinklein@daptiv.com'
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
  file { "${home}/.vimrc":
    ensure  => link,
    target  => "${home}/src/dotfiles/.vimrc"
  }

  #used to share editing at floobits.com
  include apps::sublime::floobits
  include apps::sublime::wombat_theme
  include apps::sublime::bracket_highlighter
  include apps::sublime::jsdocs
  include apps::sublime::grunt

}

