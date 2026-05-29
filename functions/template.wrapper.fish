# sed s/template/$cmd/

function template.wrapper --wraps template.wrapper --description "template.wrapper first use wrapper"
    set --local me (status current-function)
    __{$me}.load
    $me $argv
end

# triggers and events
function __template.wrapper.on-cd --on-variable PWD --description "trigger __template.wrapper.load when entering a managed directory"
    if test -f .envrc; or test -f .env;
       set --local parts (string split . (status current-function))
        $parts[1].load
        __template.wrapper_export_eval
    end
end

# call (and load) once
function __template.wrapper.load
    functions --erase __template.wrapper.on-cd template.wrapper (status current-function)
    type -q template.wrapper; or fish_command_not_found template.wrapper
    
    # define --global variables here
    # set --global --export

    # template.wrapper preexec hook (for fish)
    command template.wrapper hook fish | source

    # rewrap the template.wrapper command to add additional flags
    # (generally optional)
    function template.wrapper --wraps template.wrapper --description "template.wrapper wrapper"
        # argparse ...
        set --local cmd (status current-function)
        command $cmd $argv
        #             ^ initial flags
    end
end

function template.wrapper.install
    if type -q brew
        brew upgrade
        brew install template.wrapper
    else if type -q apt
        sudo apt update
        sudo apt upgrade -y
        sudo apt install -y template.wrapper
    else if type -q dnf
        sudo dnf update
        sudo dnf upgrade -y
        sudo dnf install -y template.wrapper
    else
        set --local parts (string split . (status current-function))
        printf '%s cannot install %s on %s\n'  (status current-function) parts[1] (platform) >&2
    end        
end