ONC = ONC or {}
-- Player
Package.Require("Modules/player/sv_base.lua")
Package.Require("Modules/player/sv_money.lua")

-- Jobs
Package.Require("Modules/jobs/sv_jobs.lua")

-- Export the ONC table
Package.Export("ONC", ONC)