local tSql = {}

-- Activate or deactivate the SQL registration (true/false)
-- If is desactivated, the data will be stored in the file of the server
-- -----> Information: The SQL registration is the best way to store data, it is fully recommended to use it. (increase the performance of your server) <-----
tSql.Activate = false 

tSql.Credentials = {
    databaseType = "SQLite", -- SQLite / MySQL / PostgreSQL (write the name of the database type you are using exacly as it is written here)
    host = "127.0.0.1",
    user = "root",
    password = "",
    database = "",
    port = 3306
}

return tSql