# Public: Unhide ~/Library in Finder.
class daptiv::osx::finder::unhide_library {
  include daptiv::osx::finder
  
  $home = "/Users/${::boxen_user}"

  exec { 'Unhide ~/Library':
    command => "chflags nohidden ${home}/Library",
    onlyif  => "ls -Ol ${home} | grep Library | grep hidden",
    notify => Exec['killall Finder']
  }
}
