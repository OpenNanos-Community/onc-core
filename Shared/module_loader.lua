local bShouldStop = false

-- Function used internally
-- Check if the return code is -1, if so, stop the package
local function CheckStopCode(iReturnedCode)
    if (iReturnedCode == -1) then
        bShouldStop = true
        Server.UnloadPackage(Package.GetName())
    end
end

-- Function used internally
-- Load all modules
local function LoadModules()
    -- Local variables cache
    local iReturnCode = 0
    local bIsServer = _ENV["Server"] ~= nil and true or false
    local tModuleFiles = {}

    -- mName : module name && tConfig : module configuration(ex: files, displayName)
    for k, tConfig in ipairs(ONC.Modules) do
        Console.Log("[Loader] Loading module: " .. tConfig.pathName)

        tModuleFiles = tConfig.files

        -- Shared include
        for _, sSharedFile in ipairs(tModuleFiles.shared) do
            if bShouldStop then return end

            Console.Log("\tLoading SH file: " .. sSharedFile)
            iReturnCode = Package.Require("/modules/" .. tConfig.pathName .. "/" .. sSharedFile)

            CheckStopCode(iReturnCode)
        end

        -- Server include
        if bIsServer then
            for _, sServerFile in ipairs(tModuleFiles.server) do
                if bShouldStop then return end

                Console.Log("\tLoading SV file: " .. sServerFile)
                iReturnCode = Package.Require("/modules/" .. tConfig.pathName .. "/" .. sServerFile)

                CheckStopCode(iReturnCode)
            end
        end

        -- Client include
        if not bIsServer then
            for _, clientFile in ipairs(tModuleFiles.client) do
                if bShouldStop then return end

                Console.Log("\tLoading CL file: " .. clientFile)
                iReturnCode = Package.Require("/modules/" .. tConfig.pathName .. "/" .. clientFile)

                CheckStopCode(iReturnCode)
            end
        end
    end
end

LoadModules()