# Replace name of all the "default" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::jacobboland {
  include apps::fishShell

  include chrome::canary
  include firefox

  include iterm2::stable


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

  include apps::sublime::ensure_settings_links_exist
  include apps::sublime::bracket_highlighter
  include apps::sublime::jsdocs
  include apps::sublime::grunt
  include apps::sublime::git
  include apps::sublime::history
  include apps::sublime::markdown
  include apps::sublime::fileautocomplete
  include apps::sublime::sidebar
  include sublime_text_3::package_control
}
