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

github "boxen",      "3.6.1"

# Support for default hiera data in modules

github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.1"
github "foreman",    "1.2.0"
github "gcc",        "2.0.100"
github "git",        "2.2.2"
github "go",         "1.1.0"
github "homebrew",   "1.9.2"
github "hub",        "1.3.0"
github "inifile",    "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.3"
github "nodejs",     "3.7.0"
github "openssl",    "1.0.0"
github "phantomjs",  "2.3.0"
github "pkgconfig",  "1.0.0"
github "repository", "2.3.0"
github "ruby",       "7.3.0"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",             "1.2.0"
github "adobe_reader",      "1.2.0"
github "chrome",            "1.1.1"
github "clojure",           "1.2.0"
github "colloquy",          "1.0.0"
github "cord",              "1.0.0"
github "cyberduck",         "1.0.1"
github "daisy_disk",        "1.0.1"
github "dropbox",           "1.2.0"
github "evernote",          "2.0.4"
github "firefox",           "1.1.5"
github "fish",              "1.0.0"
github "flowdock",          "1.0.0", :repo => "geetarista/puppet-flowdock"
github "flux",              "1.0.0"
github "google_notifier",   "1.0.1"
github "graphviz",          "1.0.0"
github "heroku",            "2.0.0"
github "htop",              "1.0.1", :repo => "jdar/puppet-htop"
github "imagemagick",       "1.2.1"
github "induction",         "1.0.0"
github "iterm2",            "1.0.3"
github "java",              "1.1.0"
github "lastpass",          "1.1.0", :repo => "dieterdemeyer/puppet-lastpass"
github "macvim",            "1.0.0"
github "menumeters",        "1.0.1", :repo => "vodeclic/puppet-menumeters"
github "mercurial",         "0.0.1", :repo => "bluesalt/puppet-mercurial"
github "mongodb",           "1.0.4"
github "mplayerx",          "1.0.1"
github "mumble",            "1.0.5"
github "osx",               "2.2.2"
github "pcre",              "1.0.0"
github "postgresapp",       "1.0.0"
github "protobuf",          "1.0.0"
github "python",            "1.2.1"
github "redis",             "0.3.0"
github "rubymine",          "1.0.3"
github "sourcetree",        "1.0.0"
github "spectacle",	        "1.0.0" 
github "sublime_text_3",    "1.0.1", :repo => "jozefizso/puppet-sublime_text_3"
github "swig",              "1.0.0"
github "tmux",              "1.0.2"
github "transmission",      "1.0.0"
github "vagrant",           "3.0.3"
github "vim",               "1.0.5"
github "virtualbox",        "1.0.6"
github "vmware_fusion",     "1.1.0"
github "zsh",               "1.0.0"
