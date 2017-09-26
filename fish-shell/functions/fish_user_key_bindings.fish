
# Should push current dir on stack?
# Need another DS to manage forward and back queue?
function pop_directory
  popd
  echo
  fish_prompt
  commandline -f repaint
end

function fish_user_key_bindings
  bind \cd pop_directory
end

