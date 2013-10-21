# Public: Disables spelling autocorrect.
class daptiv::osx::disable_autocorrect {
  boxen::osx_defaults { 'Disable autocorrect':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticSpellingCorrectionEnabled',
    value  => false,
    user   => $::boxen_user;
  }
}
