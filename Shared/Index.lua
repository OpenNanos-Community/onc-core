ONC = ONC or {}

Package.Require("Config/Modules.lua")
Package.Require("module_loader.lua")

Package.Subscribe("Load", function()
    Package.Export("ONC", ONC)
end)