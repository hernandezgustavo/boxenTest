# Replace name of all the "bscown" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::bscown {
  include gitflow
  include flowdock
  include homebrewcask
  include bettertouchtool
  include heroku

  $vmware_license = "${$boxen::config::repodir}/modules/people/files/${$::github_login}/VagrantVMWareFusionLicense.lic"

  #if you have a license file in your user dir install vmware-fusion vagrant plugin
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => $vmware_license
  }
 
  exec {  "set_vmware_fusion_key_bscown":
    command=> "'/Applications/VMware Fusion.app/Contents/Library/vmware-licenseTool' enter 4N2AK-2H1EN-J8L62-08CU2-9N3NM '' '' '6.0' 'VMware Fusion for Mac OS' ''",
    user => root
  }

  #add personal git configurations
  git::config::global { 'user.email':
    value  => 'bryan.scown@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'Bryan Scown'
  }

  #link in your personal dot files the provided files live in the people/files dir and
  #you should copy them to a folder matching your personal user if you intend to personalize them
  #if you do not copy these your dotfiles will change when this bscown profile is updated as they
  #are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/bscown/.bash_profile"
  }


}
