function gx --argument-names var val --description "set --global --export $var $val iff value passes all tests"
    if not set --query var val
        return "usage: (status current-function) var value [tests...]" 1
    end

    for t in -n $argv[3..]
        test $t $val; or ret "test $t $val failed"
    end

    set --global --export $var $val
end
