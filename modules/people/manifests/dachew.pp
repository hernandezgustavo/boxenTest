class people::dachew {

  $home = "/Users/rmccallum"
  $cfg = "${home}/src/configuration"
  $vmare_key = "M069M-6HL82-M8L63-0898H-803KN"



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
  exec { "license_vmware_fusion":
    command=> "vmware-licenseTool enter ${vmware_key} '' '' '7.1.2' 'VMware Fusion for Mac OS' ''",
    path => '/Applications/VMware Fusion.app/Contents/Library/licenses',
    user => root,
    refreshonly => true,
    subscribe => Package['VMware Fusion']
  }
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${boxen::config::repodir}/modules/people/files/dachew/VagrantVMWareFusionLicense-rmccallum.lic"
  }


  #-------------------------------------------------------------
  # Sublime Text
  #-------------------------------------------------------------
  $st = "${home}/Library/Application Support/Sublime Text 3"
  
  include sublime_text
  include sublime_text::package_control
  sublime_text::package { 'Theme - Soda':
    source => 'https://github.com/buymeasoda/soda-theme/'
  }

  # symlink the correct user folder
  exec { "remove-default-user-folder":
    command => "rm -rf \"${st}/Packages/User\"",
    onlyif => "test -d \"${st}/Packages/User\""
  }
  exec { "fix-subl-user-folder":
    command => "ln -Fs \"${cfg}/changepoint/macos/sublime-text\" \"${st}/Packages/User\"",
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
  # VIM
  #-------------------------------------------------------------
  file { "${home}/.vimrc":
    ensure	=> link,
    target	=> "${cfg}/changepoint/macos/.vimrc"
  }
  file { "${home}/.vim":
    ensure	=> directory 
  }
  file { "${home}/.vim/autoload":
    ensure  => directory
  }
  file { "${home}/.vim/bundle":
    ensure  => directory
  }
  exec { "install-pathogen":
    command => "curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim",
    onlyif  => "test ! -f ~/.vim/autoload/pathogen.vim"
  }
  repository { 'puppet-syntax-vim':
    source  => 'git@github.com:rodjek/vim-puppet.git',
    provider=> 'git',
    path    => "${home}/.vim/bundle/vim-puppet/"
  }
  repository { 'vim-go':
    source  => 'git@github.com:fatih/vim-go.git',
    provider=> 'git',
    path    => "${home}/.vim/bundle/vim-go/"
  }
  repository { 'vim-javascript':
    source  => 'git@github.com:jelera/vim-javascript-syntax',
    provider=> 'git',
    path    => "${home}/.vim/bundle/vim-javascript-syntax/"
  }
  repository { 'vim-airline':
    source  => 'git@github.com:bling/vim-airline',
    provider=> 'git',
    path    => "${home}/.vim/bundle/vim-airline/"
  }


  #-------------------------------------------------------------
  # Install golang 
  #-------------------------------------------------------------
  package { "golang":
    ensure   => installed,
    provider => 'pkgdmg',
    source   => "https://storage.googleapis.com/golang/go1.5.1.darwin-amd64.pkg",
  }


  #-------------------------------------------------------------
  # Osx Customizations
  #-------------------------------------------------------------
  file { "${home}/Library/KeyBindings/DefaultKeyBinding.dict":
	  ensure	=> link,
	  target	=> "${cfg}/changepoint/macos/DefaultKeyBinding.dict"
  }

  include apps::vagrant
  include apps::vmware_fusion
  include apps::nodejs
  include osx::no_network_dsstores
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library
}
