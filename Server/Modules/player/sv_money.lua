---`🔹 Server`<br>
---Set player money
---@param amount number
function Player:SetMoney(amount)
    self.money = amount
    self:TriggerClient("player:SetMoney", amount)
end

---`🔹 Server`<br>
---Add money to player
---@param amount number
function Player:AddMoney(amount)
    self.money = self.money + amount
    self:TriggerClient("player:SetMoney", self.money)
end

---`🔹 Server`<br>
---Remove money from player
---@param amount number
function Player:RemoveMoney(amount)
    self.money = self.money - amount
    self:TriggerClient("player:SetMoney", self.money)
end

---`🔹 Server`<br>
---Get player money
---@return number
function Player:GetMoney()
    return self.money
end