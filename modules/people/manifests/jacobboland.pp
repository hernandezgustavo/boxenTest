# Replace name of all the "default" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::jacobboland {
  include apps::fishShell
  include apps::sublime

  include chrome::canary

  include iterm2::dev

  #add projects chefclient, ppm, ppmspa and dev dashboard
  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'jboland@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Jacob Boland'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this default profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jacobboland/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/jacobboland/.bash_profile"
  }

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/shared/git-prompt.sh"
  }

#used to share editing at floobits.com
  sublime_text_3::package { 'Floobits':
    source => 'Floobits/floobits-sublime'
  }
  sublime_text_3::package { 'BracketHighlighter':
    source => 'facelessuser/BracketHighlighter'
  }
  sublime_text_3::package { 'sublime-jsdocs':
    source => 'spadgos/sublime-jsdocs'
  }
}
