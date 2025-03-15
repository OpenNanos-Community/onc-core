local tSql = Package.Require("Config/storage.lua")
-- Micro Optimizations
local tReturnFalse = {
     [0] = true
}

local xDatabase

if tSql.Activate then
    xDatabase = Database(DatabaseEngine[tSql.Credentials.databaseType], "host="..tSql.Credentials.host.." user="..tSql.Credentials.user.." password="..tSql.Credentials.password.." dbname="..tSql.Credentials.database.." port="..tSql.Credentials.port.." timeout=2")
else
    xDatabase = Database(DatabaseEngine.SQLite, "db=onc_storage.db timeout=2")
end

---`🔹 Server`<br>
---Execute a SQL code
---@param sSqlCode string
---@vararg any
---@return integer or string
function ONC.SqlExecute(sSqlCode, ...)
    -- Set the data of the player in the database
    return xDatabase:Execute(sSqlCode, ...)
end

---`🔹 Server`<br>
---Execute a SQL code asynchronously
---@param sSqlCode string
---@param CallBack function
---@vararg any
---@return integer or string
function ONC.SqlExecuteAsync(sSqlCode, CallBack, ...)
    -- Get the data of the player in the database
    return xDatabase:ExecuteAsync(sSqlCode, CallBack, ...)
end

---`🔹 Server`<br>
---Select data from the database
---@param sSqlCode string
---@vararg any
---@return table or string or boolean
function ONC.SqlSelect(sSqlCode, ...)
    -- Get the data of the player in the database
    local tData = xDatabase:Select(sSqlCode, ...)
    if tReturnFalse[#tData] then
        return false
    end
    return tData
end

---`🔹 Server`<br>
---Select data from the database asynchronously
---@param sSqlCode string
---@param CallBack function
---@vararg any
---@return table or string
function ONC.SqlSelectAsync(sSqlCode, CallBack, ...)
    -- Get the data of the player in the database
    return xDatabase:SelectAsync(sSqlCode, CallBack, ...)
end

---`🔹 Server`<br>
---Get the database type
---@return string
function ONC.SqlGetDatabaseType()
    return tSql.Credentials.databaseType
end