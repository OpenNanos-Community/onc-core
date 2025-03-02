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
                "sv_sql.lua"
            },
            client = {
                
            },
        }
    },
    [3] = {
        displayName = "HUD";
        pathName = "hud";
        files = {
            shared = {
            },
            server = {
            },
            client = {
                "cl_ui.lua"
            },
        }
    },
    [4] = {
        displayName = "Character Creator";
        pathName = "character-creator";
        files = {
            shared = {
            },
            server = {
            },
            client = {
                "cl_ui.lua"
            },
        }
    },
}

return tModules