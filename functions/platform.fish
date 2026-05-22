function platform --description 'Return normalized platform/distribution name'
    switch (uname)
        case Darwin
            echo macosx
            return 0
        case Linux
            # WSL
            if set --query WSL_DISTRO_NAME
                echo wsl
                return 0
            end

            if grep --quiet --ignore-case microsoft /proc/version 2>/dev/null
                echo wsl
                return 0
            end

            # Linux distro
            if test -f /etc/os-release
                source /etc/os-release

                if set --query ID
                    echo $ID
                    return 0
                end
            end

            echo linux
            return 0

        case 'MSYS*' 'MINGW*' 'CYGWIN*' Windows_NT
            echo windows
            return 0

        case '*'
            echo unknown
            return 1
    end
end