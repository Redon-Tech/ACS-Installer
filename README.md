# ACS-Installer
The Redon Tech ACS installer automatically installs ACS.

# Info
**This project is no longer maintained.**
This project uses RoJo, rojo does not give you UI elements so use the releases page to get the latest RBXLX file.

To use this system you need to upload MainModule to Roblox then grab that ID and go to ACSInstallation line 53 and change
```
local module = require(5999759422)
```
to
```
local module = require(the copied id)
```
and then upload your plugin and boom it works.