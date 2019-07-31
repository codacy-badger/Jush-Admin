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
	--print("Detected no players") -This should not be the case.
	return {}
end

function commands.kick(...)  --ALWAYS put lowercase
	local args = {...}
	local reason = "An admin has decided to kick you." --Change this to whatever. This signifies the default.
	local players = parsePlayers(args[1])
	if #args > 1 then
		reason = args[2]
	end
	for i,player in pairs(players) do
    	player:Kick(reason)
	end
end

function commands.tempadmin(...)  --ALWAYS put lowercase
	local args = {...}
	local time = 300
	local players = parsePlayers(args[1])
	if #args > 1 then
		time = args[2]
	end
	for i,player in pairs(players) do
		coroutine.wrap(function()
			script.parent.Admin_Handler:SendMessage("Admin", player)
			wait(time)
			script.parent.Admin_Handler:SendMessage("UnAdmin", player)
		end)()
	end
end

script.OnServerMessage:connect(
    function(command, args)
		if #args < 1 then return end
        commands[command](unpack(args))
    end
)
