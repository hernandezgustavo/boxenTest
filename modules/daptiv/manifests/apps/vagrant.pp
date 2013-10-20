class daptiv::apps::vagrant {
  include daptiv::apps::virtualbox
  include vagrant
  

  vagrant::plugin { 'vagrant-berkshelf':
  }

  vagrant::plugin { 'vagrant-windows':
  }
}
