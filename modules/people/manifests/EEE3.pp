# Replace name of all the "EEE3" with your github username
# if you have a dash (-) in your username use an underscore (_) instead
class people::EEE3 {
  $home = "/Users/${::boxen_user}"

  # To automatically have the vagrant vmware windows plugin license entered for you, do the following:
  # Upload your vagrant vmware plugin license to /modules/people/files/<your github username>
  # Update the path below to point to that file and uncomment this section.
  #vagrant::plugin { 'vagrant-vmware-fusion':
  #  license => "${$boxen::config::repodir}/modules/people/files/EEE3/LICENSE_FILENAME.lic"
  #}
  
    $vmware_license = "${$boxen::config::repodir}/modules/people/files/${$::github_login}/VagrantVMWareFusionLicense.lic"

  #if you have a license file in your user dir install vmware-fusion vagrant plugin
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => $vmware_license
  }
 
  exec {  "set_vmware_fusion_key_bscown":
    command=> "'/Applications/VMware Fusion.app/Contents/Library/vmware-licenseTool' enter 40286-6H3D0-48R6C-08CRH-25MHJ '' '' '6.0' 'VMware Fusion for Mac OS' ''",
    user => root
  }

  git::config::global { 'user.email':
    value  => 'evan.enquist@changepoint.com'
  }
  git::config::global { 'user.name':
    value  => 'EEE3'
  }

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them
  # if you do not copy these your dotfiles will change when this EEE3 profile is updated as they
  # are symlinked into your home directory.
  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/EEE3/.bash_profile"
  }
}
