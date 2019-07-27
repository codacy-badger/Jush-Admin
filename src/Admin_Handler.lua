local Admin={
  [Owner_User] = true,
  ["Isaac"] = true,
  ["Jordan"] = true,
}

script.OnServerMessage:connect(
    function(CallType, player)
        if CallType=="Admin" then
            Admin[player]=true
        elseif CallType=="UnAdmin" then
            Admin[player]=false
        elseif CallType=="RECIEVE" then
            return Admin[player]
        end
    end
)
