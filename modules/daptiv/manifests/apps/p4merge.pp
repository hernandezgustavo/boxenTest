class daptiv::apps::p4merge {
  package { 'p4merge':
    provider => 'appdmg',
    source   => 'http://filehost.perforce.com/perforce/r13.3/bin.macosx106x86/P4V.dmg'
  }
}
