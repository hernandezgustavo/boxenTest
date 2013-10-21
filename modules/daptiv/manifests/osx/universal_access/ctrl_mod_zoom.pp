# Public: Enables Ctrl-scroll to zoom.
class daptiv::osx::universal_access::ctrl_mod_zoom {
  boxen::osx_defaults { 'Use scroll gesture with the Ctrl (^) key to zoom':
    user   => $::boxen_user,
    domain => 'com.apple.universalaccess',
    key    => 'HIDScrollZoomModifierMask',
    value  => 262144;
  }
}
