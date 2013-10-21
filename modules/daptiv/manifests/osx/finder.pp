# Internal: Restart finder when necessary.
class daptiv::osx::finder {
  exec { 'killall Finder':
    refreshonly => true
  }
}
