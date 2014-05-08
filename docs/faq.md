# FAQ

Below you can find common questions and answers.

### Q: How do you uninstall an application and get it to reinstall in the application folder with boxen?

When removing applications make sure to remove the corresponding `/var/db/.puppet_appdmg_installed_application` so that boxen will reinstall it.

### Q: How do you remove Boxen?

Run `script/nuke` from inside the `/opt/boxen/repo` directory.

### Q: What if a homebrew formula dependency doesn't install, and it blocks the installation of said formula?
First, you're asing this because you saw an error like 

    Error: Could not update: Execution of 'brew boxen-install boxen/brews/nginx' returned 1: ==> Installing nginx dependency: pcre
    ...
    Error: /opt/boxen/homebrew/Cellar/pcre/8.34 is not a directory

Try to manually install the dependency (the .\*/Cellar/{dependency}/.\* part):

    brew install {dependency}
    
Then rerun boxen from the command line.
