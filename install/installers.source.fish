function basename
    set --local parts (string split . (path basename (status filename)))
    echo $parts[1]
end

function installer
    set --local parts (string split . (path basename (status filename)))
    echo $parts[2]
end

# apt [--key=] [--repo= | --ppa= ] [--pockets=p0:p1...] pkg...
function apt
    # future mike@carif.io: --ppa=
    argparse key= repo= pockets= -- $argv
    if test (count argv) -gt 0
        set --function pkg $argv[1]
        set --function argv $argv[2..]
    end

    # post processing
    set --local fish_trace 1
    if set --query _flag_key
       # fetch the apt key
       set --function keyring /usr/share/keyrings/(path basename $_flag_key)
       curl -fsSL $_flag_key -o $keyring
       set --function signed_by "[signed-by=$keyring]"
    end    

    if set --query _flag_repo
       # configure the source
       echo "deb $signed_by $_flag_repo $(string replace --all : ' ' $_flag_pockets)" > /etc/apt/sources.list.d/$pkg.list
    end

    command apt update
    command apt upgrade -y
    command apt install -y $pkg $argv

end

set --local sourced $sourced (path resolve (status current-filename))


