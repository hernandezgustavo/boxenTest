# Public: Expand the Save panel by default.
class daptiv::osx::dialogs::expand_save_dialog {
  boxen::osx_defaults { 'Expand save panel by default':
    user   => $::boxen_user,
    key    => 'NSNavPanelExpandedStateForSaveMode',
    domain => 'NSGlobalDomain',
    value  => true;
  }
}
