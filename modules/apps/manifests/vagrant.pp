class apps::vagrant {
  include vmware_fusion

  class { '::vagrant':
  version => '1.7.2' }

}
