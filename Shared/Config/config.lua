local tConfig = {}

--[[
Toggle settings.
Set to true or false.
]]
-- Enable or diable respawn in the same team as the one before death
tConfig.bRespawnSameTeam = true

-- Enable or disable respawn in the same location as the one before death
tConfig.bRespawnSameLocation = true

-- Enable or disable ONC F4 Menu
tConfig.bUseONCF4 = true

-- Enable or disable ONC Scoreboard
tConfig.bUseONCScoreboard = true

-- Enable or disable ONC HUD
tConfig.bUseONCHud = true

-- Save player's data on disconnect (health, armor, weapons, ammo, position, team, etc)
tConfig.bDisconnectSaveData = true

-- Enable or disable PVP Damage
tConfig.bPVPDamage = true


--[[
Value settings
]]
-- Time in seconds to respawn after death
tConfig.iRespawnTime = 5

-- Walk speed
tConfig.iWalkSpeed = 200

-- Run speed
tConfig.iRunSpeed = 400

-- Jump power
tConfig.iJumpPower = 200

return tConfig