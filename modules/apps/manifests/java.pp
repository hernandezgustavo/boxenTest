class apps::java {
  include brewcask

  exec { 'install java if not there':
    command   => 'brew cask install java',
    unless => 'java'
  }
}
