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
    set git_info " $git_branch"

    if [ (_is_git_dirty) ]
      set -l dirty " ✗"
      set git_info "$red$git_info$dirty"
    else
      set git_info "$green$git_info"
    end
  end
  set_color 67e667
  printf (stat -f "%Sp" .)
  set_color ECFC71
  printf (stat -f " %Su:%Sg" .)
  printf "$git_info\n"
  set_color 3DA028
  printf (prompt_pwd)
  set_color white
  echo ": "
end


# initialize our new variables
# in theory this would be in a fish_prompt event, but this file isn't sourced
# until the fish_prompt function is called anyway.
if not set -q __prompt_initialized_2
  set -U fish_color_user -o green
  set -U fish_color_host -o cyan
  set -U fish_color_status red
  set -U __prompt_initialized_2
end