local tConfig = {}

--[[
Create jobs.
]]
tConfig.tJobs = {}

tConfig.tJobs["citizen"] = {
    ["sName"] = "Citizen",
    ["cColor"] = Color.FromRGBA(0, 122, 202, 255),
    ["tModels"] = {"nanos-world::SK_Male"},
    ["tWeapons"] = {},
    ["tAmmo"] = {},
    ["iSalary"] = 100,
    ["iMax"] = 100,
    ["iHealth"] = 100,
    ["iArmor"] = 0,
    ["sCategory"] = "Citizen"
}



--[[
Toggle settings.
Set some values.
]]
-- Set base job
tConfig.sBaseJob = "citizen"

-- Set Base Job Weapon
tConfig.tBasePlayerWeapon = {
    "Crowbar"
}

return tConfig