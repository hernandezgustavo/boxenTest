class apps::java {
  include brewcask

  exec { 'install java if not there':
    command   => 'sudo brew cask install java',
    user => 'root',
    unless => 'type java'
  }
}