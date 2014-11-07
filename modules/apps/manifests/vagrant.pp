class apps::vagrant {
  include vmware_fusion

  class { '::vagrant': }

}
