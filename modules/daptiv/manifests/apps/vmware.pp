class daptiv::apps::vmware {
  package { 'vmware':
    provider => 'appdmg',
    source   => 'https://download3.vmware.com/software/fusion/file/VMware-Fusion-6.0.1-1331545.dmg'
  }
}
