# Replace name of all the "srobaudo" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::srobaudo {
  $home = "/Users/${::boxen_user}"

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.
  #vagrant::plugin { 'vagrant-vmware-fusion':
  #  license => "${$boxen::config::repodir}/modules/people/files/srobaudo/LICENSE_FILENAME.lic"
  #}

  git::config::global { 'user.email':
    value  => 'sergio.robaudo@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'srobaudo'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this srobaudo profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/srobaudo/.bash_profile"
  }
  
  include apps::sublime
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme
  include sublime_text_3::package_control
}