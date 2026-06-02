#!/usr/bin/env fish

# some autoloaded functions/*.fish files will define multiple functions
# if they do, they should also define $f.automapper which will symlink
#    the "master" .fish file with all the other functions defined in that master file.

# this utility will load all the functions/*.fish files which will include *.automapper
# functions iff the master.fish file defines additional functions. It will then
# run each .automapper.

# load all fish autoloaded functions
source $__fish_config_dir/functions/*.fish

# run each .automapper function
for automapper in (functions --names)
    string match --quiet --regex \.automapper\$ $automapper; and $automapper
end

