function grc.wrap -a executable

  set executable $argv[1]
  
  if test (count $argv) -gt 1
    set arguments $argv[2..(count $argv)]
  else
    set arguments
  end

  set optionsvariable "grcplugin_"$executable
  set options $$optionsvariable

  if isatty 1
    command grc --colour=auto $executable $options $arguments
  else
    eval command $executable $arguments
  end
end
