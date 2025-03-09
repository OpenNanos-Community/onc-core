Input.Register("Scoreboard", "Tab")

Input.Bind("Scoreboard", InputEvent.Pressed, function()
    if (not ONC.BaseHUD or not ONC.BaseHUD:IsValid()) then return end
    ONC.BaseHUD:CallEvent("ONC::ToggleScoreboard", true)
    ONC.BaseHUD:BringToFront()
    Input.SetMouseEnabled(true)
end)

Input.Bind("Scoreboard", InputEvent.Released, function()
    if (not ONC.BaseHUD or not ONC.BaseHUD:IsValid()) then return end
    ONC.BaseHUD:CallEvent("ONC::ToggleScoreboard", false)
    Input.SetMouseEnabled(false)
    Input.SetInputEnabled(true)
end)

-- Updates someone scoreboard data
local function UpdatePlayerScoreboard(player)
	if (not ONC.BaseHUD or not ONC.BaseHUD:IsValid()) then return end
	ONC.BaseHUD:CallEvent("ONC::UpdatePlayerScoreboard", player:GetID(), player:GetName(), "user", "citizen", player:GetAccountIconURL(), player:GetPing())
end

--  Adds someone to the scoreboard
Player.Subscribe("Spawn", function(player)
	UpdatePlayerScoreboard(player)
end)


Package.Subscribe("Load", function()
	for k, player in pairs(Player.GetPairs()) do
		UpdatePlayerScoreboard(player)
	end
	-- TODO: Add Timer only when scoreboard is open to update the ping
end)

Events.SubscribeRemote("ONC::ServerName", function(serverName)
	if (not ONC.BaseHUD or not ONC.BaseHUD:IsValid()) then return end
	ONC.BaseHUD:CallEvent("ONC::InitScoreboard", serverName)
end)