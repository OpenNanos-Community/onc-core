# onc_core
RPG Framework for Nanos World

## Current Core Scope

This package currently provides a basic RP foundation with:
- player spawn and character initialization
- SQL persistence helpers
- basic jobs and money methods
- module loader by configuration

This README reflects functions that actually exist in the code right now.

## Server Functions

### Core Module

- `OnPlayerDeath(cChar, iLastDamage, sLastBoneDamage, iDamageReason, vHitDirection, pInstigator)`
- `Player:Spawn(vLocation, rRotation)`

Server subscriptions in this module:
- `Player.Subscribe("Spawn", function(pPly) ... end)`
- `Character.Subscribe("Respawn", function(cChar) ... end)`
- `Player.Subscribe("Destroy", function(pPly) ... end)`
- `Events.SubscribeRemote("ONC::SendCharacterInformation", function(pPly, sFirstName, sLastName, sBirthDate) ... end)`
- `Package.Subscribe("Load", function() ... end)`

### Jobs Module

- `Player:SetJob(iJob)`
- `Player:GetJob()`
- `CreateJob(sName, sJobIdentifier, cColor, tModels, tWeapons, tAmmo, iSalary, iMax, iHealth, iArmor, sCategory)`

### Money Module

- `Player:SetMoney(amount)`
- `Player:AddMoney(amount)`
- `Player:RemoveMoney(amount)`
- `Player:GetMoney()`

### Storage (SQL) Module

- `ONC.SqlExecute(sSqlCode, ...)`
- `ONC.SqlExecuteAsync(sSqlCode, CallBack, ...)`
- `ONC.SqlSelect(sSqlCode, ...)`
- `ONC.SqlSelectAsync(sSqlCode, CallBack, ...)`
- `ONC.SqlGetDatabaseType()`

## Client Functions

### Core Module

Client subscription currently present:
- `Events.SubscribeRemote("ONC::CharacterInformationUpdate", function(tData) ... end)`

## Shared Functions

### Module Loader

Internal loader helpers:
- `CheckStopCode(iReturnedCode)`
- `LoadModules()`

## Network Events Currently Used

### Client -> Server

- `ONC::SendCharacterInformation`

### Server -> Client

- `ONC::CharacterInformationUpdate`
- `ONC::StartCreateCharacter`

## Database Tables Created

On package load, the following tables are created (if missing):
- `onc_users`
- `onc_characters`

## Configuration Files

- `Shared/Config/Config.lua`
- `Shared/Config/Jobs.lua`
- `Shared/Config/Modules.lua`
- `Server/Config/Storage.lua`

## Notes

- Module loading order and active modules are controlled by `Shared/Config/Modules.lua`.
- Current active modules are `storage` and `core`.
- The current client core expects `ONC.BaseHUD` to exist when receiving `ONC::CharacterInformationUpdate`.
