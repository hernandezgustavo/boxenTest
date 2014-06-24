class apps::vagrant {
  include vmware_fusion
  include vagrant

  vagrant::plugin { 'vagrant-berkshelf':
    ensure => 'absent'
  }

  #vagrant windows is depricated and should no longer be used.
  vagrant::plugin { 'vagrant-windows':
    ensure => 'absent'
  }

}
