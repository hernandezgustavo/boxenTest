class apps::vagrant {
  include vmware_fusion
  include vagrant

  vagrant::plugin { 'vagrant-berkshelf':
  }

  vagrant::plugin { 'vagrant-windows':
  }
}
