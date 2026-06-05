function mkcd -a folder --description "mkcd $folder ## cd to $folder, making it first if needed"
    test -d $folder; or mkdir -p $folder $argv[2..]
    cd $folder
end