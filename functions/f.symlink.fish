function f.symlink -a pathname --description 'f.symlink $pathname $name... # symlink autoloaders to a pathname'
    test -f $pathname; or ret "pathname $pathname not found"
    set --local pathname $(abspath $pathname)
    set --local pathnamed (path dirname $pathname)
    for l in $argv[2..]
        ln --symbolic --relative $pathname $pathnamed/$l.fish &> /dev/null; or true
    end
end


