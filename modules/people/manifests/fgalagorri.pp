# Replace name of all the "fgalagorri" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::fgalagorri {

# Requires vagrant to install plugins:
  #include vagrant # throws already declared error

  #include appcleaner
  include bettertouchtool
  include caffeine
  include chrome
  include flowdock
  include fluid
  include onepassword
  include skype
  include spotify
  include apps::sublime
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme
  include sublime_text_3::package_control
  include vmware_fusion

  #OSX Config
  #include osx::finder::show_hidden_files
  
  $home = "/Users/${::boxen_user}"

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/fgalagorri/LICENSE-2-vagrant-vmware-provider-license_20_seats.lic"
  }

  git::config::global { 'user.email':
    value  => 'federico.galagorri@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'fgalagorri'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this fgalagorri profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/fgalagorri/.bash_profile"
  }
}
