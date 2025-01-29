local tJobsConfig = Package.Require("Config/jobs.lua")
local tJobs = {}

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

---`🔹 Server`<br>
---Create a job
---@param sName string
---@param cColor color
---@param iJob number
---@param tWeapons table
---@param tModels table
---@param tAmmo table
---@param iHealth table
---@param iArmor table
---@return table
function CreateJob(sName, sJobIdentifier, cColor, tModels, tWeapons, tAmmo, iSalary, iMax, iHealth, iArmor, sCategory)
    tJobs[sJobIdentifier] = {
        ["sName"] = sName or "Citizen",
        ["cColor"] = cColor or Color.FromRGBA(0, 122, 202, 255),
        ["tModels"] = tModels or {"nanos-world::SK_Male"},
        ["tWeapons"] = tWeapons or {},
        ["tAmmo"] = tAmmo or {},
        ["iSalary"] = iSalary or tJobsConfig.iBaseSalary,
        ["iMax"] = iMax or 0,
        ["iHealth"] = iHealth or 100,
        ["iArmor"] = iArmor or 0,
        ["sCategory"] = sCategory or "Citizen"
    }
    return Jobs[iJob]
end