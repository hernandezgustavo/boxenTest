class apps::webstorm ($version = '8.0.4') {
  package { 'WebStorm':
    provider => 'appdmg',
    source   => "http://download-ln.jetbrains.com/webstorm/WebStorm-${version}.dmg"
  }
}
