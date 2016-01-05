class people::dachew {

  $home = "/Users/rmccallum"
  $cfg = "${home}/src/configuration"
  $vmare_key = "M069M-6HL82-M8L63-0898H-803KN"

  include apps::vagrant
  include apps::vmware_fusion
  include apps::nodejs


  #-------------------------------------------------------------
  # Special User Configurations
  #-------------------------------------------------------------
  repository { 'configuration':
	source   => 'git@github.com:dachew/configuration', #short hand for github repos
	provider => 'git',
	path     => "${cfg}"
  }
  file { "${home}/.bash_profile":
    ensure	=> link,
    target	=> "${cfg}/changepoint/macos/.bash_profile"
  }
  file { "${home}/.vimrc":
    ensure	=> link,
    target	=> "${cfg}/changepoint/macos/.vimrc"
  }
  file { "${home}/.vim":
    ensure	=> link,
    target	=> "${cfg}/changepoint/macos/.vim/"
  }
  file { "${home}/.gitconfig":
    ensure	=> link,
    target	=> "${cfg}/changepoint/macos/.gitconfig"
  }
  file { "${home}/.gitattributes":
    ensure	=> link,
    target	=> "${cfg}/changepoint/macos/.gitattributes"
  }

  #-------------------------------------------------------------
  # License VMWare Fusion  
  #-------------------------------------------------------------
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${boxen::config::repodir}/modules/people/files/dachew/VagrantVMWareFusionLicense-rmccallum.lic"
  }
  exec { "license_vmware_fusion":
    command=> "vmware-licenseTool enter ${vmware_key} '' '' '7.0' 'VMware Fusion for Mac OS' ''",
    path => '/Applications/VMware Fusion.app/Contents/Library',
    user => root,
    refreshonly => true,
    subscribe => Package['VMware Fusion']
  }


  #-------------------------------------------------------------
  # Sublime Text
  #-------------------------------------------------------------
  $st = "${home}/Library/Application Support/Sublime Text 3"
  
  include sublime_text_3
  include sublime_text_3::package_control
  sublime_text_3::package { 'Theme - Soda':
    source => 'https://github.com/buymeasoda/soda-theme/'
  }

  # symlink the correct user folder
  exec { "fix-subl-user-folder":
    command => "ln -Fs \"${cfg}/changepoint/macos/sublime-text/\" \"${st}/Packages/User\"",
	onlyif => "test ! -L \"${st}/Packages/User\""
  }

  # Decrypt license file using OpenSSL
  # http://osxdaily.com/2012/01/30/encrypt-and-decrypt-files-with-openssl/
  exec { "decrypt_subl_license":
    command => "openssl des3 -d -in \"${cfg}/licenses/license-info.enc\" -out \"${st}/Local/License.sublime_license\" -pass pass:6VS+AMYmg6",
	onlyif => "test ! -f \"${st}/Local/License.sublime_license\""
  }

  # Create a symlink for starting Sublime Text from the terminal
  file { '/usr/local/bin/subl':
    ensure  => symlink,
    target  => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
  }


  #-------------------------------------------------------------
  # VIM syntax for Puppet
  # VIM syntax location for mac OS: /usr/share/vim/vim73/
  #-------------------------------------------------------------
  repository { 'puppet-syntax-vim':
	source   => 'git@github.com:puppetlabs/puppet-syntax-vim.git',
	provider => 'git',
	path     => "${home}/src/puppet-syntax-vim/",
	force    => true
  }
  file { '/usr/share/vim/vim73/ftdetect':
    source	=> "${home}/src/puppet-syntax-vim/ftdetect",
    recurse	=> true
  }
  file { '/usr/share/vim/vim73/ftplugin':
    source	=> "${home}/src/puppet-syntax-vim/ftplugin",
    recurse	=> true
  }
  file { '/usr/share/vim/vim73/indent':
    source	=> "${home}/src/puppet-syntax-vim/indent",
    recurse	=> true
  }
  file { '/usr/share/vim/vim73/syntax':
    source	=> "${home}/src/puppet-syntax-vim/syntax",
    recurse	=> true
  }



  #-------------------------------------------------------------
  # Osx Customizations
  #-------------------------------------------------------------
  file { "${home}/Library/KeyBindings/DefaultKeyBinding.dict":
	ensure	=> link,
	target	=> "${cfg}/changepoint/macos/DefaultKeyBinding.dict"
  }

  include osx::no_network_dsstores
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
}
