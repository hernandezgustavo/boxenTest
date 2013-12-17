alias subl='subl3'
alias mountSrc='hdiutil mount ~/Documents/sourceFolder.sparsebundle/ -mountpoint ~/src'

function fish_prompt --description 'Write out the prompt'
  
  if not set -q -g __fish_robbyrussell_functions_defined
    set -g __fish_robbyrussell_functions_defined
    function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end
    
    function _is_git_dirty
      echo (git status -s --ignore-submodules=dirty ^/dev/null)
    end
  end

  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l green (set_color -o 3DA028)
  set -l blue (set_color -o 086FA1)

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set git_info "$git_branch"

    if [ (_is_git_dirty) ]
      set -l dirty " ✗"
      set git_info "$red"'('"$git_info$dirty"')'
    else
      set git_info "$yellow"'('"$git_info"')'
    end
    set git_info " $git_info"
  end
  set_color ECFC71
  printf "$green%s$git_info\n" (pwd | sed -E "s|^$HOME|~|")
  set_color normal
  echo -n ' » '
end

alias tree='ls -R | grep ":\$" | sed -e "s/:\$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/ /" -e "s/-/|/"'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'
alias gsu='git status update'

