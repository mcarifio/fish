# copy-paste this function body; note: function will be resourced if modified in a repl
# template.fn --help 1 2 3 4 5 6  ## first: 1, second: 2, third: 3, rest: 4 5 6
function template.fn+flags --description "use template.fn to create new functions"
    # show the caller invocation
    echo (status current-function) $argv "## " (status filename)  >&2

    # parse flags
    argparse v/version h/help o/output= -- $argv; or return

    # parse positional arguments
    set --local first (set --query $argv[1]; echo $argv[1]; or echo first-default )
    set --local second (set --query $argv[2]; echo $argv[2]; or echo second-default )
    set --local third  (set --query $argv[3]; echo $argv[3]; or echo third-default )
    # rest is what's leftover; always true; argv is retained unaltered
    set --local rest $argv[4..-1]

    # show all local bindings: first second third argv argv_opts and _flag_*
    set --local >&2
    
    echo (status current-function) body tbs >&2
end
