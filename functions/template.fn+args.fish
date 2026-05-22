# copy-paste this function body; note: function will be resourced if modified in a repl
# template.fn 1 2 3 4 5 6
function template.fn+args --argument-names first second third --description "use template.fn to create new functions"
    # show the caller invocation; note that --flags will be swallowea
    echo (status current-function) $argv "## " (status filename)  >&2
    # show all local bindings: first second third argv argv_opts and _flag_*
    set --local >&2
    
    echo (status current-function) body tbs >&2
end
