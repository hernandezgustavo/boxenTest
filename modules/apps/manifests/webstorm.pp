class apps::webstorm ($version = '7.0.1') {
  package { 'WebStorm':
    provider => 'appdmg',
    source   => "http://download.jetbrains.com/webstorm/WebStorm-${version}.dmg"
  }
}
