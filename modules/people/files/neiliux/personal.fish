alias p=pico
alias "gitbranchclean"="git branch -D (git branch | trim)"
alias hdo="egrep -irn --color 'describe.only' ."
alias hasDescribeOnly=hdo

function g
    git $argv
end

function gs
    git status $argv
end

function gp
    git pull $argv
end

function gpu
    git push $argv
end

function gc
    git commit $argv
end

function gr
    grunt $argv
end

function gcb
    git checkout -b $argv
end

function gcm
    git checkout master
end

function gbpn
    grunt build-ci --production=true --no-optimize
end

function gbp
   grunt build-ci --production=true
end

