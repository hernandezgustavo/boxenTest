class apps::vagrant {
  include apps::virtualbox
  include vagrant


  vagrant::plugin { 'vagrant-berkshelf':
  }

  vagrant::plugin { 'vagrant-windows':
  }
}
