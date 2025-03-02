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

    Chat.BroadcastMessage(pPly:GetName().." has left the server")
end)

Package.Subscribe("Load", function()
	ONC.SqlExecute([[CREATE TABLE IF NOT EXISTS "onc_users" (
	"id" INTEGER AUTO_INCREMENT NOT NULL,
	"steamid" VARCHAR(100) NOT NULL,
	"account_id" VARCHAR(100) NOT NULL,
	"username" VARCHAR(100) NULL,
	"firstconnect" DATETIME NULL,
	"lastconnect" DATETIME NULL,
	"playtime" INTEGER NULL,
	PRIMARY KEY ("id")
    );]])

    ONC.SqlExecute([[CREATE TABLE IF NOT EXISTS "onc_characters" (
	"id" INTEGER NOT NULL,
	"account_id" VARCHAR(100) NOT NULL,
	"firstname" VARCHAR(100) NULL,
    "lastname" VARCHAR(100) NULL,
    "job" VARCHAR(100) NULL,
    "jobrank" VARCHAR(100) NULL,
    "money" INTEGER NULL,
    "blackmoney" INTEGER NULL,
    "bank" INTEGER NULL,
    "inventory" TEXT NULL,
    "bankinventory" TEXT NULL,
    "lastposition" TEXT NULL,
	PRIMARY KEY ("id")
    );]])
end)