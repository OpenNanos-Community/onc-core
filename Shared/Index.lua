ONC = ONC or {}

Package.Require("/config/modules.lua")
Package.Require("/module_loader.lua")

Package.Subscribe("Load", function()
    Package.Export("ONC", ONC)
end)