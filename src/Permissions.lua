local Owner_User=game:GetOwnerUsername()
local Admin={
  [Owner_User] = true,
  ["Isaac"] = true,
  ["Jordan"] = true,
}

script.OnServerMessage:connect(
    function(CallType, player)
        if CallType:lower() == "admin" then
            Admin[player]=true
        elseif CallType:lower() == "unadmin" then
            Admin[player]=false
        elseif CallType:lower() == "recieve" then
            return Admin[player]
        end
    end
)
