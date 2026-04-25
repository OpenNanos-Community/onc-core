local tConfig = {}

--[[
Create jobs.
]]
tConfig.tJobs = {}

tConfig.iBaseSalary = 100

tConfig.tJobs["unemployed"] = {
    ["sName"] = "Unemployed",
    ["cColor"] = Color.FromRGBA(120, 120, 120, 255),
    ["tModels"] = {"nanos-world::SK_Male"},
    ["tWeapons"] = {},
    ["tAmmo"] = {},
    ["iSalary"] = 75,
    ["iMax"] = 0,
    ["iHealth"] = 100,
    ["iArmor"] = 0,
    ["sCategory"] = "Civil"
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