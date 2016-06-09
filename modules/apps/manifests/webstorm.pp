class apps::webstorm ($version = '2016.1.3') {
  require apps::java
  
  package { "WebStorm $version":
    provider => 'appdmg',
    source   => "http://download.jetbrains.com/webstorm/WebStorm-${version}.dmg"
  }
}
