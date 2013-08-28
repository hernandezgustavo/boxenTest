set -x CLICOLOR 1
set -x LSCOLORS GxFxCxDxBxegedabagaced
set -x PATH ~/bin $PATH

. ~/.config/fish/prompt.fish
if test -e ~/.comfig/fish/personal.fish
    . ~/.comfig/fish/personal.fish
end

## LOAD BASH ENVIRONMENT
function processExport 
    set var (echo $argv | sed -E "s/^([A-Za-z0-9_]+)=(.*)\$/\1/")
    set value (echo $argv | sed -E "s/^([A-Za-z0-9_]+)=(.*)\$/\2/")

    # remove surrounding quotes if existing
    set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

    set value (echo $value | sed -E "s/:/' '/g")

    set value \'$value\'
    #echo "set -xg '$var' '$value' (via '$e')"
    eval set -xg '$var' $value
end

for env in (bash -c "source ~/.bash_profile; ENV")
    processExport $env
end
