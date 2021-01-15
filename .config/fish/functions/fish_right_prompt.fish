# function fish_right_prompt
  #intentionally left blank
# end

function fish_right_prompt
  set -l exit_code $status
  if test $exit_code -ne 0
    set_color red
  else
    set_color green
  end
  set_color blue
  printf '['
  set_color green
  printf '%s' (date +%H:%M:%S)
  set_color blue
  printf '] '
  set_color normal
end   
