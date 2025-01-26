-- Internal function called when player dies
local function OnPlayerDeath(cChar, iLastDamage, sLastBoneDamage, iDamageReason, vHitDirection, pInstigator)
	local controller = cChar:GetPlayer()

	if not controller then return end

    -- Todo: Implement death logic

end

---`🔹 Server`<br>
---Spawn a character for the player
---@param vLocation Vector
---@param rRotation Rotator
function Player:Spawn(vLocation, rRotation)
	local new_char = SpawnCharacterRandomized(vLocation, rRotation)
	new_char:SetTeam(1)
    self:Possess(new_char)

    new_char:Subscribe("Death", OnPlayerCharacterDeath)

    new_char:Subscribe("UnPossess", function(self)
		self:Unsubscribe("Death", OnPlayerCharacterDeath)
	end)
end

-- Event called when a player spawn for the first time on the server
Player.Subscribe("Spawn", function(pPly)
	pPly:Spawn(pPly)

    Chat.BroadcastMessage(pPly:GetName().." has joined the server")
end)


Character.Subscribe("Respawn", function(character)
    -- Todo: Implement respawn logic
end)

-- Event called when a player leaves the server
Player.Subscribe("Destroy", function(pPly)
	local cChar = pPly:GetControlledCharacter()
	if cChar then
		cChar:Destroy()
	end

	Chat.BroadcastMessage(pPly:GetName().." has left the server")
end)