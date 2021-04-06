print("RT INSTALLATION SYSTEM: ACS Now loading into plugin, standby! Made by: parker02311 CEO of Redon Tech")

local debug = true -- Debug mode only for developers
local ToolBar = plugin:CreateToolbar("ACS Plugin")
local MainButton = ToolBar:CreateButton(0, "ACS Menu", "rbxassetid://4898743011", "Open the ACS Installer menu")
--local UninstallButton = ToolBar:CreateButton(4421567890, "Uninstall ACS", "rbxassetid://4898743645", "Uninstall ACS")
local SGUI = script.RTACSMenu
local InstallButton = SGUI.MainMenu.Buttons.InstallUpdate
local UninstallButton = SGUI.MainMenu.Buttons.Uninstall
local SettingsMenuButton = SGUI.MainMenu.Buttons.Settings
local LibaryButton = SGUI.MainMenu.Buttons.Libary
--local SettingsMenuButton = ToolBar:CreateButton(4521567890, "Settings Menu", "rbxassetid://4898743250", "Settings Menu")
--[[local tools = script.TOOLS
local RS = script["Ungroup in ReplicatedStorage"]
local SSS = script["Ungroup in ServerScriptService"]
local SoS = script["Ungroup in SoundService"]
local SCS = script["Ungroup in StarterCharacterScripts"]
local SPS = script["Ungroup in StarterPlayerScripts"]
local WS = script["Ungroup in Workspace"]]
local usingr15 = false

--\\ Setting Menu //--
local toollocation = game.StarterPack
local footsteps = true
local nvg = true
local daynight = true

print("RT INSTALLATION SYSTEM: ACS plugin has now loaded! Made by: parker02311 CEO of Redon Tech")
--\\ Main Fuctions //--

-- Check Avatar Type --
function checkavatar()
	if Enum.GameAvatarType.R15 then
		usingr15 = true
	elseif Enum.GameAvatarType.R6 then
		usingr15 = false
	elseif Enum.GameAvatarType.PlayerChoice then
		usingr15 = true
	else
		usingr15 = true
	end
end

-- Uninstall --
function Uninstall(Directory)
	for _, Child in pairs(Directory:GetChildren()) do
		if Child:FindFirstChild("RTPluginIdentifier") then if Child.RTPluginIdentifier.Value == "ACS" then Child:Destroy() end end
	end
end

-- Require MainModule --
function Require()
	local module = require(5999759422)
	return module
end

-- Setup --
function setup()
	-- GUI --
	local gui = script.RTACSLoading:Clone()
	gui.Name = "RTACSLoadingClone"
	gui.Parent = game.CoreGui
	gui.Enabled = true
	-- UNINSTALL --
	Uninstall(game.StarterPack)
	Uninstall(game.ReplicatedStorage)
	Uninstall(game.ServerScriptService)
	Uninstall(game.SoundService)
	Uninstall(game.StarterPlayer.StarterCharacterScripts)
	Uninstall(game.StarterPlayer.StarterPlayerScripts)
	Uninstall(game.Workspace)
	-- LOADING --
	local Module = Require()
	Module.LoadACS()
	wait(0.1)
	local Folder = game.ACSINSTALLERRT_TEMP_INSERT
	wait(0.1)
	local tools = Folder.TOOLS
	local RS = Folder["Ungroup in ReplicatedStorage"]
	local SSS = Folder["Ungroup in ServerScriptService"]
	local SoS = Folder["Ungroup in SoundService"]
	local SCS = Folder["Ungroup in StarterCharacterScripts"]
	local SPS = Folder["Ungroup in StarterPlayerScripts"]
	local WS = Folder["Ungroup in Workspace"]
	-- tools --
	local toolclone = tools:Clone()
	toolclone.Parent = toollocation
	for _, Child in pairs(toolclone:GetChildren()) do
	    Child.Parent = toolclone.Parent --Move the children up one parent
	end
	toolclone:Destroy()
	-- RS --
	local rsclone = RS:Clone()
	rsclone.Parent = game.ReplicatedStorage
	for _, Child in pairs(rsclone:GetChildren()) do
	    Child.Parent = rsclone.Parent --Move the children up one parent
	end
	rsclone:Destroy()
	-- SSS --
	local sssclone = SSS:Clone()
	sssclone.Parent = game.ServerScriptService
	for _, Child in pairs(sssclone:GetChildren()) do
	    Child.Parent = sssclone.Parent --Move the children up one parent
		if Child.ClassName == "Script" then
			Child.Disabled = false
		elseif Child.ClassName == "LocalScript" then
			Child.Disabled = false
		end
	end
	sssclone:Destroy()
	-- SoS --
	local sosclone = SoS:Clone()
	sosclone.Parent = game.SoundService
	for _, Child in pairs(sosclone:GetChildren()) do
	    Child.Parent = sosclone.Parent --Move the children up one parent
	end
	sosclone:Destroy()
	-- SCS --
	local scsclone = SCS:Clone()
	scsclone.Parent = game.StarterPlayer.StarterCharacterScripts
	for _, Child in pairs(scsclone:GetChildren()) do
	    Child.Parent = scsclone.Parent --Move the children up one parent
		if Child.ClassName == "Script" then
			Child.Disabled = false
		elseif Child.ClassName == "LocalScript" then
			Child.Disabled = false
		end
	end
	scsclone:Destroy()
	-- SPS --
	local spsclone = SPS:Clone()
	spsclone.Parent = game.StarterPlayer.StarterPlayerScripts
	for _, Child in pairs(spsclone:GetChildren()) do
	    Child.Parent = spsclone.Parent --Move the children up one parent
		if Child.ClassName == "Script" then
			Child.Disabled = false
		elseif Child.ClassName == "LocalScript" then
			Child.Disabled = false
		end
	end
	spsclone:Destroy()
	-- WS --
	local wsclone = WS:Clone()
	wsclone.Parent = game.Workspace
	for _, Child in pairs(wsclone:GetChildren()) do
	    Child.Parent = wsclone.Parent --Move the children up one parent
	end
	wsclone:Destroy()
	--[[ R15 Detector --
	script.R15Detector.Parent = game.StarterGui]]
	-- GUI --
	wait(0.1)
	--gui:Destroy()
	-- Settings Section --
	--[[
	local footsteps = true
	local nvg = true
	local daynight = true]]
	if footsteps == false then
		Uninstall(game.StarterPlayer.StarterPlayerScripts)
		Uninstall(game.SoundService)
	end
	if nvg == false then
		game.ServerScriptService["MainServerNVG (Put in server script sevice)"]:Destroy()
	end
	if daynight == false then
		if game.ServerScriptService:FindFirstChild("MainServerNVG (Put in server script sevice)") then
			game.ServerScriptService["MainServerNVG (Put in server script sevice)"].EnableAutoLighting.Value = false
		end
	end
	-- REMOVE FOLDER --
	Folder:Destroy()
	-- GUI --
	wait(1)
	gui:Destroy()
end

-- Warning System --
function warning(typeo)
	if typeo == "AvatarR6" then
		local warngui = script.RTACSWarning:Clone()
		warngui.Frame.Message.Text = "You are not using R6!"
		warngui.Frame.Note.Text = "ACS only works in R6!"
		warngui.Parent = game.CoreGui
		wait(5)
		warngui:Destroy()
	end
end

--\\ Button Fuctions //--

-- Install Button --
InstallButton.MouseButton1Down:Connect(function()
	checkavatar()
	wait(0.1)
	if debug == true then
		print(usingr15)
	end
	if usingr15 == false then
		setup()
	elseif usingr15 == true then
		warning("AvatarR6")
		setup()
	end
end)

-- Uninstall Button --
UninstallButton.MouseButton1Down:Connect(function()
	Uninstall(toollocation)
	Uninstall(game.ReplicatedStorage)
	Uninstall(game.ServerScriptService)
	Uninstall(game.SoundService)
	Uninstall(game.StarterPlayer.StarterCharacterScripts)
	Uninstall(game.StarterPlayer.StarterPlayerScripts)
	Uninstall(game.Workspace)
end)

-- Settings Menu --
--local SGUI = script.RTACSMenu
local menuopen = false
function MainButtonf()
	--local SGUI = script.RTACSMenu:Clone()
	if menuopen == false then
		menuopen = true
		if SGUI.Parent ~= game.CoreGui then
			SGUI.Parent = game.CoreGui
		end
		SGUI.Enabled = true
	elseif menuopen == true then
		menuopen = false
		--SGUI:Destroy()
		SGUI.Enabled = false
	end
end

local settingsopen = false
function SettingsButton()
	--local SGUI = script.RTACSMenu:Clone()
	if settingsopen == false then
		settingsopen = true
		SGUI.MainMenu.Visible = false
		SGUI.Settings.Visible = true
	elseif settingsopen == true then
		settingsopen = false
		SGUI.MainMenu.Visible = true
		SGUI.Settings.Visible = false
	end
end

local settingsframe = SGUI.Settings.ScrollingFrame

MainButton.Click:Connect(function() MainButtonf() end)
SettingsMenuButton.MouseButton1Down:Connect(function() SettingsButton() end)
SGUI.Settings.Close.MouseButton1Down:Connect(function() SettingsButton() end)

-- Tool location
SGUI.Settings.ScrollingFrame.ToolLocation.TextButton.MouseButton1Down:Connect(function()
	SGUI.Settings.ScrollingFrame.ToolLocation.ScrollingFrame.Visible = true
	SGUI.Settings.ScrollingFrame.ToolLocation.ScrollingFrame:TweenSize(UDim2.new(0.983, 0,1.004, 0))
end)
SGUI.Settings.ScrollingFrame.ToolLocation.ScrollingFrame.ServerStorage.MouseButton1Down:Connect(function()
	SGUI.Settings.ScrollingFrame.ToolLocation.ScrollingFrame:TweenSize(UDim2.new(0.983, 0,0, 0))
	wait(1)
	SGUI.Settings.ScrollingFrame.ToolLocation.ScrollingFrame.Visible = false
	toollocation = game.ServerStorage
end)
SGUI.Settings.ScrollingFrame.ToolLocation.ScrollingFrame.StarterPack.MouseButton1Down:Connect(function()
	SGUI.Settings.ScrollingFrame.ToolLocation.ScrollingFrame:TweenSize(UDim2.new(0.983, 0,0, 0))
	wait(1)
	SGUI.Settings.ScrollingFrame.ToolLocation.ScrollingFrame.Visible = false
	toollocation = game.StarterPack
end)

-- Footsteps
settingsframe.Footsteps.check_box.MouseButton1Down:Connect(function()
	if footsteps == true then
		footsteps = false
		settingsframe.Footsteps.check_box.Visible = false
		settingsframe.Footsteps.check_box_outline_blank.Visible = true
	elseif footsteps == false then
		footsteps = true
		settingsframe.Footsteps.check_box.Visible = true
		settingsframe.Footsteps.check_box_outline_blank.Visible = false
	end
end)
settingsframe.Footsteps.check_box_outline_blank.MouseButton1Down:Connect(function()
	if footsteps == true then
		footsteps = false
		settingsframe.Footsteps.check_box.Visible = false
		settingsframe.Footsteps.check_box_outline_blank.Visible = true
	elseif footsteps == false then
		footsteps = true
		settingsframe.Footsteps.check_box.Visible = true
		settingsframe.Footsteps.check_box_outline_blank.Visible = false
	end
end)
-- NVG and  DayNight
function updatedaynight()
	if nvg == false then
		daynight = false
		settingsframe.DayNightScript.check_box.Visible = false
		settingsframe.DayNightScript.check_box_outline_blank.Visible = true
		settingsframe.DayNightScript.check_box_outline_blank.ImageColor3 = Color3.fromRGB(100, 100, 100)
		settingsframe.DayNightScript.TextLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
	elseif nvg == true then
		daynight = true
		settingsframe.DayNightScript.check_box.Visible = true
		settingsframe.DayNightScript.check_box_outline_blank.Visible = false
		settingsframe.DayNightScript.check_box_outline_blank.ImageColor3 = Color3.fromRGB(255, 255, 255)
		settingsframe.DayNightScript.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end
settingsframe.NVGEdit.check_box.MouseButton1Down:Connect(function()
	if nvg == true then
		nvg = false
		settingsframe.NVGEdit.check_box.Visible = false
		settingsframe.NVGEdit.check_box_outline_blank.Visible = true
	elseif nvg == false then
		nvg = true
		settingsframe.NVGEdit.check_box.Visible = true
		settingsframe.NVGEdit.check_box_outline_blank.Visible = false
	end
	updatedaynight()
end)
settingsframe.NVGEdit.check_box_outline_blank.MouseButton1Down:Connect(function()
	if nvg == true then
		nvg = false
		settingsframe.NVGEdit.check_box.Visible = false
		settingsframe.NVGEdit.check_box_outline_blank.Visible = true
	elseif nvg == false then
		nvg = true
		settingsframe.NVGEdit.check_box.Visible = true
		settingsframe.NVGEdit.check_box_outline_blank.Visible = false
	end
	updatedaynight()
end)
settingsframe.DayNightScript.check_box.MouseButton1Down:Connect(function()
	if nvg == true then
		if daynight == true then
			daynight = false
			settingsframe.DayNightScript.check_box.Visible = false
			settingsframe.DayNightScript.check_box_outline_blank.Visible = true
		elseif daynight == false then
			daynight = true
			settingsframe.DayNightScript.check_box.Visible = true
			settingsframe.DayNightScript.check_box_outline_blank.Visible = false
		end
	end
end)
settingsframe.DayNightScript.check_box_outline_blank.MouseButton1Down:Connect(function()
	if nvg == true then
		if daynight == true then
			daynight = false
			settingsframe.DayNightScript.check_box.Visible = false
			settingsframe.DayNightScript.check_box_outline_blank.Visible = true
		elseif daynight == false then
			daynight = true
			settingsframe.DayNightScript.check_box.Visible = true
			settingsframe.DayNightScript.check_box_outline_blank.Visible = false
		end
	end
end)