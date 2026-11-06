# hprof - Switch Hermes profile
function hprof --description 'Switch Hermes profile'
    set -l profiles (ls -1 ~/.hermes/profiles/)
    if test -z "$argv[1]"
        echo "Available profiles:"
        for p in $profiles
            echo "  $p"
        end
        return 1
    end
    if not contains $argv[1] $profiles
        echo "Profile '$argv[1]' not found. Available: $profiles"
        return 1
    end
    set -x HERMES_PROFILE $argv[1]
    echo "Switched to profile: $argv[1]"
end