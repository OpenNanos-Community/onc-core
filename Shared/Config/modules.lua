local tModules = {
    [1] = {
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
    [2] = {
        displayName = "Storage";
        pathName = "storage";
        files = {
            shared = {
            },
            server = {
                "sv_utils.lua"
            },
            client = {
                
            },
        }
    }
}

return tModules