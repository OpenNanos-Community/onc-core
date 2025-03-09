Client.Subscribe("SpawnLocalPlayer", function(pLocal)
	pLocal:Subscribe("Possess", function(pPly, cChar)
        ONC.BaseHUD:CallEvent("ONC::ToggleCharacterCreator")
        Input.SetMouseEnabled(true)
        Input.SetInputEnabled(false)
        ONC.BaseHUD:BringToFront()

        ONC.BaseHUD:Subscribe("ONC::CreateCharacter", function(firstName, lastName, dob)
            -- TODO: Add server event
            Input.SetMouseEnabled(false)
            Input.SetInputEnabled(true)
        end)
    end)
end)