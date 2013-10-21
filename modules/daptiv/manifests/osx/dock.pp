# Internal: Restart the Dock when necessary.
#
# Example
#
#   boxen::osx_defaults { 'Do a thing':
#     # ... other stuff here ...
#     notify => Exec['killall Dock'];
#   }
class daptiv::osx::dock {
  exec { 'killall Dock':
    refreshonly => true
  }
}
