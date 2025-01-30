---@param ply Player
---@param target Player[]
---@param minutes number
---@param reason string
ONC.Commands.RegisterCommand("ban", function(ply, target, minutes, reason)
    Chat.SendMessage(ply, target[1]:GetName() .. " has been banned for " .. minutes .. " minutes for " .. reason)
end)