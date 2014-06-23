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

  exec { "data_bag_password_request":
    command => "osascript -e 'tell app \"System Events\" to display dialog \"Next you will be asked to enter the passphrase for:\n
    encrypted_data_bag_secret\n\nYou can find this in the Password Manager.(https://vmit01.hq.daptiv.com:7272)\"'",
    onlyif => "test ! -f /etc/chef/encrypted_data_bag_secret",
    #creates => "~/etc/chef/encrypted_data_bag_secret",
    notify => Notify['/etc/chef/encrypted_data_bag_secret already exists. . .'],
  }

  notify { '/etc/chef/encrypted_data_bag_secret already exists. . .': }

  # Pull down encrypted_data_bag_secret from network url
  exec { "curl -o ${install_path}/encrypted_data_bag_secret.gpg ${installs_url}/Chef/encrypted_data_bag_secret.gpg.txt":
    refreshonly => true,
    subscribe => Exec["data_bag_password_request"]
  }

  # Decrypt encrypted_data_bag_secret.gpg (uses popup window requiring input to continue)
  exec { "/usr/local/bin/gpg --no-tty --yes --always-trust ${install_path}/encrypted_data_bag_secret.gpg":
    refreshonly => true,
    subscribe => Exec["curl -o ${install_path}/encrypted_data_bag_secret.gpg ${installs_url}/Chef/encrypted_data_bag_secret.gpg.txt"]
  }

  exec { "validator_password_request":
    command => "osascript -e 'tell app \"System Events\" to display dialog \"Next you will be asked to enter the passphrase for:\n
    daptiv-validator.pem\n\nYou can find this in the Password Manager.(https://vmit01.hq.daptiv.com:7272)\"'",
    onlyif => "test ! -f /etc/chef/daptiv-validator.pem",
    #creates => "~/etc/chef/daptiv-validator.pem",
    notify => Notify['/etc/chef/daptiv-validator.pem already exists. . .'],
  }

  notify { '/etc/chef/daptiv-validator.pem already exists. . .': }

  # Pull down daptiv-validator.pem.gpg from network url
  exec { "curl -o ${install_path}/daptiv-validator.pem.gpg ${installs_url}/Chef/daptiv-validator.pem.gpg.txt":
    refreshonly => true,
    subscribe => Exec["validator_password_request"]
  }

  # Decrypt daptiv-validator.pem.gpg (uses popup window requiring input to continue)
  exec { "/usr/local/bin/gpg --no-tty --yes --always-trust ${install_path}/daptiv-validator.pem.gpg":
    refreshonly => true,
    subscribe => Exec["curl -o ${install_path}/daptiv-validator.pem.gpg ${installs_url}/Chef/daptiv-validator.pem.gpg.txt"]
  }

}
