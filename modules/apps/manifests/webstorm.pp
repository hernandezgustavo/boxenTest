class apps::webstorm ($version = '10.0.4') {
  package { 'WebStorm':
    provider => 'appdmg',
    source   => "http://download.jetbrains.com/webstorm/WebStorm-${version}.dmg"
  }
}
