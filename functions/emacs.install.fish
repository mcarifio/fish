# rely on the underlying package command to install idempotently
function emacs.install --description "install emacs in the preferred way by platform"
    argparse repo= key= -- argv
    set parts (string split . (status current-function))
    set --local action parts[-1]
    set --local pkg parts[1]
    pkg.$action $pkg
end
