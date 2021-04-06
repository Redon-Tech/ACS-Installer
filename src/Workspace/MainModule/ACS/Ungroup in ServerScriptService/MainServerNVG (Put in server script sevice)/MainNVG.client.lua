local plr = game.Players.LocalPlayer
local nvgevent = game.ReplicatedStorage:WaitForChild("nvg")
local actionservice = game:GetService("ContextActionService")
local tweenservice = game:GetService("TweenService")
local colorcorrection = Instance.new("ColorCorrectionEffect")
colorcorrection.Parent = game.Lighting

--//DEFAULT VALUES

local defexposure = game.Lighting.ExposureCompensation

local nvg
local onanim
local gui
local offanim
local config
local onremoved
local setting
local helmet

function removehelmet()
	if plr.Character then
	onremoved:Disconnect()
	animating = false
	togglenvg(false)
	actionservice:UnbindAction("nvgtoggle")
	if gui then
		gui:Destroy()
	end
	if helmet then
		helmet:Destroy()
	end
	end
end

function oncharadded(newchar)
	newchar:WaitForChild("Humanoid").Died:connect(function()
		removehelmet()
	end)
	newchar.ChildAdded:connect(function(child)
		local removebutton
		if child.Name == "Helmet" then
			helmet = child
			gui = Instance.new("ScreenGui")
			gui.IgnoreGuiInset = true
			
			removebutton = Instance.new("TextButton")
			removebutton.Text = "Helmet"
			removebutton.Size = UDim2.new(.05,0,.035,0)
			removebutton.TextColor3 = Color3.new(.75,.75,.75)
			removebutton.Position = UDim2.new(.1,0,.3,0)
			removebutton.BackgroundTransparency = .45
			removebutton.BackgroundColor3 = Color3.fromRGB(124, 52, 38)
			removebutton.Font = Enum.Font.SourceSansBold
			removebutton.TextScaled = true
			removebutton.MouseButton1Down:connect(removehelmet)
			
			removebutton.Parent = gui
			gui.Parent = plr.PlayerGui
			
			onremoved = child.AncestryChanged:Connect(function(_, parent)
			if not parent then
					removehelmet()
				end
			end)
			
		end
		local newnvg = child:WaitForChild("Up",.5)
		if newnvg then
			nvg = newnvg
			config = require(nvg:WaitForChild("AUTO_CONFIG"))
			setting = nvg:WaitForChild("NVG_Settings")
			
			
			local noise = Instance.new("ImageLabel")
			noise.BackgroundTransparency = 1
			noise.ImageTransparency = 1
			
			local overlay = noise:Clone()
			overlay.Image = "rbxassetid://"..setting.OverlayImage.Value
			overlay.Size = UDim2.new(1,0,1,0)
			overlay.Name = "Overlay"
			
			local buttonpos = setting.RemoveButtonPosition.Value
			removebutton.Position = UDim2.new(buttonpos.X,0,buttonpos.Y,0)
			
			noise.Name = "Noise"
			noise.AnchorPoint = Vector2.new(.5,.5)
			noise.Position = UDim2.new(.5,0,.5,0)
			noise.Size = UDim2.new(2,0,2,0)
			
			
			overlay.Parent = gui
			noise.Parent = gui
	
			local info = config.tweeninfo

			local function addtweens(base,extra)
				if extra then
					for _,tween in pairs(extra)do
						table.insert(base,tween)
					end
				end
			end
			
			onanim = config.onanim
			offanim = config.offanim
			
			on_overlayanim = {
				tweenservice:Create(game.Lighting,info,{ExposureCompensation = setting.Exposure.Value}),
				tweenservice:Create(colorcorrection,info,{Brightness = setting.OverlayBrightness.Value,Contrast = .8,Saturation = -1,TintColor = setting.OverlayColor.Value}),
				tweenservice:Create(gui.Overlay,info,{ImageTransparency = 0}),
				tweenservice:Create(gui.Noise,info,{ImageTransparency = 0}),
			}
			
			
			off_overlayanim = {
				tweenservice:Create(game.Lighting,info,{ExposureCompensation = defexposure}),
				tweenservice:Create(colorcorrection,info,{Brightness = 0,Contrast = 0,Saturation = 0,TintColor = Color3.fromRGB(255, 255, 255)}),
				tweenservice:Create(gui.Overlay,info,{ImageTransparency = 1}),
				tweenservice:Create(gui.Noise,info,{ImageTransparency = 1})
			}
			
			
			actionservice:BindAction("nvgtoggle",function() togglenvg(not nvgactive) return Enum.ContextActionResult.Pass end, true, Enum.KeyCode.N)
			
		end
	end)
end

plr.CharacterAdded:connect(oncharadded)

local oldchar = workspace:FindFirstChild(plr.Name)
if oldchar then
	oncharadded(oldchar)
end


function playtween(tweentbl)
	spawn(function()
		for _,step in pairs(tweentbl) do
			if typeof(step) == "number" then
				wait(step)
			else
				step:Play()
			end
		end
	end)
end

function applyprops(obj,props)
	for propname,val in pairs(props)do
		obj[propname] = val
	end
end



function cycle(grain)
	local label = gui.Noise
	local source = grain.src
	local newframe
	repeat newframe = source[math.random(1, #source)]; 
	until newframe ~= grain.last 
	label.Image = 'rbxassetid://'..newframe
	local rand = math.random(230,255)
	label.Position = UDim2.new(math.random(.4,.6),0,math.random(.4,.6),0)
	label.ImageColor3 = Color3.fromRGB(rand,rand,rand)
	grain.last = newframe
end


function togglenvg(bool)
	if not animating and nvg then
		nvgevent:FireServer()
		gui.TextButton.Visible = not bool
		animating = true
		nvgactive = bool
		if config.lens then
			config.lens.Material = bool and "Neon" or "Glass"
		end
		if bool then
			playtween(onanim)
			delay(.75,function()
				playtween(on_overlayanim)
				spawn(function()
					while nvgactive do 
						cycle(config.dark)
						cycle(config.light)
						wait(0.05)
					end
				end)
				animating = false
			end)
		else
			playtween(offanim)
			delay(.5,function()
				playtween(off_overlayanim)
				animating = false
			end)
		end
	end	
end


nvgevent.OnClientEvent:connect(function(nvg,activate)
	local twistjoint = nvg:WaitForChild("twistjoint")
	local config = require(nvg.AUTO_CONFIG)
	local lens = config.lens
	if lens then
		lens.Material = activate and "Neon" or "Glass"
	end
	playtween(config[activate and "onanim" or "offanim"])
end)

local lighting = game.Lighting
local rs = game.ReplicatedStorage

local autolighting = rs:WaitForChild("EnableAutoLighting")

if autolighting.Value then
	
	function llerp(a,b,t)
		return a*(1-t)+b*t
	end
	
	local minbrightness = rs:WaitForChild("MinBrightness").Value
	local maxbrightness = rs:WaitForChild("MaxBrightness").Value
	local minambient = rs:WaitForChild("MinAmbient").Value
	local maxambient = rs:WaitForChild("MaxAmbient").Value
	local minoutdoor = rs:WaitForChild("MinOutdoorAmbient").Value
	local maxoutdoor = rs:WaitForChild("MaxOutdoorAmbient").Value

	function setdaytime()
		local newtime = lighting.ClockTime
		local middaydiff = math.abs(newtime-12)
		local f = (1-middaydiff/12)
		lighting.Brightness = llerp(minbrightness,maxbrightness,f)
		lighting.Ambient = minambient:lerp(maxambient,f)
		lighting.OutdoorAmbient = minoutdoor:lerp(maxoutdoor,f)
	end
	
	game:GetService("RunService").RenderStepped:connect(setdaytime)

end

