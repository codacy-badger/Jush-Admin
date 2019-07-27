-- Made by Jush
-- Jush Admin [Open Source]
-- If you want to contribute to this admin, submit a pull request at https://github.com/JushBJJ/Jush-Admin/pulls
-- If you have a problem, issue it at https://github.com/JushBJJ/Jush-Admin/issues

local Owner_User=game:GetOwnerUsername()
local Prefix=";"
local Command
local Command_Arguments={}

local Admin={
  [Owner_User] = true,
  ["Isaac"] = true,
  ["Jordan"] = true,
}

function Kick(player, Reason)
    player:Kick(Reason)
end

function TempAdmin(time, player)
    Admin[player.Username]=true
end

Chat.Received:connect(function(player, input)
    if Admin[player.Username] == true then
        local x,y=string.find(input, Prefix)
        if x==1 then
            -- TODO: Split arguments and command, etc
        end
    end
end)
