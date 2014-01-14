class apps::vmware {
  package { 'vmware':
    provider => 'appdmg',
    source   => 'https://download3.vmware.com/software/fusion/file/VMware-Fusion-6.0.2-1398658-light.dmg'
  }
}
