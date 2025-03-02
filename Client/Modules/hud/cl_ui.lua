Client.Subscribe("SpawnLocalPlayer", function(pLocal)
	pLocal:Subscribe("Possess", function(pPly, cChar)
        ONC.BaseHUD:CallEvent("ONC::UpdateHealth", cChar:GetHealth())
        
        cChar:Subscribe("HealthChange", function(cCharacter, iOldHealth, iNewHealth)
            -- Immediatelly Updates the Health UI
            ONC.BaseHUD:CallEvent("ONC::UpdateHealth", iNewHealth)
        end)
	end)
end)