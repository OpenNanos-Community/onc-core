local tConfig = Package.Require("Config/config.lua")
local tJobs = Package.Require("Config/jobs.lua")

-- Internal function called when player dies
-- Cant be localized due to error when is used in UnPossess event
function OnPlayerDeath(cChar, iLastDamage, sLastBoneDamage, iDamageReason, vHitDirection, pInstigator)
    local pCharController = cChar:GetPlayer()

    if not pCharController then return end

    -- Todo: Implement death logic

end

---`🔹 Server`<br>
---Spawn a character for the player
---@param vLocation Vector
---@param rRotation Rotator
function Player:Spawn(vLocation, rRotation)
    local cNewChar = Character(vLocation or Vector(0, 0, 0), rRotation or Rotator(0, 0, 0), "nanos-world::SK_Male")

    if not tConfig.bPVPDamage then
        cNewChar:SetTeam(1)
    end

    self:Possess(cNewChar)

    cNewChar:PickUp(NanosWorldWeapons.AK47(Vector(6931.17, 11625.8, 198.14), Rotator()))

    cNewChar:Subscribe("Death", OnPlayerDeath)

    cNewChar:Subscribe("UnPossess", function(pPly, cChar)
        cChar:Unsubscribe("Death", OnPlayerDeath)
    end)
end

-- Event called when a player spawn for the first time on the server
Player.Subscribe("Spawn", function(pPly)
    pPly:Spawn()

    ONC.SqlExecute([[INSERT INTO onc_users (account_id, steamid, username, firstconnect, lastconnect, playtime)
        VALUES (:0, :1, :2, DATETIME(:3), DATETIME(:3), 0) ON CONFLICT (account_id) DO UPDATE SET username = :2, lastconnect = DATETIME(:3);
    ]], pPly:GetAccountID(), pPly:GetSteamID(), pPly:GetName(), os.date("%Y-%m-%d %H:%M:%S"))

    Chat.BroadcastMessage(pPly:GetName().." has joined the server")
end)

-- Event called when a player respawns
Character.Subscribe("Respawn", function(cChar)
    if not tConfig.bRespawnSameTeam then
        cChar:SetJob(tConfig.sBaseJob)
    end
end)

-- Event called when a player leaves the server
Player.Subscribe("Destroy", function(pPly)
    local cChar = pPly:GetControlledCharacter()
    if cChar then
        cChar:Destroy()
    end

    ONC.SqlExecute([[UPDATE onc_users
    SET playtime = playtime + (unixepoch(lastconnect) - unixepoch('now')) WHERE account_id = :0;]], pPly:GetAccountID())

    Chat.BroadcastMessage(pPly:GetName().." has left the server")
end)

Package.Subscribe("Load", function()
	ONC.SqlExecute([[CREATE TABLE IF NOT EXISTS onc_users (
	account_id VARCHAR(255) NOT NULL,
	steamid VARCHAR(100) NOT NULL,
	username VARCHAR(100) NULL,
	firstconnect DATETIME NULL,
	lastconnect DATETIME NULL,
	playtime INTEGER NULL,
	PRIMARY KEY (account_id)
    );]])

    ONC.SqlExecute([[CREATE TABLE IF NOT EXISTS onc_characters (
	id INTEGER AUTO_INCREMENT NOT NULL,
	account_id VARCHAR(100) NOT NULL,
	firstname VARCHAR(100) NULL,
    lastname VARCHAR(100) NULL,
    birthdate DATETIME NULL,
    gender TINYINT(1) NULL,
    isdead TINYINT(1) NULL,
    health INTEGER NULL,
    armor INTEGER NULL,
    job VARCHAR(100) NULL,
    jobrank VARCHAR(100) NULL,
    money INTEGER UNSIGNED NULL,
    blackmoney INTEGER UNSIGNED NULL,
    bank INTEGER UNSIGNED NULL,
    inventory TEXT NULL,
    bankinventory TEXT NULL,
    lastposition TEXT NULL,
    licenses TEXT NULL,
	PRIMARY KEY (id)
    );]])
end)