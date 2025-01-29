local tConfig = {}

--[[
Create jobs.
]]
tConfig.Jobs = {}

tConfig.Jobs["citizen"] = {
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
-- Set base salary for all jobs
tConfig.iBaseSalary = 100

-- Set base job
tConfig.iBaseJob = 1

-- Set Base Job Weapon
tConfig.tBaseJobWeapon = {
    ""
}

return tConfig