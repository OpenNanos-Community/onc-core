local shouldStop = false

local function checkStopCode(returned_code, filename)
   if (returned_code == -1) then
        Console.Log("stop called")
        shouldStop = true
        Console.Warn("test")
        -- Console.Warn("[Loader] Received stop code from: " ..filename)
        Server.UnloadPackage(Package.GetName())
   end
end

local function loadModules()
    -- mName : module name && mConfig : module configuration(ex: files, displayName)
    for k, mConfig in ipairs(ONC.Modules) do
        Console.Log("[Loader] Loading module: " ..mConfig.pathName)

        local isServer = _ENV["Server"] ~= nil and true or false;
        local moduleFiles = mConfig.files
        local packageName = Package.GetName()

        -- Shared include
        for _, sharedFile in ipairs(moduleFiles.shared) do
            if (shouldStop) then return end

            Console.Log("\tLoading SH file: " ..sharedFile)
            local path = packageName.. "/Shared/modules/" ..mConfig.pathName.. "/" ..sharedFile
            
            return_code = Package.Require(path)
            checkStopCode(return_code, path)
        end

        -- Server include
        if (isServer) then
            for _, serverFile in ipairs(moduleFiles.server) do
                if (shouldStop) then return end

                Console.Log("\tLoading SV file: " ..serverFile)
                local path = packageName.. "/Server/modules/" ..mConfig.pathName.. "/" ..serverFile

                return_code = Package.Require(path)
                checkStopCode(return_code, path)
            end
        end

        -- Client include
        if (not isServer) then
            for _, clientFile in ipairs(moduleFiles.client) do
                if (shouldStop) then return end

                Console.Log("\tLoading CL file: " ..clientFile)
                local path = packageName.. "/Client/modules/" ..mConfig.pathName.. "/" ..clientFile
                return_code = Package.Require(path)

                checkStopCode(return_code, path)
            end
        end
    end
end

loadModules()