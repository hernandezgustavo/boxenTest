# Replace name of all the "Blackavar" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::blackavar {

  #add projects chefclient, ppm, ppmspa and dev dashboard
  include projects::ppm
  include projects::chefclient
  include projects::ppmspa
  include projects::devdashboard
  include lastpass
  include flowdock
  include evernote
  include redis
  include cord
  include sourcetree
  include htop
  include flux
  include menumeters
  include transmission
  include dropbox
  include rubymine
  include cyberduck
  include tmux
  include mplayerx
  include daisy_disk
  include adium
  include pkgconfig
  include swig
  include pcre
  include graphviz
  include google_notifier
  include imagemagick
  include mumble
  include induction
  include protobuf
  include postgresapp
  include heroku
  include java
  include clojure
  include mercurial
  include colloquy

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'blackavr@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'Michael Myers'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this Blackavar profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/Blackavar/.bash_profile"
  }

}
