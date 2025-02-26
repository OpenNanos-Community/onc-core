local tSql = Package.Require("config/storage.lua")
local xDatabase

if tSql.Activate then
    xDatabase = Database(DatabaseEngine[tSql.Credentials.databaseType], "host="..tSql.Credentials.host.." user="..tSql.Credentials.user.." password="..tSql.Credentials.password.." dbname="..tSql.Credentials.database.." port="..tSql.Credentials.port.." timeout=2")
else
    xDatabase = Database(DatabaseEngine[tSql.Credentials.databaseType], "db=database_filename.db timeout=2")
end

ONC.SetEntityData = function()
    -- Set the data of the player in the database
    
end