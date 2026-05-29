function pkg.cmd --description 'Return preferred package manager command'
    for cmd in dnf apt brew eget
        if command --query $cmd
            echo $cmd
            return 0
        end
    end

    return 1
end
