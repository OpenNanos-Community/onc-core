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
    -- mName : module name && tConfig : module configuration(ex: files, displayName)
    for k, tConfig in ipairs(ONC.Modules) do
        Console.Log("[Loader] Loading module: " .. tConfig.pathName)

        local bIsServer = _ENV["Server"] ~= nil and true or false
        local tModuleFiles = tConfig.files
        local sPackageName = Package.GetName()

        -- Shared include
        for _, sSharedFile in ipairs(tModuleFiles.shared) do
            if (bShouldStop) then return end

            Console.Log("\tLoading SH file: " ..sSharedFile)
            returnCode = Package.Require(sPackageName.. "/Shared/modules/" ..tConfig.pathName.. "/" ..sSharedFile)

            CheckStopCode(returnCode)

        end

        -- Server include
        if (bIsServer) then
            for _, serverFile in ipairs(tModuleFiles.server) do
                if (bShouldStop) then return end

                Console.Log("\tLoading SV file: " ..serverFile)
                returnCode = Package.Require(sPackageName.. "/Server/modules/" ..tConfig.pathName.. "/" ..serverFile)

                CheckStopCode(returnCode)
            end
        end

        -- Client include
        if (not bIsServer) then
            for _, clientFile in ipairs(tModuleFiles.client) do
                if (bShouldStop) then return end

                Console.Log("\tLoading CL file: " ..clientFile)
                returnCode = Package.Require(sPackageName.. "/Client/modules/" ..tConfig.pathName.. "/" ..clientFile)

                CheckStopCode(returnCode)
            end
        end
    end
end

LoadModules()