# Our Boxen

Welcome to daptiv osx setup, please pull this repo and follow the getting started instructions

## Getting Started

#### If you are using OSX Lion 10.7 THIS DOESNT WORK!!!

#### Install Xcode
1. Install Xcode from the Mac App Store.
1. Open Xcode.
1. Open the Preferences window (`Cmd-,`).
1. Go to the Downloads tab.
1. Install the Command Line Tools.

#### Create system rsa key and add it to github
1. run ssh-keygen at command line to generate your rsa key
1. `cat ~/.ssh/idrsa.pub` and add this key to github

#### Add staff group to your user if and only if (aka your user group when you `ls -al` in your home directory is `HQ\Domain User`)
1. very important step for domain bound users run this command to add yourself to the `staff` group
    `sudo dseditgroup -o edit -a [your username] -t user staff`

#### You are ready hit the button and follow instructions
1. Go to https://daptiv-boxen.herokuapp.com/ authenticate and run the given command
1. From this point on just run boxen to get updates or any changes to your personal profile.

## Configuration
As of the first boxen run you will have a `~/src/our-boxen` repository already set up, however you will not have any included projects. You will at this point want to set up your personal boxen people file which will hold your personal setttings for what you wish to be installed on your box.  

The `modules/people/manifests` folder contains your personal manifest files which are automatically added based on your github username.  An example default.pp file exists with a sampling of common configurations that you will want to match.  The most important things here are to include any projects you are working on and personalize your bash profile.

###Optional Tools

`include daptiv::fishShell` will add a base fish shell configured with a common base setup refer to park9140 people config for options or talk to Jonathan Park for support

`include daptiv::sublime` will install sublime text 2, sublime linter plugin, and configure subl command line alias to run sublime text from the command line.

### Dependencies

**Install the Xcode Command Lines Tools and/or full Xcode.**
This will grant you the most predictable behavior in building apps like
MacVim.

How do you do it?

1. Install Xcode from the Mac App Store.
1. Open Xcode.
1. Open the Preferences window (`Cmd-,`).
1. Go to the Downloads tab.
1. Install the Command Line Tools.

Once your shell is ready, open a new tab/window in your Terminal
and you should be able to successfully run `boxen --env`.
If that runs cleanly, you're in good shape.

## What You Get

This template project provides the following by default:

* Homebrew
* Git
* Hub
* dnsmasq w/ .dev resolver for localhost
* rbenv
* Full Disk Encryption requirement
* Node.js 0.4
* Node.js 0.6
* Node.js 0.8
* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
* ack
* Findutils
* GNU tar

## Customizing

You can always check out the number of existing modules we already
provide as optional installs under the
[boxen organization](https://github.com/boxen). These modules are all
tested to be compatible with Boxen. Use the `Puppetfile` to pull them
in dependencies automatically whenever `boxen` is run.

### Including boxen modules from github (boxen/puppet-<name>)

You must add the github information for your added Puppet module into your Puppetfile at the root of your
boxen repo (ex. /path/to/your-boxen/Puppetfile):

    # Core modules for a basic development environment. You can replace
    # some/most of these if you want, but it's not recommended.

    github "repository", "2.0.2"
    github "dnsmasq",    "1.0.0"
    github "gcc",        "1.0.0"
    github "git",        "1.2.2"
    github "homebrew",   "1.1.2"
    github "hub",        "1.0.0"
    github "inifile",    "0.9.0", :repo => "cprice404/puppetlabs-inifile"
    github "nginx",      "1.4.0"
    github "nodejs",     "2.2.0"
    github "ruby",       "4.1.0"
    github "stdlib",     "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
    github "sudo",       "1.0.0"

    # Optional/custom modules. There are tons available at
    # https://github.com/boxen.

    github "java",     "1.1.0"

In the above snippet of a customized Puppetfile, the bottom line
includes the Java module from Github using the tag "1.1.0" from the github repository
"boxen/puppet-java".  The function "github" is defined at the top of the Puppetfile
and takes the name of the module, the version, and optional repo location:

    def github(name, version, options = nil)
      options ||= {}
      options[:repo] ||= "boxen/puppet-#{name}"
      mod name, version, :github_tarball => options[:repo]
    end

Now Puppet knows where to download the module from when you include it in your site.pp or mypersonal.pp file:

    # include the java module referenced in my Puppetfile with the line
    # github "java",     "1.1.0"
    include java

### Node definitions

Puppet has the concept of a
['node'](http://docs.puppetlabs.com/references/glossary.html#agent),
which is essentially the machine on which Puppet is running. Puppet looks for
[node definitions](http://docs.puppetlabs.com/learning/agent_master_basic.html#node-definitions)
in the `manifests/site.pp` file in the Boxen repo. You'll see a default node
declaration that looks like the following:

``` puppet
node default {
  # core modules, needed for most things
  include dnsmasq

  # more...
}
```

### How Boxen interacts with Puppet

Boxen runs everything declared in `manifests/site.pp` by default.
But just like any other source code, throwing all your work into one massive
file is going to be difficult to work with. Instead, we recommend you
use modules in the `Puppetfile` when you can and make new modules
in the `modules/` directory when you can't. Then add `include $modulename`
for each new module in `manifests/site.pp` to include them.
One pattern that's very common is to create a module for your organization
(e.g., `modules/github`) and put an environment class in that module
to include all of the modules your organization wants to install for
everyone by default. An example of this might look like so:

``` puppet
# modules/github/manifests/environment.pp

 class github::environment {
   include github::apps::mac

   include ruby::1-8-7

   include projects::super-top-secret-project
 }
 ```

 If you'd like to read more about how Puppet works, we recommend
 checking out [the official documentation](http://docs.puppetlabs.com/)
 for:

 * [Modules](http://docs.puppetlabs.com/learning/modules1.html#modules)
 * [Classes](http://docs.puppetlabs.com/learning/modules1.html#classes)
 * [Defined Types](http://docs.puppetlabs.com/learning/definedtypes.html)
 * [Facts](http://docs.puppetlabs.com/guides/custom_facts.html)

### Creating a personal module

See [the documentation in the
`modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone.

### Creating a project module

See [the documentation in the
`modules/projects`](modules/projects/README.md)
directory for creating organization projects (i.e., repositories that people
will be working in).

## Binary packages

We support binary packaging for everything in Homebrew, rbenv, and nvm.
See `config/boxen.rb` for the environment variables to define.

## Sharing Boxen Modules

If you've got a Boxen module you'd like to be grouped under the Boxen org,
(so it can easily be found by others), please file an issue on this
repository with a link to your module.
We'll review the code briefly, and if things look pretty all right,
we'll fork it under the Boxen org and give you read+write access to our
fork.
You'll still be the maintainer, you'll still own the issues and PRs.
It'll just be listed under the boxen org so folks can find it more easily.

## Integrating with Github Enterprise

If you're using a Github Enterprise instance rather than github.com,
you will need to set the "BOXEN_GITHUB_ENTERPRISE_URL" and
"BOXEN_REPO_URL_TEMPLATE" variables in your
[Boxen config](config/boxen.rb).

## Halp!

See [FAQ](https://github.com/boxen/our-boxen/blob/master/docs/faq.md).

Use Issues or #boxen on irc.freenode.net.
