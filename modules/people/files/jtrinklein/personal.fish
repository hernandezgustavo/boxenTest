alias subl='subl3'
set -x EDITOR 'subl -w'
alias mountSrc='hdiutil mount ~/Documents/sourceFolder.sparsebundle/ -mountpoint ~/src'
function fish_prompt
	set_color $fish_color_cwd
	echo (prompt_pwd)
	set_color normal
	echo -n ' » '
end

alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'

