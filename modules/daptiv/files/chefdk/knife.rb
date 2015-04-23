user_email     = `git config --get user.email`
home_dir       = ENV['HOME'] || ENV['HOMEDRIVE']
org            = ENV['CHEF_ORG'] || 'daptiv'
knife_override = "#{home_dir}/.chef/knife_override.rb"

chef_server_url          "https://api.opscode.com/organizations/#{org}"
log_level                :info
log_location             STDOUT

# USERNAME is UPPERCASE in Windows, but lowercase in the Chef server, so `downcase` it.
node_name                ( ENV['USER'] || ENV['USERNAME'] ).downcase
client_key               "#{home_dir}/.chef/#{node_name}.pem"
cache_type               'BasicFile'
cache_options( :path => "#{home_dir}/.chef/checksums" )
validation_client_name   "#{org}-validator"
validation_key           "/etc/chef/#{org}-validator.pem"

# We keep our cookbooks in separate repos in our regular src dir
cookbook_path            ["#{home_dir}/src"]
cookbook_copyright       "Changepoint Corporation"
cookbook_license         "All Rights Reserved"
cookbook_email           "#{user_email}"

# vagrant-chefconfig plugin uses this
vagrant_environment      'cookbook_ci'

# Allow overriding values in this knife.rb
Chef::Config.from_file(knife_override) if File.exist?(knife_override)
