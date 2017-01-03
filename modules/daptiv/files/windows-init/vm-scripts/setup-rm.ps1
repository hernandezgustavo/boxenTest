git clone git@github.com:daptiv/Daptiv.Services.ResourceManagement C:/src/Daptiv.Services.ResourceManagement
cd C:/src/Daptiv.Services.ResourceManagement
bundle install
bundle exec rake
chef-client -j rm.json -o "daptiv_services_resourcemanagement::default,minitest-handler"
