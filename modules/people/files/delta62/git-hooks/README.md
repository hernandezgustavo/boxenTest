# Super Git Hooks

Make Git do sensible things!

#### In general

- Never allow commits to master
- Never allow pushes to master
- Automagically Prepend the story ID to commit messages

#### For SPA

- Never allow pushing without a successful run of `grunt`

## Setup

You need to have an environment variable set which points to your boxen files directory. For instance, mine is
set like so:

``` bash
# ~/.bash_profile

GITHUB_USERNAME="delta62"
export BOXEN_USER_FILES="$BOXEN_HOME/repo/modules/people/files/$GITHUB_USERNAME"
export PATH="$PATH:$BOXEN_USER_FILES/bin"
```

The bin directory included in your path above includes the `hookify` command, which links
the repository's Git hooks here. Run `hookify` anywhere inside of the repository to install
the hooks.

If you want to include the spa functionality as well, run `hookify spa`.
