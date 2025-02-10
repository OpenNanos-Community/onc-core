local tSql = {}

-- Activate or deactivate the SQL registration (true/false)
-- Information: The SQL registration is the best way to store data, it is fully recommended to use it. (increase the performance of your server)
tSql.Activate = false 

tSql.Credentials = {
    databaseType = "SQLite", -- SQLite / MySQL / PostgreSQL (write the name of the database type you are using exacly as it is written here)
    host = "",
    user = "",
    password = "",
    database = "",
    port = 3306
}

return tSql