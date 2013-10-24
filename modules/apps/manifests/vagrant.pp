class apps::vagrant {
  include virtualbox
  include vagrant

  vagrant::plugin { 'vagrant-berkshelf':
  }

  vagrant::plugin { 'vagrant-windows':
  }
}
