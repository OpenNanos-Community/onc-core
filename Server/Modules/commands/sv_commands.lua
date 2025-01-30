ONC.Commands = ONC.Commands or {}
ONC.Commands.Registered = ONC.Commands.Registered or {}
ONC.Commands.Converters = ONC.Commands.Converters or {}

local registered_commands = ONC.Commands.Registered

function ONC.Commands.RegisterCommand(command_name, func)
    local config = ONC.Commands.Configurations[command_name]

    if (config == nil) then
        Console.Warn("[Commands] No suitable configuration found for the command '%s' please refer to the docs !", command_name)
        return
    end
    
    registered_commands[command_name] = {
        config = config,
        func = func
    }
end

function ONC.Commands.RegisterConverter(type_name, callback)
    ONC.Commands.Converters[type_name] = callback
end

Chat.Subscribe("PlayerSubmit", function(text, player)
    local given_args = StringUtils.Explode(" ", text)
    local command_name = string.sub(given_args[1], 2)

    -- Check if text starts with an "/"
    if (string.sub(given_args[1], 1, 1) ~= "/") then return end

    -- Check if command registered
    if (registered_commands[command_name] == nil) then return end

    local command = registered_commands[command_name]

    local command_config = command.config
    local converted_args = {}

    -- Goto should be avoided but in this case it's the best solution for keeping readable code
    if (not command_config.args or #command_config.args < 1) then 
        goto skipArgs 
    end

    -- If initially the player gives less arguments than the minimum
    if (#given_args - 1 < #command_config.args) then
        Chat.SendMessage(player, "syntax")
        return
    end

    for k, v in ipairs(command_config.args) do
        local given_arg = given_args[k+1]

        -- If no type specified in the config
        if (not v.type) then
            Console.Error("[Commands] Missing type in the command '%s', Aborting the command execution !", command_name)
            return
        end

        -- Return if the specified type doesn't have a converter
        if (not ONC.Commands.Converters[v.type]) then
            Console.Error("[Commands] Missing " ..v.type.. " converter, aborting the command execution !")
            return
        end

        -- If an arg has a default value and the given arg is "_", skip that argument
        if (v.default and given_arg == "_") then
            converted_args[k] = v.default
            goto continue
        end

        local converted = ONC.Commands.Converters[v.type](given_arg, player)

        -- If the conversion failed show the syntax message and abort
        if (not converted) then
            Chat.SendMessage(player, "syntax")
            return
        end

        converted_args[k] = converted

        -- If last arg and type is message
        if (k == #command_config.args and v.type == "message") then
            local text = ""
            for i = 1, #given_args - k do
                text = text .." ".. given_arg
            end

            converted_args[k] = text
        end

        ::continue::
    end


    -- Less arguments than needed after all conversions
    if (#converted_args < #command_config.args) then
        Chat.SendMessage(player, command:getSyntax())
        return
    end

    ::skipArgs::

    command.func(player, table.unpack(converted_args))
end)
