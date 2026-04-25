local tConfig = {}

--[[
Toggle settings.
Set to true or false.
]]
-- Enable or diable respawn in the same team as the one before death
tConfig.bRespawnSameTeam = true

-- Enable or disable respawn in the same location as the one before death
tConfig.bRespawnSameLocation = true

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

-- Economy defaults for a new character
tConfig.iStartCash = 500
tConfig.iStartBank = 2500
tConfig.iStartBlackMoney = 0

return tConfig