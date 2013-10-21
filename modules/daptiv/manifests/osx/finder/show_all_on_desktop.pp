# Public: Shows internal and external hard drives, removable media, and mounted servers on the desktop.
class daptiv::osx::finder::show_all_on_desktop {
  include daptiv::osx::finder::show_hard_drives_on_desktop
  include daptiv::osx::finder::show_external_hard_drives_on_desktop
  include daptiv::osx::finder::show_mounted_servers_on_desktop
  include daptiv::osx::finder::show_removable_media_on_desktop
}
