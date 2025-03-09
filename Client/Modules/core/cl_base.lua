Events.SubscribeRemote("ONC::CharacterInformationUpdate", function(tData)
    ONC.BaseHUD:CallEvent("ONC::UpdateName", Client.GetLocalPlayer():GetName())
end)