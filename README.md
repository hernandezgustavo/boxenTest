This is for test only
# Our Boxen

Welcome to Daptiv OS X setup, please follow the getting started instructions below.

NOTE - Do not pull this repo before running Boxen!

## Getting Started

### Required Steps

1. Nuke your box. Reinstall OS X Mavericks 10.9.
2. [Generate a SSH key and add it to GitHub](https://help.github.com/articles/generating-ssh-keys).
3. Manually enable full disk encryption, the setting can be found here: System Preferences > Security & Privacy > FileVault

### Optional Steps
- If your Mac has been added to the Windows AD domain then follow this step (if you're not sure, then skip this). Run this command to add yourself to the `staff` group:
`sudo dseditgroup -o edit -a [your username] -t user staff`

- To Speedup Rebuilds
 - Set all of your System Preferences
 - Make a Time Machine backup

## Run Boxen!
1. Go to https://daptiv-boxen.herokuapp.com/ authenticate and run the given command
 - Failing this use https://github.com/boxen/our-boxen#bootstrapping to bootstrap your machine   
2. From this point on just run boxen to get updates or any changes to your personal profile.

## Configuration  (VERY IMPORTANT EVERYONE SHOULD DO THIS)
As of the first boxen run you will have a `~/src/our-boxen` repository already set up, however you will not have any included projects. You will at this point want to set up your personal boxen people file which will hold your personal settings for what you wish to be installed on your box.

The `modules/people/manifests` folder contains your personal manifest files which are automatically added based on your github username.  An example default.pp file exists with a sampling of common configurations that you will want to match. To get started on your own manifest file copy this file into one that has {your github username}.pp (eg fredbob.pp).  
You should consider making the following changes to your manifest file:
- Include any projects you are working on
- Personalize your bash_profile
- Ensure your git config [user.email](https://github.com/settings/emails) and user.name have been correctly set
- If you plan on standing up a vagrant box - uncomment and update the link to your vagrant-vmware-fusion license.  Please only use the license you are assigned to on [the wiki](https://sites.google.com/a/daptiv.com/portal/Daptiv-Engineering-Wiki/tools-utlities#TOC-Vagrant-VMWare-7-Provider-)

You may also want to take a look at other user's manifest files to see some of the other things you can customize.

To get started first set the enviroment variable if not set already:
`export BOXEN_GITHUB_LOGIN=replacewithyourgithubloginusername`

and then run the following

```
 cd ~/src/our-boxen
 git checkout -b $BOXEN_GITHUB_LOGIN
 cd modules/people
 cp -R files/default files/$BOXEN_GITHUB_LOGIN
 cat manifests/default.pp | sed 's|default|'$BOXEN_GITHUB_LOGIN'|g' > manifests/$BOXEN_GITHUB_LOGIN.pp
 git add -A
 git commit -am '$BOXEN_GITHUB_LOGIN personal files'
 git push origin $BOXEN_GITHUB_LOGIN
 boxen
 bash
```

#### Remember: if you add or remove any optional tools from your people files, commit the changes!

Be sure to create a pull request in github to get your changes into the master branch, so that you don't have to worry about keeping your branch updated with any changes made to our boxen.

## Customizing

You can always check out the number of existing modules we already provide as optional installs under the [boxen organization](https://github.com/boxen). These modules are all tested to be compatible with Boxen. Use the `Puppetfile` to pull them in dependencies automatically whenever `boxen` is run.

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

    github "java",     "1.6.0"

In the above snippet of a customized Puppetfile, the bottom line
includes the Java module from Github using the tag "1.6.0" from the github repository
"[boxen/puppet-java/releases](https://github.com/boxen/puppet-java/releases)".  The function "github" is defined at the top of the Puppetfile
and takes the name of the module, the version, and optional repo location:

    def github(name, version, options = nil)
      options ||= {}
      options[:repo] ||= "boxen/puppet-#{name}"
      mod name, version, :github_tarball => options[:repo]
    end

Now Puppet knows where to download the module from when you include it in your site.pp or mypersonal.pp file:

    # include the java module referenced in my Puppetfile with the line
    # github "java",     "1.6.0"
    include java

### Hiera

Hiera is preferred mechanism to make changes to module defaults (e.g. default
global ruby version, service ports, etc). This repository supplies a
starting point for your Hiera configuration at `config/hiera.yml`, and an
example data file at `hiera/common.yaml`. See those files for more details.

The default `config/hiera.yml` is configured with a hierarchy that allows
individuals to have their own hiera data file in
`hiera/users/{github_login}.yaml` which augments and overrides
site-wide values in `hiera/common.yaml`. This default is, as with most of the
configuration in the example repo, a great starting point for many
organisations, but is totally up to you. You might want to, for
example, have a set of values that can't be overridden by adding a file to
the top of the hierarchy, or to have values set on specific OS
versions:

```yaml
# ...
:hierarchy:
  - "global-overrides.yaml"
  - "users/%{::github_login}"
  - "osx-%{::macosx_productversion_major}"
  - common
```

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

##upgrading boxen
See [FAQ-Upgrading](https://github.com/boxen/our-boxen/blob/master/docs/faq.md#q-how-do-you-upgrade-your-boxen-from-the-public-our-boxen).

## Integrating with Github Enterprise

If you're using a Github Enterprise instance rather than github.com,
you will need to set the `BOXEN_GITHUB_ENTERPRISE_URL` and
`BOXEN_REPO_URL_TEMPLATE` variables in your
[Boxen config](config/boxen.rb).

## Help!

See [FAQ](https://github.com/boxen/our-boxen/blob/master/docs/faq.md).

Use Issues or #boxen on irc.freenode.net.

+## OMG JSON Gem won't install!!!
 +See this site for more information: https://langui.sh/2014/03/10/wunused-command-line-argument-hard-error-in-future-is-a-harsh-mistress/

I got an error! Something about #!/bin/bash... then git on your Mac is improperly configured: You have set core.autocrlf to something other than the OS default, so when you clone repositories, git is changing the line endings to \r\n (they should only be \n for shell scripts, etc).  Update the setting and trash your boxen data - start it over.

## PPM Dev Box Setup

See Wiki: https://sites.google.com/a/daptiv.com/portal/Daptiv-Engineering-Wiki/dev-machine-setup/vagrant-windows-dev-box

## Upgrading Boxen when you have vagrant 1.4.2

Run boxen, this will upgrade all the things including vagrant to vagrant 1.6.2 assuming you are on the master branch (If you are on your personal branch you will need to merge master changes).    

Vagrant will land in a slightly broken state.  In order to fix this run
```bash
   vagrant plugin list
```
This will tell you to run a command that will uninstall all your plugins. Do this now.

Ensure your personal profile has your vagrant-vmware-fusion plugin configured with your key like the default personal manifest shows.
   https://github.com/daptiv/our-boxen/blob/master/modules/people/manifests/default.pp#L6-L11

Run `boxen` again, this will install your vagrant-vmware-fusion plugin.

After you have completed upgrading your boxen, Ensure that you have created a pull request for your personal manifest changes, and get it pulled into master our-boxen. This will ensure that when you rebuild your machine you can get your same settings when you initially boxen.

## Upgrade https://daptiv-boxen.herokuapp.com/  website

Get access to the heroku account with boxen from @chrisbobo or @jtrinklein or @schristopher

Configuration values are already set.

Clone the boxen web site code to your local machine
`git clone git@github.com:boxen/boxen-web.git`

Add a remote for heroku
`git remote add https://git.heroku.com/daptiv-boxen.git`

push to heroku
`git push heroku master`
