function shell --description '> basename of the current shell'
    path basename (readlink /proc/$fish_pid/exe)
end
