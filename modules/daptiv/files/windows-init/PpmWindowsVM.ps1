gem install bundle

#setup auth
git clone git@github.com:daptiv/Daptiv.Services.Auth C:/src/Daptiv.Services.Auth
cd C:/src/Daptiv.Services.Auth
bundle install
bundle exec rake
chef-client -j oic.json

#setup ppm
git clone git@github.com:daptiv/Ppm C:/src/Ppm
cd C:/src/Ppm
git submodule init
git submodule update
bundle install
bundle exec rake
npm install -g grunt-cli
chef-client -r "daptiv_dev_ppm_role::deploy_ppm,minitest-handler"

chef-client -o beyondcompare
