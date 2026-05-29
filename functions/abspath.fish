function abspath -a p
    if string match --quiet '/*' -- $p
        echo $p
    else
        path normalize "$PWD/$p"
    end
end
