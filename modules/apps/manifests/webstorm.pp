class apps::webstorm ($version = '7.0.3') {
  package { 'WebStorm':
    provider => 'appdmg',
    source   => "http://download-ln.jetbrains.com/webstorm/WebStorm-${version}.dmg"
  }
}
