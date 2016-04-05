git clone git@github.com:daptiv/Ppm C:/src/Ppm
cd C:/src/Ppm
git submodule init
git submodule update
bundle install
bundle exec rake
npm install -g grunt-cli
chef-client
chef-client -o beyondcompare