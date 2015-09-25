# Usage
#   To use the default vmware plugin license path at
#   modules/people/files/githubUser/license-vagrant-vmware-fusion:

#     include apps::vagrant
#
#
#   To specify a custom vmware plugin license path, add the path in your
#   hiera.json using "apps::vagrant::vagrantVMwareLicensePath" for the key.
#   Or, declare the class with resource-like behavior:
#
#     class { 'apps::vagrant': vagrantVMwareLicensePath => '/path/to/license' }
#
class apps::vagrant ($vagrantVMwareLicensePath = undef) {
  include ::vmware_fusion

  class { '::vagrant':
    version => '1.7.3'
  }

  if $vagrantVMwareLicensePath {
    $vmwareLicensePath = $vagrantVMwareLicensePath
  }
  else {
    $vmwareLicensePath = "${boxen::config::repodir}/modules/people/files/${boxen::config::login}/license-vagrant-vmware-fusion"
  }

  # this File.exist check only works because boxen runs locally (server-less puppet)
  $licenseExists = inline_template("<% if File.exist?('${vmwareLicensePath}') %>true<% end %>")
  if $licenseExists {
    vagrant::plugin { 'vagrant-vmware-fusion':
      license => $vmwareLicensePath,
      require => Class['::vagrant'],
      version => '4.0.1'
    }
  }
}
