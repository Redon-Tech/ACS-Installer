---------------------------------------------------------------|
------// SETTINGS //-------------------------------------------|
---------------------------------------------------------------|

local FireRate = 400

local LimbsDamage = {45,50}
local TorsoDamage = {67,72}
local HeadDamage = {130,140}
local FallOfDamage = 1
local BulletPenetration = 65

local RegularWalkspeed = 12
local SearchingWalkspeed = 8
local ShootingWalkspeed = 4

local Spread = 4

local MinDistance = 100
local MaxInc = 16

local Mode = 2


local Tracer = true
local TracerColor = Color3.fromRGB(255,255,255)

local BulletFlare = false
local BulletFlareColor = Color3.fromRGB(255,255,255)

---------------------------------------------------------------|
---------------------------------------------------------------|
---------------------------------------------------------------|
local Debris = game.Debris

local Engine = game.ReplicatedStorage:WaitForChild("ACS_Engine")
local Evt = Engine:WaitForChild("Eventos")
local ServerConfig = require(Engine.ServerConfigs:WaitForChild("Config"))

local Settings = script.Parent.ACS_Modulo:WaitForChild("Config")

local ACS_Storage = workspace:WaitForChild("ACS_WorkSpace")

local Modulos = Engine:WaitForChild("Modulos")

local Hitmarker = require(Modulos:WaitForChild("Hitmarker"))
local Ragdoll = require(Modulos:WaitForChild("Ragdoll"))

local Ignore_Model = ACS_Storage:FindFirstChild("Server")

local BulletModel = ACS_Storage:FindFirstChild("Client")

local Ray_Ignore = {Ignore_Model, BulletModel, ACS_Storage}

local Dead = false

wait(3)
script.Parent.ForceField:Destroy()

script.Parent.Humanoid.Died:connect(function()
	Ragdoll(script.Parent)
	if script.Parent:FindFirstChild("Gun") ~= nil then
		script.Parent.Gun.CanCollide = true
	end
	Dead = true
	Debris:AddItem(script.Parent,game.Players.RespawnTime)
end)

local CanSee = false
local CurrentPart = nil

function onTouched(hit)
	if hit.Parent == nil then
		return
	end

	local humanoid = hit.Parent:findFirstChild("Humanoid")

	if humanoid == nil then
		CurrentPart = hit
	end
end

function waitForChild(parent, childName)
	local child = parent:findFirstChild(childName)

	if child then
		return child
	end

	while true do
		--print(childName)

		child = parent.ChildAdded:wait()

		if child.Name==childName then
			return child
		end
	end
end

local Figure = script.Parent
local Humanoid = waitForChild(Figure, "Humanoid")
local Torso = waitForChild(Figure, "Torso")
local Left = waitForChild(Figure, "Left Leg")
local Right = waitForChild(Figure, "Right Leg")

Left.Touched:connect(onTouched)
Right.Touched:connect(onTouched)

function getHumanoid(model)
	for _, v in pairs(model:GetChildren())do
		if v:IsA'Humanoid' then
			return v
		end
	end
end


local zombie = script.Parent
local human = getHumanoid(zombie)
local hroot = zombie.Torso
local head = zombie:FindFirstChild'Head'

local pfs = game:GetService("PathfindingService")
local players = game:GetService('Players')

local RecoilSpread = Spread/100
local perception = 0
local Memory = 0


wait(.1)

local ammo=Settings.Ammo.Value -- How much ammo the Enemy has
local w=.14
local RPM = 1/(FireRate/60)
local r=false
local t=script.Parent


local h=t:WaitForChild'Grip'

function Hitmaker(HitPart, Position, Normal, Material)
	
	Evt.Hit:FireAllClients(nil,Position,HitPart,Normal,Material,nil)
	
end


function CheckForHumanoid(L_225_arg1)
	local L_226_ = false
	local L_227_ = nil
	if L_225_arg1 then
		if (L_225_arg1.Parent:FindFirstChild("Humanoid") or L_225_arg1.Parent.Parent:FindFirstChild("Humanoid")) then
			L_226_ = true
			if L_225_arg1.Parent:FindFirstChild('Humanoid') then
				L_227_ = L_225_arg1.Parent.Humanoid
			elseif L_225_arg1.Parent.Parent:FindFirstChild('Humanoid') then
				L_227_ = L_225_arg1.Parent.Parent.Humanoid
			end
		else
			L_226_ = false
		end	
	end
	return L_226_, L_227_
end

function CalcularDano(DanoBase,Dist,Vitima,Type)

	local damage = 0
	local VestDamage = 0
	local HelmetDamage = 0
	local Traveleddamage = DanoBase-(math.ceil(Dist)/40)*FallOfDamage
	if Vitima.Parent:FindFirstChild("Saude") ~= nil then

				local Vest =  Vitima.Parent.Saude.Protecao.VestVida
				local Vestfactor = Vitima.Parent.Saude.Protecao.VestProtect
				local Helmet = Vitima.Parent.Saude.Protecao.HelmetVida
				local Helmetfactor = Vitima.Parent.Saude.Protecao.HelmetProtect

		if Type == "Head" then
				if Helmet.Value > 0 and (BulletPenetration) < Helmetfactor.Value  then
					damage = Traveleddamage * ((BulletPenetration)/Helmetfactor.Value)
					HelmetDamage = (Traveleddamage * ((100 - BulletPenetration)/Helmetfactor.Value))
				
					if HelmetDamage <= 0 then
					HelmetDamage = 0.5
					end
					
				elseif Helmet.Value > 0 and (BulletPenetration) >= Helmetfactor.Value then
					damage = Traveleddamage
					HelmetDamage = (Traveleddamage * ((100 - BulletPenetration)/Helmetfactor.Value))
					
					if HelmetDamage <= 0 then
					HelmetDamage = 1
					end				

				elseif Helmet.Value <= 0 then
					damage = Traveleddamage
	
				end
			else
				if Vest.Value > 0 and (BulletPenetration) < Vestfactor.Value  then
					damage = Traveleddamage * ((BulletPenetration)/Vestfactor.Value)
					VestDamage = (Traveleddamage * ((100 - BulletPenetration)/Vestfactor.Value))
				
					if VestDamage <= 0 then
					VestDamage = 0.5
					end
					
				elseif Vest.Value > 0 and (BulletPenetration) >= Vestfactor.Value then
					damage = Traveleddamage
					VestDamage = (Traveleddamage * ((100 - BulletPenetration)/Vestfactor.Value))
					
					if VestDamage <= 0 then
					VestDamage =  1
					end				

				elseif Vest.Value <= 0 then
					damage = Traveleddamage
	
				end
			end
		else
			damage = Traveleddamage
	end			
		if damage <= 0 then
			damage = 1
		end

	return damage,VestDamage,HelmetDamage
end

function Damage(VitimaHuman,Dano,DanoColete,DanoCapacete)
	if VitimaHuman.Parent:FindFirstChild("Saude") ~= nil then
	local Colete = VitimaHuman.Parent.Saude.Protecao.VestVida
	local Capacete = VitimaHuman.Parent.Saude.Protecao.HelmetVida
		Colete.Value = Colete.Value - DanoColete
		Capacete.Value = Capacete.Value - DanoCapacete
	end
	VitimaHuman:TakeDamage(Dano)
end

local function reload(boo)
	if(boo and ammo ~= Settings.Ammo.Value)or ammo==0 then
		r=true
		if w then
			w=.03
		end
		h.Reload:Play()
		wait(3) -- How long the Enemy reloads
		ammo= Settings.Ammo.Value
		if w then
			w=.14
		end
		r=false
	elseif boo then
		wait(.1)
	end
end
local function near()
if not Dead then
	local dis,pl= Settings.ShotDistance.Value ,nil -- Range of the Enemy
	for _,v in ipairs(game.Players:GetPlayers())do
		if v.Character and v.Character:FindFirstChild'Humanoid'and v:DistanceFromCharacter(h.Position)<dis then
			dis,pl=v:DistanceFromCharacter(h.Position),v
		end
	end
	if pl then
		return pl.Character:GetModelCFrame(),dis,CFrame.new(pl.Character.Humanoid.WalkToPoint).lookVector
	else
		return nil
	end
end
end

-- no touchy
local path = pfs:CreatePath()
local waypoint
local currentWaypointIndex
local target

function findNearestTorso(pos)
	local list = game.Workspace:children()
	local torso = nil
	local dist = Settings.WalkDistance.Value
	local temp = nil
	local human = nil
	local temp2 = nil
	for x = 1, #list do
		temp2 = list[x]
		if (temp2.className == "Model") and (temp2 ~= script.Parent) then
			temp = temp2:findFirstChild("HumanoidRootPart")
			human = temp2:findFirstChild("Humanoid")
			if (temp ~= nil) and (human ~= nil) and (human.Health > 0) and players:GetPlayerFromCharacter(human.Parent)~= nil then
				if (temp.Position - pos).magnitude < dist then
					torso = temp
					dist = (temp.Position - pos).magnitude
				end
			end
		end
	end
	return torso
end


--spawn(function()
	--while wait()do


-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
local PathfindingService = game:GetService("PathfindingService")
 
-- Variables for the zombie, its humanoid, and destination
local zombie = hroot
local destination
 
-- Create the path object
local path = PathfindingService:CreatePath()
 
-- Variables to store waypoints table and zombie's current waypoint
local waypoints
local currentWaypointIndex
 
local function followPath(destinationObject)
	-- Compute and check the path
	path:ComputeAsync(zombie.Position, destinationObject)
	-- Empty waypoints table after each new path computation
	waypoints = {}
 
	if path.Status == Enum.PathStatus.Success then
		-- Get the path waypoints and start zombie walking
		waypoints = path:GetWaypoints()
		-- Move to first waypoint
		currentWaypointIndex = 1
		human:MoveTo(waypoints[currentWaypointIndex].Position)
	else
		-- Error (path not found); stop humanoid
		human:MoveTo(zombie.Position)
	end
end
 
local function onWaypointReached(reached)
	if reached and waypoints ~= nil and currentWaypointIndex ~= nil and currentWaypointIndex < #waypoints then
		currentWaypointIndex = currentWaypointIndex + 1
		human:MoveTo(waypoints[currentWaypointIndex].Position)
	end
end
 
local function onPathBlocked(blockedWaypointIndex)
	-- Check if the obstacle is further down the path
	if blockedWaypointIndex > currentWaypointIndex then
		-- Call function to re-compute the path
		followPath(destination)
	end
end
 
-- Connect 'Blocked' event to the 'onPathBlocked' function
path.Blocked:Connect(onPathBlocked)
 
-- Connect 'MoveToFinished' event to the 'onWaypointReached' function
human.MoveToFinished:Connect(onWaypointReached)
 
--followPath(destination)
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------


function AI()

	if Mode == 0 then
			--waypoint = nil
			--print("Patrol mode")
			wait(math.random(5,15)/10)
			followPath(hroot.Position + Vector3.new(math.random(-MaxInc, MaxInc), 0, math.random(-MaxInc, MaxInc)))

			--human:MoveTo(zombie.Torso.Position + Vector3.new(math.random(-MaxInc, MaxInc), 0, math.random(-MaxInc, MaxInc)), CurrentPart)

	elseif Mode == 1 then

		target = findNearestTorso(hroot.Position)

		if target ~= nil then
		if CanSee == true and (hroot.Position - target.Position).Magnitude <= MinDistance then
			waypoint = nil
		else
			
		path:ComputeAsync(hroot.Position, target.Position)
		waypoint = path:GetWaypoints()

		local connection;
		local function checkw(t)
			local ci = 3
			if ci > #t then
				ci = 3
			end
			if t[ci] == nil and ci < #t then
				repeat ci = ci + 1 wait() until t[ci] ~= nil
				return Vector3.new(1,0,0) + t[ci]
			else
				ci = 3
				return t[ci]
			end
		end
		if path.Status == Enum.PathStatus.Success then
			--print("Chasing "..target.Parent.Name)
			human.WalkToPart = nil
		if  waypoint or checkw(waypoint) then
			if checkw(waypoint) ~= nil and checkw(waypoint).Action == Enum.PathWaypointAction.Walk then
				human:MoveTo( checkw(waypoint).Position)
			end
			
			
			if connection then
				connection:Disconnect()
			end
			
		else
			for i = 3, #waypoint do
				human:MoveTo( waypoint[i].Position )	
			end
		end
		else
			--print("No Path,Patrolling")
			wait(math.random(5,15)/10)
			followPath(hroot.Position + Vector3.new(math.random(-MaxInc, MaxInc), 0, math.random(-MaxInc, MaxInc)))

		end
		end
		end
	elseif Mode == 2 then

		target = findNearestTorso(hroot.Position)

		if target ~= nil then
		if CanSee == true and (hroot.Position - target.Position).Magnitude <= MinDistance then
			waypoint = {}
			waypoint = nil
		else
			
		path:ComputeAsync(hroot.Position, target.Position)
		waypoint = path:GetWaypoints()

		local connection;
		local function checkw(t)
			local ci = 3
			if ci > #t then
				ci = 3
			end
			if t[ci] == nil and ci < #t then
				repeat ci = ci + 1 wait() until t[ci] ~= nil
				return Vector3.new(1,0,0) + t[ci]
			else
				ci = 3
				return t[ci]
			end
		end
		if path.Status == Enum.PathStatus.Success and Memory > 0 then
			--print("Chasing "..target.Parent.Name)
			human.WalkToPart = nil
			if  waypoint or checkw(waypoint) then
				if checkw(waypoint) ~= nil and checkw(waypoint).Action == Enum.PathWaypointAction.Walk then
					human:MoveTo( checkw(waypoint).Position )
				end
			
			
				if connection then
					connection:Disconnect()
				end
			
			else
				for i = 3, #waypoint do
					human:MoveTo( waypoint[i].Position )	
				end
			end
		else
			waypoint = nil
			--print("No Path,Patrolling")
			wait(math.random(5,15)/10)
			followPath(hroot.Position + Vector3.new(math.random(-MaxInc, MaxInc), 0, math.random(-MaxInc, MaxInc)))

		end
		end
		end
	elseif Mode == 3 then
		--	print("Guarding")
	end	
end
--end)

while true do

	if Dead then
		break
	end

	AI()

	local n,mag,hum=near()
	if n and not Dead then
		n=n.p
		if not r then
			w=.14
			local dir=h.Position-n
			local tst ,_ =workspace:FindPartOnRay(Ray.new(t.Torso.Position,(n-t.Torso.Position).Unit*999),t)
			local aim =n+Vector3.new(math.random(-mag*RecoilSpread,mag*RecoilSpread),math.random(-mag*RecoilSpread,mag*RecoilSpread),math.random(-mag*RecoilSpread,mag*RecoilSpread))+hum
			

			if tst and not Dead then
				
				local FoundHuman,VitimaHuman = CheckForHumanoid(tst)
				if FoundHuman == true and VitimaHuman.Health > 0 and game.Players:GetPlayerFromCharacter(VitimaHuman.Parent) and perception >= 10 then
				

				function lookAt(target, eye)
   					local forwardVector = (eye - target).Unit
   					local upVector = Vector3.new(0, 1, 0)
  					  -- You have to remember the right hand rule or google search to get this right
  					local rightVector = forwardVector:Cross(upVector)
   					local upVector2 = rightVector:Cross(forwardVector)
 							
   					 return CFrame.fromMatrix(eye, rightVector, upVector2)
				end

				local direction = (n+hum)-h.CFrame.LookVector
				script.Parent:SetPrimaryPartCFrame(CFrame.new(t.Head.CFrame.Position,Vector3.new(direction.X,h.CFrame.Y,direction.Z)))

				Evt.ACS_AI.AIShoot:FireAllClients(h)
				h.Echo:Play()
				h.Fire:Play()
				local par, pos, Norm, Mat = workspace:FindPartOnRay(Ray.new(h.Position,(aim-h.Position).Unit*999),t)
				if par and not Dead then

				Hitmaker(par, pos, Norm, Mat)
					local FoundHuman,VitimaHuman = CheckForHumanoid(par)
					if FoundHuman == true and VitimaHuman.Health > 0 and game.Players:GetPlayerFromCharacter(VitimaHuman.Parent) then
					local TotalDistTraveled = (pos - h.Position).Magnitude
					 ------ How much damage the gun inflicts
					if par.Name == "Head" or par.Parent.Name == "Top" or par.Parent.Name == "Headset" or par.Parent.Name == "Olho" or par.Parent.Name == "Face" or par.Parent.Name == "Numero" then
						local DanoBase = math.random(HeadDamage[1], HeadDamage[2])
						local Dano,DanoColete,DanoCapacete = CalcularDano(DanoBase, TotalDistTraveled, VitimaHuman, "Head")	
						Damage(VitimaHuman,Dano,DanoColete,DanoCapacete)
					elseif (par.Parent:IsA('Accessory') or par.Parent:IsA('Hat')) then
						local DanoBase = math.random(HeadDamage[1], HeadDamage[2])
						local Dano,DanoColete,DanoCapacete = CalcularDano(DanoBase, TotalDistTraveled, VitimaHuman, "Head")	
						Damage(VitimaHuman,Dano,DanoColete,DanoCapacete)
					elseif par.Name == "Torso" or par.Parent.Name == "Chest" or par.Parent.Name == "Waist" then
						local DanoBase = math.random(TorsoDamage[1], TorsoDamage[2])
						local Dano,DanoColete,DanoCapacete = CalcularDano(DanoBase, TotalDistTraveled, VitimaHuman, "Body")	
						Damage(VitimaHuman,Dano,DanoColete,DanoCapacete)
					elseif par.Name == "Right Arm" or par.Name == "Left Arm" or par.Name == "Right Leg" or par.Name == "Left Leg" or par.Parent.Name == "Back" or par.Parent.Name == "Leg1" or par.Parent.Name == "Leg2" or par.Parent.Name == "Arm1" or par.Parent.Name == "Arm2" then
						local DanoBase = math.random(LimbsDamage[1], LimbsDamage[2])
						local Dano,DanoColete,DanoCapacete = CalcularDano(DanoBase, TotalDistTraveled, VitimaHuman, "Body")	
						Damage(VitimaHuman,Dano,DanoColete,DanoCapacete)
					else
						local DanoBase = math.random(LimbsDamage[1], LimbsDamage[2])
						local Dano,DanoColete,DanoCapacete = CalcularDano(DanoBase, TotalDistTraveled, VitimaHuman, "Body")	
						Damage(VitimaHuman,Dano,DanoColete,DanoCapacete)
					end	


					end
				end
				ammo=ammo-1
				mag=(h.Position-pos).magnitude
				t.Humanoid.WalkSpeed = ShootingWalkspeed
				--print("Atirando")
				
				local TracerChance = math.random(1,100)
				
				if TracerChance <= Settings.TracerChance.Value then

					Evt.ACS_AI.AIBullet:FireAllClients(nil, t.Head.CFrame, Tracer, 0, 2200, (aim-h.Position).Unit,TracerColor,Ray_Ignore, BulletFlare, BulletFlareColor)

				end

			elseif FoundHuman == true and VitimaHuman.Health > 0 and game.Players:GetPlayerFromCharacter(VitimaHuman.Parent) and perception < 10 then
					perception = perception + Settings.Level.Value
					t.Humanoid.WalkSpeed = SearchingWalkspeed
					Memory = Settings.Level.Value * 100
					CanSee = true
			elseif perception > 0 then
					perception = perception - 1/Settings.Level.Value * 2
					t.Humanoid.WalkSpeed = SearchingWalkspeed
					CanSee = false
				elseif perception <= 0 then
					perception = 0
					t.Humanoid.WalkSpeed = RegularWalkspeed
					Memory = Memory - .25
			end
			--print(Memory)
		end
			wait(RPM) -- How fast the enemy shoots
			if ammo==0 then
				reload()
			end
		end
	end
end


-- 00Scorpion00