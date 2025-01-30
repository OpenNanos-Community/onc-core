ONC.Commands = ONC.Commands or {}
ONC.Commands.Configurations = ONC.Commands.Configurations or {}

---@enum ONC.CooldownBucket
ONC.CooldownBucket = {
    Player = 1,
    Server = 2,
}

---@param command_name string
---@param config table
function ONC.Commands.RegisterCommandConfiguration(command_name, config)
    ONC.Commands.Configurations[command_name] = config
end