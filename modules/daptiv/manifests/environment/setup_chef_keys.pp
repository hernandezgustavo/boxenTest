# Setup the keys neccessary for running chef:
#   encrypted_data_bag_secret
#   daptiv-validator.pem

class daptiv::environment::setup_chef_keys{

  $installs_url = 'http://vagrantboxes.hq.daptiv.com/installs'
  $install_path = '/etc/chef'

  # Create the /etc/chef directory
  file { "${install_path}":
    ensure => directory
  }

  # Pull down encrypted_data_bag_secret from network url
  exec { "curl -o ${install_path}/encrypted_data_bag_secret.gpg ${installs_url}/Chef/encrypted_data_bag_secret.gpg.txt": 
    subscribe => File["${install_path}"]
  }

  # Decrypt encrypted_data_bag_secret.gpg (uses popup window requiring input to continue)
  exec { "/usr/local/bin/gpg --no-tty --yes --always-trust ${install_path}/encrypted_data_bag_secret.gpg":
    subscribe => Exec["curl -o ${install_path}/encrypted_data_bag_secret.gpg ${installs_url}/Chef/encrypted_data_bag_secret.gpg.txt"]
  }

  # Pull down daptiv-validator.pem.gpg from network url
  exec { "curl -o ${install_path}/daptiv-validator.pem.gpg ${installs_url}/Chef/daptiv-validator.pem.gpg.txt":
    subscribe => File["${install_path}"]
  }

  # Decrypt daptiv-validator.pem.gpg (uses popup window requiring input to continue)
  exec { "/usr/local/bin/gpg --no-tty --yes --always-trust ${install_path}/daptiv-validator.pem.gpg":
    subscribe => Exec["curl -o ${install_path}/daptiv-validator.pem.gpg ${installs_url}/Chef/daptiv-validator.pem.gpg.txt"]
  }

}
