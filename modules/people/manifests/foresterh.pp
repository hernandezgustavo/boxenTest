class people::foresterh {
  include apps::fishShell
  include iterm2::dev

  $home = "/Users/${::boxen_user}"

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/foresterh/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/foresterh/VagrantVMWareFusionLicense_foresterh_stevehayes.lic"
  }

  git::config::global { 'user.email':
    value  => 'foresterh@gmail.com'
  }
  git::config::global { 'user.name':
    value  => 'Jamie Houston'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this foresterh profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/foresterh/.bash_profile"
  }

  include apps::sublime
  include apps::sublime::bracket_highlighter
  include apps::sublime::wombat_theme
  include sublime_text_3::package_control

}
