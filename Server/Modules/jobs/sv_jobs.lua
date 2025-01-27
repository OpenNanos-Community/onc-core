---`🔹 Server`<br>
---Set the job of a player
---@param iJob number
function Player:SetJob(iJob)
    self.iJob = iJob
end

---`🔹 Server`<br>
---Get the job of a player
---@return number
function Player:GetJob()
    return self.iJob
end
