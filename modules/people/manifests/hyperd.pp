# Replace name of all the "hyperd" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::hyperd {
  $home = "/Users/${::boxen_user}"

  #OSX Config
  include osx::finder::show_hidden_files
  include osx::finder::show_all_on_desktop
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library
  include osx::finder::enable_quicklook_text_selection

  #include vagrant
  include chrome
  include apps::sublime
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme
  include sublime_text_3::package_control
  include vmware_fusion
  include flowdock
  include nodejs
  include google_notifier
  include fluid
  include trailer
  

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/hyperd/LICENSE-2-vagrant-vmware-provider-license_20_seats.lic"
  }

  git::config::global { 'user.email':
    value  => 'diego.ledesma@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'hyperd'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this hyperd profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/hyperd/.bash_profile"
  }
}
