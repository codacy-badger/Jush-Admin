local Prefix=";"
local Command
local Command_Arguments={}
local Seperator=" "

function ADMIN(CallType, player)
    script.parent.Admin_Handler:SendMessage(CallType, player)
end

function splitString(inputstr)
	local t = {}
	for str in string.gmatch(inputstr, "([^"..Seperator.."]+)") do
	    table.insert(t, str)
	end
	return t
end

function slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced+1] = tbl[i]
  end

  return sliced
end

Chat.Received:connect(function(player, input)
    if ADMIN("RECIEVE", player) then
        local x,y=string.find(input, Prefix)
        if x==1 then
            -- TODO: Split arguments and command, etc
        if Prefix ~= "" then 
            if msg:sub(1,1) ~= Prefix then
                return 
            end
            msg = msg:sub(2) --cut out the prefix
        end
        msg = msg:lower()
        --print("Got command "..msg) <- debug
        local split = splitString(msg)
        if #split < 2 then return end
        local Command = split[1]
        local Command_Arguments = {}
        --print("command is "..command) 
        Command_Arguments = slice(split, 2)
        --TODO: what to do with the command and args?
    end
end)
