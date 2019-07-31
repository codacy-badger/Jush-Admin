commands = {}

function parsePlayers(playerArg)
	if playerArg == "all" then
		return game.Players:GetPlayers()
	elseif playerArg == "me" then
		return {game.Players.LocalPlayer}
	elseif playerArg == "others" then
		local players = {}
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name:lower() ~= game.Players.LocalPlayer.Name:lower() then
				table.insert(players, v)
			end
		end
		return players
	elseif playerArg:sub(1,2) == "~=" or playerArg:sub(1,2) == "!=" then
		local shortenedPlayerArg = playerArg:sub(3)
		local players = {}
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name:sub(1,shortenedPlayerArg:len()):lower() ~= shortenedPlayerArg:lower() then
				table.insert(players, v)
			end
		end
		return players
	else
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name:sub(1,playerArg:len()):lower() == playerArg:lower() then
				--print("matched "..v.Name) -DEBUG
				return {v}
			end
		end
	end
	print("Detected no players")
	return {}
end

function commands.kick(...)  --ALWAYS put lowercase
    --TODO: Start transfer of commands
end


script.OnServerMessage:connect(
    function(CallType, player)
        --TODO: Put Handler.
    end
)
