set -x CLICOLOR 1
set -x LSCOLORS GxFxCxDxBxegedabagaced
set -x PATH ~/bin $PATH

. ~/.config/fish/prompt.fish


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

for env in (bash -c "source ~/.bashrc; ENV")
    processExport $env
end

if [ ~/.config/fish/personal.fish ]
    . ~/.config/fish/personal.fish
end
