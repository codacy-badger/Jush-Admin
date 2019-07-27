script.OnScriptMessage:connect(
    function(player, Reason)
        player:Kick(Reason)
    end
)
