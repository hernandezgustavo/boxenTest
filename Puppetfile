# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.11.0"

# Support for default hiera data in modules

github "module-data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.
github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.7.92"
github "go",          "2.1.0"
github "homebrew",    "2.0.0"
github "hub",         "1.4.1"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
mod    "puppet-nginx",         :git => "git@github.com:sneal/puppet-nginx.git", :ref => "af8c76a1f43c48a39eb1294e09dce8c8fecb811a"
github "nodejs",      "5.0.5"
github "openssl",     "1.0.0"
github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.2"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",             "1.2.0"
github "adobe_reader",      "1.2.0"
github "atom",              "1.1.0"
github "bettertouchtool",   "1.0.0", :repo => "lucadegasperi/puppet-bettertouchtool"
github "caffeine",          "1.0.0"
github "chefdk",            "1.0.7", :repo => "sneal/puppet-chefdk"
github "chrome",            "1.1.1"
github "clojure",           "1.2.0"
github "colloquy",          "1.0.0"
github "cord",              "1.0.0"
github "cyberduck",         "1.0.1"
github "daisy_disk",        "1.0.1"
mod "puppet-diffmerge", :git => "git@github.com:sneal/puppet-diffmerge.git", :ref => "3f2ee108ad0046c0fd78a92f13eeb31a6c65fb80"
github "dropbox",           "1.2.0"
github "evernote",          "2.0.4"
github "firefox",           "1.1.5"
github "fish",              "1.0.0"
github "flowdock",          "1.0.1", :repo => "heathsnow/puppet-flowdock"
github "fluid",             "1.0.2"
github "flux",              "1.0.0"
github "gitflow",           "1.0.0", :repo => "cdburgess/puppet-gitflow"
github "google_notifier",   "1.0.1"
github "graphviz",          "1.0.0"
github "heroku",            "2.0.0"
github "homebrewcask",      "1.0.1", :repo => "heathsnow/puppet-homebrewcask"
github "htop",              "1.0.1", :repo => "jdar/puppet-htop"
github "imagemagick",       "1.2.1"
github "induction",         "1.0.0"
github "iterm2",            "1.2.0"
github "java",              "1.1.0"
github "kindle",            "1.0.1"
github "lastpass",          "1.1.0", :repo => "dieterdemeyer/puppet-lastpass"
github "macvim",            "1.0.0"
github "menumeters",        "1.0.1", :repo => "vodeclic/puppet-menumeters"
github "mercurial",         "0.0.1", :repo => "bluesalt/puppet-mercurial"
github "mongodb",           "1.0.4"
github "mplayerx",          "1.0.1"
github "mumble",            "1.0.5"
github "osx",               "2.8.0"
github "onepassword",       "1.1.5"
github "pcre",              "1.0.0"
github "postgresapp",       "1.0.0"
github "protobuf",          "1.0.0"
github "python",            "1.2.1"
github "redis",             "0.3.0"
github "royaltsx",          "1.0.1", :repo => "heathsnow/puppet-royaltsx"
github "rubymine",          "1.1.0"
github "screen",            "1.0.0"
github "skitch",            "1.0.3"
github "skype",             "1.0.9"
github "sourcetree",        "1.0.0"
github "spectacle",	        "1.0.0"
github "spotify",           "1.0.2"
github "sublime_text_3",    "1.0.1", :repo => "jozefizso/puppet-sublime_text_3"
github "swig",              "1.0.0"
github "tmux",              "1.0.2"
github "trailer",           "1.0.1", :repo => "akalman/puppet-trailer"
github "transmission",      "1.0.0"
github "vagrant",           "3.3.3"
github "vim",               "1.0.5"
github "virtualbox",        "1.0.13"
github "vmware_fusion",     "1.2.0"
mod    "puppet-webstorm",   :git => "git@github.com:jaredreynolds/puppet-webstorm.git", :ref => "3c494135cf7ed2f49a185913884e2a4f7e28cb27"
github "zsh",               "1.0.0"
