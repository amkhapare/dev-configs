session_exists ()
{
    SESSIONEXISTS=$(tmux list-sessions | grep "$1")
    if ["$SESSIONEXISTS" == *"no server"*] || ["$SESSIONEXISTS" == ""]; then
        return 0
    else
        return 1
    fi
}
