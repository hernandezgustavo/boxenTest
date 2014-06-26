# Troubleshooting

## Running Locally

If Boxen *completely* fails to install and you can't run `boxen` from the command line then you'll probably want to fix that in a branch. But Boxen by default pulls from `master`, so what to do? Well, the trick here is to alter the install script before running. So do that, deviate from the [instructions](https://daptiv-boxen.herokuapp.com/) a little bit. Instead of `curl -s https://daptiv-boxen.herokuapp.com/script/########.sh > /tmp/install-boxen; bash /tmp/install-boxen` drop the installer somewhere you can get at and **don't** run it. For instance:

`curl -s https://daptiv-boxen.herokuapp.com/script/########.sh > ~/boxeninstaller`

That will drop the install script in your home directory so you can alter it a bit. So open it up in your favorite editor and add your branch name in a couple places.

Change

```
curl --progress-bar -L 'https://api.github.com/repos/daptiv/our-boxen/tarball/master?access_token=(...)
...
export BOXEN_REPO_NAME=daptiv/our-boxen`
```

To

```
curl --progress-bar -L 'https://api.github.com/repos/daptiv/our-boxen/tarball/YOUR-BRANCH-NAME?access_token=(...)
...
export BOXEN_REPO_NAME=daptiv/our-boxen/YOUR-BRANCH-NAME
```

Now you can run your installer with `bash boxeninstaller` and it'll pull from your branch instead of master.
