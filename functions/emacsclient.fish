function emacsclient --description "augments emacsclient with initial flags"
    # setting alternate-editor to null string defaults to `emacs --daemon` first and then connecting to that emacs server
    command (status current-function) --alternate-editor= --reuse-frame --no-wait --timeout=20 --quiet $argv
end