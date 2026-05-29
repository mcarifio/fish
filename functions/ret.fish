function ret --description "Return with optional message to stderr"
    set --local s $status
    switch (count $argv)
        case 0
            return $s
        case 1
            if string match -qr '^\d+$' -- $argv[1]
                return $argv[1]
            else
                printf '%s\n' $argv[1] >&2
                return $s
            end
        case 2
            printf '%s\n' $argv[1] >&2
            return $argv[2]
    end
end