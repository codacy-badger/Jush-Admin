-- Made by Jush
-- Jush Admin [Open Source]
-- If you want to contribute to this admin, submit a pull request at https://github.com/JushBJJ/Jush-Admin/pulls
-- If you have a problem, issue it at https://github.com/JushBJJ/Jush-Admin/issues

local Owner_User=game:GetOwnerUsername()
local Prefix=";"
local Command
local Command_Arguments={}

function ADMIN(CallType, player)
    script.parent.Admin_Handler:SendMessage(CallType, player)
end

Chat.Received:connect(function(player, input)
    if ADMIN("RECIEVE", player) then
        local x,y=string.find(input, Prefix)
        if x==1 then
            -- TODO: Split arguments and command, etc
        end
    end
end)

