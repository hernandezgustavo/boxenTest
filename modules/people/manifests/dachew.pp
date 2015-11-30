class people::dachew {

  $home = "/Users/rmccallum"
  $cfg = "${home}/src/configuration/changepoint"
  $vmare_key = "M069M-6HL82-M8L63-0898H-803KN"

  include apps::sublime
  include apps::sublime::bracket_highlighter
  include projects::ppm
  include projects::devdashboard
  include git
  include apps::git::aliases
  include apps::git::completion
  include chrome
  include firefox
  include vmware_fusion
  include flowdock


  #-------------------------------------------------------------
  # Special User Configurations
  #-------------------------------------------------------------
  repository { 'configuration':
	source   => 'git@github.com:dachew/configuration', #short hand for github repos
	provider => 'git',
	path     => '${home}/src/configuration/',
	force    => true
  }
  file { "${home}/.bash_profile":
    ensure	=> link,
    target	=> "${cfg}/macos/.bash_profile"
  }
  file { "${home}/.vimrc":
    ensure	=> link,
    target	=> "${cfg}/macos/.vimrc"
  }
  file { "${home}/.gitconfig":
    ensure	=> link,
    target	=> "${cfg}/macos/.gitconfig"
  }


  #-------------------------------------------------------------
  # License VMWare Fusion  
  #-------------------------------------------------------------
  exec { "license_vmware_fusion":
    command=> "vmware-licenseTool enter ${vmware_key} '' '' '7.0' 'VMware Fusion for Mac OS' ''",
    path => '/Applications/VMware Fusion.app/Contents/Library',
    user => root,
    refreshonly => true,
    subscribe => Package['VMware Fusion']
  }
  vagrant::plugin { 'vmware-fusion':
    license => "${boxen::config::repodir}/modules/people/files/dachew/VagrantVMWareFusionLicense-rmccallum.lic"
  }


  #-------------------------------------------------------------
  # Sublime Text
  #-------------------------------------------------------------
  file { "${home}/Library/Application Support/Sublime Text 3/Packages/User":
    ensure => symlink,
    target => "${cfg}/sublime-text"
  }
  # Decrypt license file using OpenSSL
  # http://osxdaily.com/2012/01/30/encrypt-and-decrypt-files-with-openssl/
  exec { "decrypt_subl_license":
    command => "openssl des3 -d -in license-info.enc -out license-info -pass pass:6VS+AMYmg6",
    path => "${cfg}/licenses/"
  }

  # Sublime Text - license
  file { "${home}/Library/Application Support/Sublime Text 3/Local/License.sublime_license":
    ensure => file,
    target => "${cfg}/licenses/license-info"
  }

  # Create a symlink for starting Sublime Text from the terminal
  file { '/usr/local/bin/subl':
    ensure  => link,
    target  => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
  }


  #-------------------------------------------------------------
  # VIM syntax for Puppet
  # VIM syntax location for mac OS: /usr/share/vim/vim73/
  #-------------------------------------------------------------
  repository { 'configuration':
	source   => 'git@github.com:puppetlabs/puppet-syntax-vim.git',
	provider => 'git',
	path     => '${home}/src/puppet-syntax-vim/',
	force    => true
  }
  file { '/usr/share/vim/vim73/ftdetect':
  	source	=> '${home}/src/puppet-syntax-vim/ftdetect',
	recurse	=> true
  }
  file { '/usr/share/vim/vim73/ftplugin':
  	source	=> '${home}/src/puppet-syntax-vim/ftplugin',
	recurse	=> true
  }
  file { '/usr/share/vim/vim73/indent':
  	source	=> '${home}/src/puppet-syntax-vim/indent',
	recurse	=> true
  }
  file { '/usr/share/vim/vim73/syntax':
  	source	=> '${home}/src/puppet-syntax-vim/syntax',
	recurse	=> true
  }



  #-------------------------------------------------------------
  # Osx Customizations
  #-------------------------------------------------------------
  file { '${home}/Library/KeyBindings/DefaultKeyBinding.dict':
	ensure	=> link,
	target	=> '${cfg}/changepoint/macos/DefaultKeyBinding.dict'
  }

  include osx::disable_app_quarantine
  include osx::no_network_dsstores

  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
}
