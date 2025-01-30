ONC.Modules = {
    [1] = {
        displayName = "Utils";
        pathName = "utils";
        files = {
            shared = {
                "sh_stringutils.lua"
            },
            server = {
            },
            client = {
                
            },
        }
    },

    [2] = {
        displayName = "Core";
        pathName = "core";
        files = {
            shared = {
            },
            server = {
                "sv_base.lua",
                "sv_money.lua"
            },
            client = {
                
            },
        }
    },


    [3] = {
        displayName = "Commands";
        pathName = "commands";
        files = {
            shared = {
                "sh_commands_config.lua",
                "sh_testcmd.lua"
            },
            server = {
                "sv_commands.lua",
                "sv_converters.lua",
                "sv_testcmd.lua"
            },
            client = {
                
            },
        },
    },
}