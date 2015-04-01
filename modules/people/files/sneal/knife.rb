current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "sneal"
client_key               "#{current_dir}/sneal.pem"
validation_client_name   "daptiv-validator"
validation_key           "/etc/chef/daptiv-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/daptiv"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
vagrant_environment      'cookbook_ci'
