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
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.11.1"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.8.1"
github "go",          "2.1.0"
github "homebrew",    "2.0.2"
github "hub",         "1.4.1"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.7.0"
github "nodejs",      "5.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.4"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "atom",              "1.3.0"
github "chefdk",            "1.0.7", :repo => "sneal/puppet-chefdk"
github "chrome",            "1.2.0"
github "dropbox",           "1.4.1"
github "evernote",          "2.0.7"
github "firefox",           "1.2.3"
github "fish",              "1.0.0"
github "flowdock",          "1.0.1", :repo => "heathsnow/puppet-flowdock"
github "fluid",             "1.0.2"
github "gitflow",           "1.0.0", :repo => "cdburgess/puppet-gitflow"
github "google_notifier",   "1.0.1"
github "graphviz",          "1.0.0"
github "iterm2",            "1.2.5"
github "java",              "1.8.4"
github "kindle",            "1.0.1"
github "mercurial",         "0.0.1", :repo => "bluesalt/puppet-mercurial"
github "mongodb",           "1.5.0"
github "osx",               "2.8.0"
github "python",            "2.0.1"
github "screen",            "1.0.0"
github "skitch",            "1.0.3"
github "sourcetree",        "1.0.0"
github "spectacle",         "1.0.5", :repo => "akalman/puppet-spectacle"
github "spotify",           "1.0.2"
github "sublime_text",      "1.1.1"
github "trailer",           "1.0.1", :repo => "akalman/puppet-trailer"
github "vagrant",           "3.3.4"
github "vim",               "1.0.5"
github "virtualbox",        "1.0.13"
github "vmware_fusion",     "1.2.0"
github "zsh",               "1.0.0"
