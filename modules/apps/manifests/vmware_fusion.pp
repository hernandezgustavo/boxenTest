# Usage
#   To use the default license key:

#     include apps::vmware_fusion
#
#
#   To specify a license, add the license key in your
#   hiera.json using "apps::vmware_fusion::vmwareLicense" for the key.
#   Or, declare the class with resource-like behavior:
#
#     class { 'apps::vmware_fusion': vmwareLicense => 'AAAAA-11111-BBBBB-22222-CCCCC' }
#
class apps::vmware_fusion ($vmwareLicense = 'EJ695-2QH8J-H8K7C-0Z1R0-88LJ4') {
  require ::vmware_fusion

  $vmwarePath = '/Applications/VMware Fusion.app/Contents/Library'
  $vmwareLicenseFile = "${vmwarePath}/License.txt"
  $vmwareInitializer = regsubst("${vmwarePath}/Initialize VMware Fusion.tool", '[ ]', '\\ ', 'G')

  sudoers { 'allow setting vmware fusion license':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => ["(ALL) NOPASSWD : ${vmwareInitializer}"],
    type     => 'user_spec'
  }

  file { "${vmwareLicenseFile}":
    content => $vmwareLicense,
    ensure  => file
  }

  exec { 'install vmware fusion license':
    command     => "sudo ${vmwareInitializer} set '' '' ${vmwareLicense}",
    require     => Sudoers['allow setting vmware fusion license'],
    refreshonly => true,
    subscribe   => File[$vmwareLicenseFile]
  }
}
