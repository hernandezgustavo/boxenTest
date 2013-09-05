class daptiv::vagrant {
  include vagrant
  include virtualbox
  

  vagrant::plugin { 'vagrant-berkshelf':
  }
  vagrant::plugin { 'vagrant-windows':
  }
}
