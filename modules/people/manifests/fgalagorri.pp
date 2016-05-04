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
  include spotify
  include apps::sublime
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme
  include sublime_text::package_control
  include vmware_fusion
  
  $home = "/Users/${::boxen_user}"

  # Install Vagrant plugins required for DevOps/Chef development
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/fgalagorri/LICENSE-2-vagrant-vmware-provider-license_20_seats.lic"
  }
  vagrant::plugin { 'vagrant-chefconfig': }
  vagrant::plugin { 'vagrant-berkshelf': }

  # Git config
  git::config::global { 'user.email': value  => 'fgalagorri@gmail.com' }
  git::config::global { 'user.name': value  => 'fgalagorri' }

  # Link to custom bash profile
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/fgalagorri/.bash_profile"
  }

  #OSX Config
  #include osx::finder::show_hidden_files
}
