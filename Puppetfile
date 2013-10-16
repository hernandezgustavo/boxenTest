# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.10"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.4"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "chrome",            "1.1.1"
github "dropbox",           "1.1.1"
github "fish",              "1.0.0"
github "googledrive",       "1.0.0", :repo => "chrisbobo/puppet-googledrive"
github "iterm2",            "1.0.3"
github "mongodb",           "1.0.4"
github "osx",               "1.3.0", :repo => "daptiv/puppet-osx"
github "phantomjs",         "2.0.2"
github "python",            "1.2.1"
github "sublime_text_3",    "1.0.1", :repo => "jozefizso/puppet-sublime_text_3"
github "vagrant",           "2.0.7"
github "virtualbox",        "1.0.5"
github "vim",               "1.0.5"
github "vmware",            "1.0.0", :repo => "chrisbobo/puppet-vmware"
github "webstorm",          "1.1.2", :repo => "chrisbobo/puppet-webstorm"
