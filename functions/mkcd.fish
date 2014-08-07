function mkcd -d 'Create a directory and cd to it immediately'
  set location $argv[1]
  test -d $location ; or mkdir --parent $location
  cd $location
end