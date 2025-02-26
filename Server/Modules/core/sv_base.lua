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