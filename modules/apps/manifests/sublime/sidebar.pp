class apps::sublime::sidebar {
  sublime_text_3::package { 'SideBarEnhancements':
    source => 'git@github.com:titoBouzout/SideBarEnhancements',
    branch => 'st3'
  }
}
