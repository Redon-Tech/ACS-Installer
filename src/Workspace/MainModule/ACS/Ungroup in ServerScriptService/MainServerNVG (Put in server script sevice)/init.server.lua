

--[[
	// NVG Script Package, scripted by spite90.
	
	//Report any bugs or other problems to my profile, or to my discord: Spite90#0692
--]]

script:WaitForChild("MainNVG").Parent = game.StarterPlayer.StarterPlayerScripts

script.Parent = game.ServerScriptService
nvgevent = Instance.new("RemoteEvent")
nvgevent.Name = "nvg"
nvgevent.Parent = game.ReplicatedStorage

local activenvgs = {}
local previoustoggle = {}

nvgevent.OnServerEvent:Connect(function(plr)
	if plr.Character then
		local helmet = plr.Character:FindFirstChild("Helmet")
		if helmet then
			local nvg = helmet:FindFirstChild("Up")
			if nvg then
				local id = plr.Name
				local prevtoggle = previoustoggle[id]
				local newt = time()
				if not prevtoggle or newt-prevtoggle > .6 then
					previoustoggle[id] = newt
					local bool
					if activenvgs[id] then
						activenvgs[id] = nil
						bool = false
					else
						activenvgs[id] = nvg
						bool = true
					end
					for _,v in pairs(game.Players:GetPlayers())do
						if v ~= plr then
							nvgevent:FireClient(v,nvg,bool)
						end
					end
				end	
			end
		end
	end	
end)


local enabledautolighting = script:WaitForChild("EnableAutoLighting")

if enabledautolighting.Value then
	
	local lighting = game.Lighting
	local secs = lighting.ClockTime*3600
	local speed = script:WaitForChild("TimeSpeed").Value

	game:GetService("RunService").Heartbeat:Connect(function(dt)
		secs = secs+dt*speed
		if secs >= 86400 then --seconds in a day
			secs = secs-86400
		end
		lighting.ClockTime = secs/3600
	end)

end

for _,v in pairs(script:GetChildren())do
	if string.match(v.ClassName,"Value") then
		v.Parent = game.ReplicatedStorage
	end
end


game.Players.PlayerAdded:Connect(function(plr)
	for _,nvg in pairs(activenvgs) do
		if nvg then
			nvgevent:FireClient(plr,nvg,true)
		end
	end
end)


