local tSql = Package.Require("config/storage.lua")
local xDatabase

if tSql.Activate then
    Database(DatabaseEngine[tSql.Credentials.databaseType], "db=database_filename.db timeout=2")
    Package.Require("sv_sql.lua")
else
    Package.Require("sv_files.lua")
end
