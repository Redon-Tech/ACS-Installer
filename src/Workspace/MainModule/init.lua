																																																					--[[
  _____               _                     _______                 _     
 |  __ \             | |                   |__   __|               | |    
 | |__) |   ___    __| |   ___    _ __        | |      ___    ___  | |__  
 |  _  /   / _ \  / _` |  / _ \  | '_ \       | |     / _ \  / __| | '_ \ 
 | | \ \  |  __/ | (_| | | (_) | | | | |      | |    |  __/ | (__  | | | |
 |_|  \_\  \___|  \__,_|  \___/  |_| |_|      |_|     \___|  \___| |_| |_|
															 ACS Installer
This script loads items into your game                                                                    
																																																						]]
local System = {}

function System.LoadACS()
	local folder = Instance.new("Folder")
	folder.Name = "ACSINSTALLERRT_TEMP_INSERT"
	folder.Parent = game
	for i,v in pairs(script.ACS:GetChildren()) do
		v.Parent = folder
	end
	return folder
end

return System