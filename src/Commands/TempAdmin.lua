script.OnServerMessage:connect(
    function (time, player)
        script.parent.Admin_Handler:SendMessage("Admin", player)
        wait(time)
        script.parent.Admin_Handler:SendMessage("UnAdmin", player)
    end
)
