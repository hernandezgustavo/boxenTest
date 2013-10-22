class daptiv::apps::webstorm ($version = '7.0') {
  package { 'WebStorm':
    provider => 'pkgdmg',
    source   => "http://download.jetbrains.com/webstorm/WebStorm-${version}.dmg"
  }
}
