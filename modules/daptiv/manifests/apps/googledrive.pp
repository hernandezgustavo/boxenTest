class daptiv::apps::googledrive {
  package { 'GoogleDrive':
    provider => 'appdmg',
    source   => 'https://dl.google.com/drive/installgoogledrive.dmg'
  }
}
