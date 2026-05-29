function f.symlink -a pathname --description 'f.symlink $pathname $name... # symlink autoloaders to a pathname'
    test -f $pathname; or ret "pathname $pathname not found"
    set --local pathname $(abspath $pathname)
    set --local pathnamed (path dirname $pathname)
    ln --symbolic --target-directory=$pathnamed $pathname $argv[2..] &> /dev/null; or true
end


