class daptiv::apps::vagrant {
  include vagrant

  vagrant::plugin { 'vagrant-berkshelf':
  }

  vagrant::plugin { 'vagrant-windows':
  }
}
