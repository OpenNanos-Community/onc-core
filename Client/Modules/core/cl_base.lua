Events.SubscribeRemote("ONC::CharacterInformationUpdate", function(tData)
    ONC.BaseHUD:CallEvent("ONC::UpdateName", tData["firstname"].." "..tData["lastname"])
end)