class apps::sublime::sidebar {
  sublime_text::package { 'SideBarEnhancements':
    source => 'git@github.com:titoBouzout/SideBarEnhancements',
    branch => 'st3'
  }
}
