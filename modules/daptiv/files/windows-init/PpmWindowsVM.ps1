gem install bundle

#setup ppm
git clone git@github.com:daptiv/Ppm C:/src/Ppm
cd C:/src/Ppm
git submodule init
git submodule update
bundle install
bundle exec rake
npm install -g grunt-cli mountebank
chef-client

#setup auth
git clone git@github.com:daptiv/Daptiv.Services.Auth C:/src/Daptiv.Services.Auth
cd C:/src/Daptiv.Services.Auth
bundle install
bundle exec rake
chef-client -j oic.json

#reset default chef run list
#see https://github.com/daptiv/Daptiv.Services.Auth/issues/89
cd C:/src/Ppm
chef-client -r "daptiv_dev_ppm_role::deploy_ppm,minitest-handler"

#setup rm server
git clone git@github.com:daptiv/Daptiv.Services.ResourceManagement C:/src/Daptiv.Services.ResourceManagement
cd C:/src/Daptiv.Services.ResourceManagement
bundle install
bundle exec rake
chef-client -j rm.json -o "daptiv_services_resourcemanagement::default,minitest-handler"

cd C:/src

chef-client -o beyondcompare
